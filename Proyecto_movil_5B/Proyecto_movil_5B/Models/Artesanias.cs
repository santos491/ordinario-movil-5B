using System.ComponentModel.DataAnnotations;

namespace Proyecto_movil_5B.Models
{
    public class Artesanias
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string img { get; set; }
        [Required]
        public string negocio { get; set; }
        [Required]
        public string descripcion { get; set; }
        [Required]
        public string direccion { get; set; }
        [Required]
        public float telefono { get; set; }

    }
}
