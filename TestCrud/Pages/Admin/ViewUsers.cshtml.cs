using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace TestCrud.Pages.Admin
{
    [Authorize(Roles = "Admin")]
    public class ViewUsersModel : PageModel
    {
        private readonly TestCrudContext _context;

        public ViewUsersModel(TestCrudContext context)
        {
            _context = context;
        }

        public IList<User> Users { get; set; }

        public void OnGet()
        {
            Users = _context.Users.ToList();
        }
    }
}
