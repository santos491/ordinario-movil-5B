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
    public class LugarController : ControllerBase
    {
        private readonly ApplicationDbContext _db;
        public LugarController(ApplicationDbContext db)
        {
            _db = db;

        }

        [HttpGet]
        public async Task<IActionResult> GetLugares()
        {
            var lista = await _db.lugares.OrderBy(c => c.lugar).ToListAsync();
            return Ok(lista);
        }

        [HttpPost]
        public async Task<IActionResult> AgregarLugares([FromBody] Lugares lugar)
        {
            if (lugar == null)
            {
                return BadRequest(ModelState);
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            await _db.AddAsync(lugar);
            await _db.SaveChangesAsync();

            return Ok();
        }


    }
}
