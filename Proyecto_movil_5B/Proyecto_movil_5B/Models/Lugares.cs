using System.ComponentModel.DataAnnotations;

namespace Proyecto_movil_5B.Models
{
    public class Lugares
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string img { get; set; }
        [Required]
        public string lugar { get; set; }
        [Required]
        public string descripcion { get; set; }
        [Required]
        public string direccion { get; set; }
    }
}
