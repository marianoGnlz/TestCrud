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

namespace TestCrud.Pages.Generos
{
    [Authorize]
    public class IndexModel : PageModel
    {
        private readonly TestCrud.Data.TestCrudContext _context;

        public IndexModel(TestCrud.Data.TestCrudContext context)
        {
            _context = context;
        }

        public IList<Genero> Genero { get;set; }

        public async Task OnGetAsync()
        {
            Genero = await _context.Generos.ToListAsync();
        }
    }
}
