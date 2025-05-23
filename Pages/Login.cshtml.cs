using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace File_Mgr_EF_JWT3.Pages
{
    public class LoginModel : PageModel
    {
        public void OnGet()
        {
        }
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IConfiguration _config;

        public LoginModel(SignInManager<IdentityUser> signInManager, UserManager<IdentityUser> userManager, IConfiguration config)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            _config = config;
        }

        [BindProperty]
        public string Email { get; set; }

        [BindProperty]
        public string Password { get; set; }

        public string Message { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            var user = await _userManager.FindByEmailAsync(Email);
            if (user == null)
            {
                Message = "Invalid credentials!";
                return Page();
            }

            var result = await _signInManager.PasswordSignInAsync(user, Password, false, false);
            if (result.Succeeded)
                return RedirectToPage("Dashboard");

            Message = "Login failed!";
            return Page();
        }
    }
}
