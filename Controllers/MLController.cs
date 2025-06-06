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

    var url = $"https://api.mercadolibre.com/sites/MLA/search?q={Uri.EscapeDataString(q)}";

    // Token fijo para reintento (en producción deberías refrescarlo dinámicamente)
    var token = "APP_USR-1739781403101478-060613-4be2db98018c875853b7c845da8acf89-412861077";

    try
    {
        // Intento sin token
        var request = new HttpRequestMessage(HttpMethod.Get, url);
        request.Headers.UserAgent.ParseAdd("Mozilla/5.0");

        var response = await _httpClient.SendAsync(request);

        if (response.IsSuccessStatusCode)
            return Content(await response.Content.ReadAsStringAsync(), "application/json");

        // Reintento con token
        var retry = new HttpRequestMessage(HttpMethod.Get, url);
        retry.Headers.Authorization = new AuthenticationHeaderValue("Bearer", token);
        retry.Headers.UserAgent.ParseAdd("Mozilla/5.0");

        var retryResponse = await _httpClient.SendAsync(retry);

        var responseContent = await retryResponse.Content.ReadAsStringAsync();

        if (!retryResponse.IsSuccessStatusCode)
        {
            return StatusCode((int)retryResponse.StatusCode, new
            {
                status = (int)retryResponse.StatusCode,
                error = $"Error con token: {responseContent}"
            });
        }

        return Content(responseContent, "application/json");
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
