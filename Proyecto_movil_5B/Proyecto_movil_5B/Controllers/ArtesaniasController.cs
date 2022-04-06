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
    public class ArtesaniasController : ControllerBase
    {
        private readonly ApplicationDbContext _db;
        public ArtesaniasController(ApplicationDbContext db)
        {
            _db = db;

        }

        [HttpGet]
        public async Task<IActionResult> GetArtesanias()
        {
            var lista = await _db.artesanias.OrderBy(c => c.negocio).ToListAsync();
            return Ok(lista);
        }

        [HttpPost]
        public async Task<IActionResult> AgregarArtesanias([FromBody] Artesanias artesanias)
        {
            if (artesanias == null)
            {
                return BadRequest(ModelState);
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _db.AddAsync(artesanias);
            await _db.SaveChangesAsync();

            return Ok();
        }


    }
}
