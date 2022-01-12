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

namespace TestCrud.Pages.Generos
{
    [Authorize(Roles = "Admin")]
    public class CreateModel : PageModel
    {
        private readonly TestCrud.Data.TestCrudContext _context;

        public CreateModel(TestCrud.Data.TestCrudContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
       
        public Genero Genero { get; set; }

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Generos.Add(Genero);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
