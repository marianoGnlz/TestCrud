namespace TestCrud.Models
{
    public class GeneroPelicula
    {
        [Key]
        public int Id { get; set; }
        public virtual Pelicula Pelicula { get; set; }
        public virtual Genero Genero { get; set; }
    }
}
