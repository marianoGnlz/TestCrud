#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using TestCrud.Data;
using TestCrud.Models;

namespace TestCrud.Pages.Peliculas
{
    [Authorize(Roles = "Admin")]
    public class CreateModel : PageModel
    {
        private readonly TestCrud.Data.TestCrudContext _context;

        public CreateModel(TestCrud.Data.TestCrudContext context)
        {
            _context = context;
        }

        public IList<Genero> Generos { get; set; }

        public IActionResult OnGet()
        {
            Generos = _context.Generos.ToList();
            ViewData["Generos"] = new SelectList(Generos, "Id", "Nombre");
            return Page();
        }

        [BindProperty]
        public Pelicula Pelicula { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync([FromForm] int IdGenero)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            Genero Genero = _context.Generos.FirstOrDefault(g => g.Id == IdGenero);

            GeneroPelicula generoPelicula = new()
            {
                Genero = Genero,
                Pelicula = Pelicula
            };

            _context.GeneroPelicula.Add(generoPelicula);
            _context.Peliculas.Add(Pelicula);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
