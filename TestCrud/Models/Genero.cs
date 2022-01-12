namespace TestCrud.Models
{
    public class Genero
    {
        public Genero()
        {
            GeneroPeliculas = new HashSet<GeneroPelicula>();
        }
        [Key]
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public virtual ICollection<GeneroPelicula> GeneroPeliculas { get; set; }
    }
}
