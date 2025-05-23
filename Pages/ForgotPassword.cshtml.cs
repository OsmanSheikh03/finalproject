using File_Mgr_EF_JWT3.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Threading.Tasks;

namespace File_Mgr_EF_JWT3.Pages
{
    public class ForgotPasswordModel : PageModel
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly EmailService _emailService;

        public ForgotPasswordModel(UserManager<IdentityUser> userManager, EmailService emailService)
        {
            _userManager = userManager;
            _emailService = emailService;
        }

        [BindProperty]
        public string Email { get; set; }
        public string Message { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            var user = await _userManager.FindByEmailAsync(Email);
            if (user == null)
            {
                Message = "Email not found!";
                return Page();
            }

            var token = await _userManager.GeneratePasswordResetTokenAsync(user);
            var resetLink = $"https://your-app.com/ResetPassword?token={token}&email={Email}";

            await _emailService.SendEmailAsync(Email, "Password Reset", $"Click here to reset: {resetLink}");

            Message = "Reset link sent! Check your email.";
            return Page();
        }

        public void OnGet()
        {
        }
    }
}
