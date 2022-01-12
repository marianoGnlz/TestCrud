using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace TestCrud.Pages.Admin
{
    [Authorize(Roles = "Admin")]
    public class CreateUserModel : PageModel
    {
        private readonly UserManager<User> _userManager;
        private readonly IUserStore<User> _userStore;
        private readonly IUserEmailStore<User> _emailStore;
        public CreateUserModel(
            UserManager<User> userManager,
            IUserStore<User> userStore,
            SignInManager<User> signInManager
            )
        {
            _userManager = userManager;
            _userStore = userStore;
            _emailStore = GetEmailStore();
        }
        [BindProperty]
        public User NewUser { get; set; }
        [BindProperty]
        public string Password { get; set; }
        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (ModelState.IsValid)
            {
                var user = CreateUser();

                await _userStore.SetUserNameAsync(user, NewUser.UserName, CancellationToken.None);
                await _emailStore.SetEmailAsync(user, NewUser.Email, CancellationToken.None);
                user.DNI = NewUser.DNI;

                IdentityResult result = new();
                try
                {
                    result = await _userManager.CreateAsync(user, Password);
                }
                catch (Exception)
                {

                }

                if (result.Succeeded)
                {
                    return RedirectToPage("ViewUsers");
                }

                return Page();

            }

            return Page();

        }
        private User CreateUser()
        {
            try
            {
                return Activator.CreateInstance<User>();
            }
            catch
            {
                throw new InvalidOperationException($"Can't create an instance of '{nameof(User)}'. " +
                    $"Ensure that '{nameof(User)}' is not an abstract class and has a parameterless constructor, or alternatively " +
                    $"override the register page in /Areas/Identity/Pages/Account/Register.cshtml");
            }
        }

        private IUserEmailStore<User> GetEmailStore()
        {
            if (!_userManager.SupportsUserEmail)
            {
                throw new NotSupportedException("The default UI requires a user store with email support.");
            }
            return (IUserEmailStore<User>)_userStore;
        }
    }
}
