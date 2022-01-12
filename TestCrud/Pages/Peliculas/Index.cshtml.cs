#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using TestCrud.Data;
using TestCrud.Models;

namespace TestCrud.Pages.Peliculas
{
    [Authorize]
    public class IndexModel : PageModel
    {
        private readonly TestCrudContext _context;

        public IndexModel(TestCrudContext context)
        {
            _context = context;
        }

        public IList<Pelicula> Pelicula { get;set; }

        public async Task OnGetAsync()
        {
            Pelicula = await _context.Peliculas
                        .Include(p => p.GeneroPeliculas)
                            .ThenInclude(g => g.Genero)
                        .ToListAsync();
        }
    }
}
