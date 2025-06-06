using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;

[ApiController]
[Route("api/[controller]")]
public class MercadoLibreController : ControllerBase
{
    private readonly HttpClient _httpClient;

    public MercadoLibreController(IHttpClientFactory httpClientFactory)
    {
        _httpClient = httpClientFactory.CreateClient();
    }

    [HttpGet("buscar")]
    public async Task<IActionResult> Buscar([FromQuery] string q)
    {
        if (string.IsNullOrWhiteSpace(q))
            return BadRequest("Falta el parámetro de búsqueda (q)");

        var baseUrl = $"https://api.mercadolibre.com/sites/MLA/search?q={Uri.EscapeDataString(q)}";

        try
        {
            // 1. Intento sin token
            var request = new HttpRequestMessage(HttpMethod.Get, baseUrl);
            request.Headers.UserAgent.ParseAdd("Mozilla/5.0"); // para evitar bloqueo

            var response = await _httpClient.SendAsync(request);

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                return Content(content, "application/json");
            }

            // 2. Si falló (403, 401...), reintento con token
            var token = "APP_USR-1739781403101478-060613-4be2db98018c875853b7c845da8acf89-412861077";

            var retryRequest = new HttpRequestMessage(HttpMethod.Get, baseUrl);
            retryRequest.Headers.Authorization = new AuthenticationHeaderValue("Bearer", token);
            retryRequest.Headers.UserAgent.ParseAdd("Mozilla/5.0");

            var retryResponse = await _httpClient.SendAsync(retryRequest);

            if (!retryResponse.IsSuccessStatusCode)
                return StatusCode((int)retryResponse.StatusCode, await retryResponse.Content.ReadAsStringAsync());

            var retryContent = await retryResponse.Content.ReadAsStringAsync();
            return Content(retryContent, "application/json");
        }
        catch (Exception ex)
        {
            return StatusCode(500, $"Error en la API: {ex.Message}");
        }
    }
}
