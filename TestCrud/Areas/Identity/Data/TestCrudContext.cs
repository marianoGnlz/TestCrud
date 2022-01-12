using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using TestCrud.Areas.Identity.Data;

namespace TestCrud.Data;

public class TestCrudContext : IdentityDbContext<User>
{
    public TestCrudContext(DbContextOptions<TestCrudContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Pelicula> Peliculas { get; set; }
    public virtual DbSet<Devolucion> Devoluciones { get; set; }
    public virtual DbSet<Genero> Generos { get; set; }
    public virtual DbSet<GeneroPelicula> GeneroPelicula { get; set; }
    public virtual DbSet<Operacion> Operaciones { get; set; }

    public IQueryable<UsersConRoles> FN_UsersConRoles()
        => FromExpression(() => FN_UsersConRoles());

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        // Customize the ASP.NET Identity model and override the defaults if needed.
        // For example, you can rename the ASP.NET Identity table names and more.
        // Add your customizations after calling base.OnModelCreating(builder);

        builder.Entity<UsersConRoles>()
                .ToTable("UsersConRoles")
               .HasKey(e => new { e.UserId });
        builder.HasDbFunction(typeof(TestCrudContext).GetMethod(nameof(FN_UsersConRoles)));

        builder.Entity<User>(entity =>
        {
            entity.HasIndex(e => e.DNI).IsUnique();
        });

    }
}
