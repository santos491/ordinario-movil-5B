using Microsoft.EntityFrameworkCore;
using Proyecto_movil_5B.Models;

namespace Proyecto_movil_5B.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }
        public DbSet<Lugares> lugares { get; set; }
        public DbSet<Restaurantes> restaurantes { get; set; }
        public DbSet<Artesanias> artesanias { get; set; }

    }
}
