namespace TestCrud.Models
{
    public class Pelicula
    {
        public Pelicula()
        {
            GeneroPeliculas = new HashSet<GeneroPelicula>();
            Operaciones = new HashSet<Operacion>();
        }
        [Key]
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public int Disp_Alquiler { get; set; }
        public int Disp_Venta { get; set; }
        public decimal Precio_Base { get; set; }
        public ICollection<GeneroPelicula> GeneroPeliculas { get; set; }
        public ICollection<Operacion> Operaciones { get; set; }
    }
}
