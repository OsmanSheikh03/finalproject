using File_Mgr_EF_JWT3.Data;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using File_Mgr_EF_JWT3.Models;

namespace File_Mgr_EF_JWT3.Pages
{
    public class FileUploadModel : PageModel
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ApplicationDbContext _dbContext;

        public FileUploadModel(UserManager<IdentityUser> userManager, ApplicationDbContext dbContext)
        {
            _userManager = userManager;
            _dbContext = dbContext;
        }

        [BindProperty]
        public IFormFile UploadedFile { get; set; }

        [BindProperty]
        public string? Password { get; set; } // <-- Add this property


        public async Task<IActionResult> OnPostAsync()
        {
            {
                var user = await _userManager.GetUserAsync(User);
                if (UploadedFile != null && user != null)
                {
                    var filePath = Path.Combine("wwwroot/uploads", UploadedFile.FileName);
                    using var stream = new FileStream(filePath, FileMode.Create);
                    await UploadedFile.CopyToAsync(stream);

                    // Save file data to database
                    var fileRecord = new FileModelcs
                    {
                        Name = UploadedFile.FileName,
                        Size = UploadedFile.Length / 1024, // Convert to KB
                        UploadDate = DateTime.UtcNow,
                        Path = filePath,
                        OwnerEmail = user.Email,
                        LinkPassword = Password // <-- Store the password
                    };

                    _dbContext.Files.Add(fileRecord);
                    await _dbContext.SaveChangesAsync();
                }

                return RedirectToPage("/Dashboard");
            }

        }

        public void OnGet()
        {
            ViewData["AntiForgeryToken"] = HttpContext.RequestServices.GetRequiredService<IAntiforgery>().GetAndStoreTokens(HttpContext).RequestToken;
        }
    }
}
