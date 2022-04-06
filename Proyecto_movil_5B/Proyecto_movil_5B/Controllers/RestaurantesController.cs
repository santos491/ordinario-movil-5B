using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Proyecto_movil_5B.Data;
using Proyecto_movil_5B.Models;
using System.Linq;
using System.Threading.Tasks;

namespace Proyecto_movil_5B.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RestaurantesController : ControllerBase
    {
        private readonly ApplicationDbContext _db;
        public RestaurantesController(ApplicationDbContext db)
        {
            _db = db;

        }

        [HttpGet]
        public async Task<IActionResult> GetRestaurantes()
        {
            var lista = await _db.restaurantes.OrderBy(c => c.restaurante).ToListAsync();
            return Ok(lista);
        }

        [HttpPost]
        public async Task<IActionResult> AgregarRestaurantes([FromBody] Restaurantes restaurantes)
        {
            if (restaurantes == null)
            {
                return BadRequest(ModelState);
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _db.AddAsync(restaurantes);
            await _db.SaveChangesAsync();

            return Ok();
        }


    }
}

