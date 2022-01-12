namespace TestCrud.Models
{
    public class Devolucion
    {
        [Key]
        public int Id { get; set; }
        public bool Devuelto { get; set; } = false;
        public Operacion Operacion { get; set; }
    }
}
