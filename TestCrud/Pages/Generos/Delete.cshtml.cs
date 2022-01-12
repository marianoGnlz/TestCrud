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
    [Authorize(Roles = "Admin")]
    public class DeleteModel : PageModel
    {
        private readonly TestCrud.Data.TestCrudContext _context;

        public DeleteModel(TestCrud.Data.TestCrudContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Genero Genero { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Genero = await _context.Generos.FirstOrDefaultAsync(m => m.Id == id);

            if (Genero == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Genero = await _context.Generos.FindAsync(id);

            if (Genero != null)
            {
                _context.Generos.Remove(Genero);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
