using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

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

        var url = $"https://api.mercadolibre.com/sites/MLA/search?q={Uri.EscapeDataString(q)}";
        var token = "APP_USR-1739781403101478-060613-4be2db98018c875853b7c845da8acf89-412861077";

        try
        {
            var request = new HttpRequestMessage(HttpMethod.Get, url);
            request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", token);
            request.Headers.UserAgent.ParseAdd("Mozilla/5.0");

            var response = await _httpClient.SendAsync(request);
            var content = await response.Content.ReadAsStringAsync();

            if (!response.IsSuccessStatusCode)
            {
                return StatusCode((int)response.StatusCode, new
                {
                    status = (int)response.StatusCode,
                    error = $"MercadoLibre API error: {content}"
                });
            }

            return Content(content, "application/json");
        }
        catch (Exception ex)
        {
            return StatusCode(500, new
            {
                status = 500,
                error = $"Excepción: {ex.Message}"
            });
        }
    }
}
