﻿using System.Security.Claims;
//using backendAlquimia.alquimia.Data;
using backendAlquimia.Models;
using backendAlquimia.alquimia.Services.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using alquimia.Data.Data.Entities;
using Humanizer;
using alquimia.Services.Services.Models;
using User = alquimia.Data.Data.Entities.User;

namespace backendAlquimia.Controllers
{
    [ApiController]
    [Route("cuenta")]
    public class AccountController : Controller
    {
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly ILogger<AccountController> _logger;
        private readonly IJwtService _jwtService;

        public AccountController(UserManager<User> userManager, SignInManager<User> signInManager, ILogger<AccountController> logger, IJwtService jwtService)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _logger = logger;
            _jwtService = jwtService;
        }

        [HttpPost("registrar-json")]
        public async Task<IActionResult> RegistrarJson([FromBody] RegisterDTO dto)
        {
            _logger.LogInformation("Intentando registrar usuario con email: {Email}", dto.Email);
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var usuarioExistente = await _userManager.FindByEmailAsync(dto.Email);
            if (usuarioExistente != null)
                return BadRequest(new { mensaje = "El email ya está registrado." });

            var nuevoUsuario = new User
            {
                UserName = GenerarUserNameSeguro(dto.Email),
                Email = dto.Email,
                SecurityStamp = Guid.NewGuid().ToString(), // Obligatorio
                Name = dto.Name?.Trim()
            };

            var result = await _userManager.CreateAsync(nuevoUsuario, dto.Password);
            if (!result.Succeeded)
            {
                _logger.LogError("Error al crear el usuario: {Errores}", result.Errors);
                return BadRequest(result.Errors);
            }

            // 🔁 Recuperar desde base de datos para garantizar que Id esté persistido
            var usuarioPersistido = await _userManager.FindByEmailAsync(dto.Email);
            if (usuarioPersistido == null)
                return StatusCode(500, new { mensaje = "No se pudo recuperar el usuario recién creado." });

            // ✅ Asignar rol si no lo tiene
            if (!await _userManager.IsInRoleAsync(usuarioPersistido, dto.Rol))
            {
                var roleResult = await _userManager.AddToRoleAsync(usuarioPersistido, dto.Rol);
                if (!roleResult.Succeeded)
                {
                    _logger.LogError("Error al asignar el rol: {Errores}", roleResult.Errors);
                    return BadRequest(new { mensaje = "Error al asignar el rol." });
                }
            }

            var roles = await _userManager.GetRolesAsync(usuarioPersistido);
            var token = _jwtService.GenerateToken(usuarioPersistido, roles);

            await _signInManager.SignInAsync(usuarioPersistido, isPersistent: false);
            _logger.LogInformation("Usuario registrado exitosamente: {Email}", dto.Email);
            return Ok(new { mensaje = "Usuario registrado correctamente.", token });
        }

        [HttpPost("login-json")]
        public async Task<IActionResult> LoginJson([FromBody] LoginDTO dto)
        {
            _logger.LogInformation("Intentando login para el email: {Email}", dto.Email);

            if (string.IsNullOrWhiteSpace(dto.Email) || string.IsNullOrWhiteSpace(dto.Password))
                return BadRequest(new { mensaje = "Email y contraseña son obligatorios." });


            var usuario = await _userManager.FindByEmailAsync(dto.Email);

            if (usuario == null)
            {
                _logger.LogWarning("Intento de login con email no registrado: {Email}", dto.Email);
                return Unauthorized(new { mensaje = "Usuario no encontrado." });
            }



            if (string.IsNullOrWhiteSpace(usuario.UserName) || usuario.Id == 0)
                return StatusCode(500, new { mensaje = "El usuario tiene datos incompletos (UserName o Id)." });

            var result = await _signInManager.CheckPasswordSignInAsync(usuario, dto.Password, lockoutOnFailure: false);

            if (!result.Succeeded)
                return Unauthorized(new { mensaje = "Credenciales inválidas." });
            var roles = await _userManager.GetRolesAsync(usuario);
            var token = _jwtService.GenerateToken(usuario, roles);
            await _signInManager.SignInAsync(usuario, isPersistent: false);
            _logger.LogInformation("Login exitoso para {Email}", dto.Email);
            return Ok(new { mensaje = "Login exitoso ✅", token });
        }

        [HttpGet("login-google")]
        public IActionResult LoginWithGoogle()
        {
            var redirectUrl = Url.Action("GoogleLoginCallback", "Cuenta");
            var properties = _signInManager.ConfigureExternalAuthenticationProperties("Google", redirectUrl);
            return Challenge(properties, "Google");
        }

        [HttpGet("signin-google")]
        public async Task<IActionResult> GoogleLoginCallback()
        {
            _logger.LogInformation("Callback de login con Google recibido");
            var info = await _signInManager.GetExternalLoginInfoAsync();
            if (info == null)
            {
                _logger.LogError("Fallo al obtener la información de login externo.");
                return Redirect("http://localhost:3000/Login?error=callback");
            }


            var result = await _signInManager.ExternalLoginSignInAsync(info.LoginProvider, info.ProviderKey, isPersistent: false);

            if (result.Succeeded)
            {
                return Redirect("http://localhost:3000/login/redirectgoogle");
            }

            // Crear el usuario si no existe
            var email = info.Principal.FindFirstValue(ClaimTypes.Email);
            var name = info.Principal.FindFirstValue(ClaimTypes.Name);

            var newUser = new User
            {
                Email = email,
                UserName = GenerarUserNameSeguro(email),
                Name = name,
                SecurityStamp = Guid.NewGuid().ToString() // ✅ agregado
            };

            var createResult = await _userManager.CreateAsync(newUser);
            if (!createResult.Succeeded)
                return Redirect("http://localhost:3000/Login?error=creation");
            var roles = await _userManager.GetRolesAsync(newUser);
            var token = _jwtService.GenerateToken(newUser, roles);
            await _userManager.AddLoginAsync(newUser, info);
            await _signInManager.SignInAsync(newUser, isPersistent: false);
            _logger.LogInformation("Google login info recibida para: {Email}", info.Principal.FindFirstValue(ClaimTypes.Email));
            return Redirect("http://localhost:3000/Login/RedirectGoogle");
        }
        [HttpPost("registrar-proveedor")]
        public async Task<IActionResult> RegistrarProveedor([FromBody] RegisterProviderDTO dto)
        {
            _logger.LogInformation("Intentando registrar proveedor con email: {Email}", dto.Email);

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var usuarioExistente = await _userManager.FindByEmailAsync(dto.Email);
            if (usuarioExistente != null)
                return BadRequest(new { mensaje = "El email ya está registrado." });

            var nuevoUsuario = new User
            {
                UserName = GenerarUserNameSeguro(dto.Email),
                Email = dto.Email,
                Name = dto.Name?.Trim(),
                EsProveedor = true,
                Empresa = dto.Empresa,
                Cuil = dto.Cuil,
                Rubro = dto.Rubro,
                OtroProducto = string.Join(",", dto.OtroProducto),
                //TarjetaNombre = dto.TarjetaNombre,
                TarjetaNumero = dto.TarjetaNumero,
                TarjetaVencimiento = dto.TarjetaVencimiento,
                TarjetaCVC = dto.TarjetaCVC
            };

            var result = await _userManager.CreateAsync(nuevoUsuario, dto.Password);
            if (!result.Succeeded)
            {
                _logger.LogError("Error al crear el usuario proveedor: {Errores}", result.Errors);
                return BadRequest(result.Errors);
            }

            // Reconfirmar existencia
            var usuarioPersistido = await _userManager.FindByEmailAsync(dto.Email);
            if (usuarioPersistido == null)
                return StatusCode(500, new { mensaje = "No se pudo recuperar el proveedor recién creado." });

            // Asignar rol de "Creador" inicialmente
            var rolInicial = "Creador";
            if (!await _userManager.IsInRoleAsync(usuarioPersistido, rolInicial))
            {
                var roleResult = await _userManager.AddToRoleAsync(usuarioPersistido, rolInicial);
                if (!roleResult.Succeeded)
                {
                    _logger.LogError("Error al asignar rol inicial: {Errores}", roleResult.Errors);
                    return BadRequest(new { mensaje = "Error al asignar el rol inicial." });
                }
            }

            var roles = await _userManager.GetRolesAsync(usuarioPersistido);
            var token = _jwtService.GenerateToken(usuarioPersistido, roles);

            await _signInManager.SignInAsync(usuarioPersistido, isPersistent: false);
            _logger.LogInformation("Proveedor registrado exitosamente como Creador: {Email}", dto.Email);

            return Ok(new { mensaje = "Proveedor registrado correctamente como creador en espera de aprobación.", token });
        }

        [HttpGet("auth/status")]
        public IActionResult Estado()
        {
            var usuario = User.Identity;
            return Ok(new
            {
                autenticado = usuario?.IsAuthenticated ?? false,
                nombre = usuario?.Name
            });
        }


        private string GenerarUserNameSeguro(string email)
        {
            if (string.IsNullOrWhiteSpace(email) || !email.Contains("@"))
                return Guid.NewGuid().ToString("N").Substring(0, 8);

            var nombre = email.Split('@')[0];

            // Eliminar caracteres no permitidos
            nombre = new string(nombre.Where(char.IsLetterOrDigit).ToArray());

            // Si quedó vacío, generamos uno al azar
            return string.IsNullOrWhiteSpace(nombre)
                ? Guid.NewGuid().ToString("N").Substring(0, 8)
                : nombre;
        }
    }

    

    }
