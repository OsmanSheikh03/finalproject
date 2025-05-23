using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;


namespace File_Mgr_EF_JWT3.Pages
{
    public class ResetPasswordModel : PageModel
    {
        private readonly UserManager<IdentityUser> _userManager;

        public ResetPasswordModel(UserManager<IdentityUser> userManager)
        {
            _userManager = userManager;
        }

        [BindProperty]
        public string Token { get; set; }
        [BindProperty]
        public string Email { get; set; }
        [BindProperty]
        public string NewPassword { get; set; }

        public string Message { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            var user = await _userManager.FindByEmailAsync(Email);
            if (user == null)
            {
                Message = "User not found!";
                return Page();
            }

            var result = await _userManager.ResetPasswordAsync(user, Token, NewPassword);
            if (result.Succeeded)
            {
                Message = "Password reset successfully!";
                return RedirectToPage("/Login");
            }

            Message = "Reset failed!";
            return Page();
        }

        public void OnGet()
        {
        }
    }
}
