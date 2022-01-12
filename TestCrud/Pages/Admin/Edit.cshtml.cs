#nullable disable
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace TestCrud.Pages.Admin
{
    [Authorize(Roles = "Admin")]
    public class EditModel : PageModel
    {
        private readonly TestCrudContext _context;

        public EditModel(TestCrudContext context)
        {
            _context = context;
        }
        [BindProperty]
        public UsersConRoles User { get; set; }
        public IList<IdentityRole> Roles { get; set; }


        public async Task<IActionResult> OnGetAsync(string? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            User = await _context.FN_UsersConRoles().Where(x => x.UserId == id).FirstOrDefaultAsync();

            if(User == null)
            {
                var newUser = await _context.Users.FirstOrDefaultAsync(u => u.Id == id);

                if(newUser == null)
                {
                    return NotFound();
                }

                User = new()
                {
                    UserName = newUser.UserName,
                    Email = newUser.Email,
                    UserId = newUser.Id,
                    RoleId = _context.Roles.FirstOrDefaultAsync(r => r.Name == "Default").Result.Id
                };

            }

            Roles = await _context.Roles.ToListAsync();

            ViewData["Roles"] = new SelectList(Roles, "Id", "Name");

            return Page();
        }

        public async Task<IActionResult> OnPostAsync([FromForm] string newRoleId)
        {

            var userActual = await _context.Users.FirstOrDefaultAsync(e => e.Id == User.UserId);
            var rolActual = await _context.UserRoles.FirstOrDefaultAsync(e => e.UserId == User.UserId && User.RoleId == e.RoleId);

            if(rolActual != null)
            {
                try
                {
                    _context.UserRoles.Remove(rolActual);
                    await _context.SaveChangesAsync();
                }
                catch (Exception)
                {
                    throw;
                }
            }

            userActual.UserName = User.UserName;
            userActual.Email = User.Email;

            IdentityUserRole<string> identityUserRole = new()
            {
                RoleId = newRoleId,
                UserId = userActual.Id
            };

            try
            {
                _context.Users.Update(userActual);
                _context.UserRoles.Add(identityUserRole);
                await _context.SaveChangesAsync();
            }
            catch (Exception)
            {
                throw;
            }


            return RedirectToPage("ViewUsers");
        }
    }
}
