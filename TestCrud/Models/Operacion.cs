namespace TestCrud.Models
{
    public class Operacion
    {
        [Key]
        public int Id { get; set; }
        public TipoOperacion Tipo { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Precio { get; set; }
        public virtual User User { get; set; }
    }
}
