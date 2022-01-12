using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace TestCrud.Pages
{
    [Authorize(Roles = "Admin")]
    public class CreateRoleModel : PageModel
    {
        private readonly RoleManager<IdentityRole> _roleManager;

        public CreateRoleModel(RoleManager<IdentityRole> roleManager)
        {
            _roleManager = roleManager;
        }
        public void OnGet()
        {
        }

        [BindProperty]
        [Display(Name = "Nombre del Rol")]
        public string RoleName { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            IdentityRole identityRole = new()
            {
                Name = RoleName
            };

            var result = await _roleManager.CreateAsync(identityRole);
            if (result.Succeeded)
            {
                return RedirectToPage("../Index");
            }

            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error.Description);
            }

            return Page();
        }
    }
}
