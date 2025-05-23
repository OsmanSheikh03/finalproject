using File_Mgr_EF_JWT3.Data;
using File_Mgr_EF_JWT3.Models;
using File_Mgr_EF_JWT3.Utilities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.IO;
using System.Linq;


namespace File_Mgr_EF_JWT3.Pages
{
    
    public class DashboardModel : PageModel
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ApplicationDbContext _dbContext;

        public DashboardModel(UserManager<IdentityUser> userManager, ApplicationDbContext dbContext)
        {
            _userManager = userManager;
            _dbContext = dbContext;
        }

        [BindProperty]
        public IFormFile UploadedFile { get; set; } // Add this property

        [BindProperty]
        public string? Password { get; set; } // <-- Add this property


        public string CurrentUser { get; set; }
        public List<FileModelcs> Files { get; set; }

        public async Task<IActionResult> OnPostGenerateLinkAsync(int fileId, string password, DateTime expiration)
        {
            var user = await _userManager.GetUserAsync(User);
            var file = _dbContext.Files.FirstOrDefault(f => f.Id == fileId && f.OwnerEmail == user.Email);

            if (file != null)
            {
                // var link = $"https://localhost:7122/FileDownload?id={file.Id}&pwd={password}&exp={expiration}";
                var link = $"https://localhost:7122/Download?id={file.Id}&pwd={password}";
                file.SharedLink = link;
                file.LinkPassword = password;
              //  file.LinkExpiration = expiration;
                await _dbContext.SaveChangesAsync();
            }

            return RedirectToPage("/Dashboard");
        }
        public string Message { get; set; }
        [BindProperty]
        public string EnteredPassword { get; set; }

        public async Task<IActionResult> OnGetDownloadAsync(int fileId)
        {
            var file = _dbContext.Files.FirstOrDefault(f => f.Id == fileId);
            if (file == null)
            {
                Message = "File not found!";
                return Page();
            }

            // Validate password
            if (!string.IsNullOrEmpty(file.LinkPassword) && !HashHelper.VerifyPassword(EnteredPassword, file.LinkPassword))
            {
                Message = "Incorrect password.";
                return Page();
            }

            // Convert relative path to absolute path
            var absoluteFilePath = Path.Combine(Directory.GetCurrentDirectory(), file.Path.Replace("\\", "/"));

            if (!System.IO.File.Exists(absoluteFilePath))
            {
                Message = "File does not exist on the server.";
                return Page();
            }

            file.DownloadCount++;
            file.LastAccessTime = DateTime.UtcNow;
            await _dbContext.SaveChangesAsync();

            return File(System.IO.File.ReadAllBytes(absoluteFilePath), "application/octet-stream", file.Name);

        }
        // for uploading files
        public async Task<IActionResult> OnPostAsync()
        {
            var user = await _userManager.GetUserAsync(User);
            if (UploadedFile != null && user != null)
            {
                var filePath = Path.Combine("wwwroot/uploads", UploadedFile.FileName);
                using var stream = new FileStream(filePath, FileMode.Create);
                await UploadedFile.CopyToAsync(stream);

                var fileRecord = new FileModelcs
                {
                    Name = UploadedFile.FileName,
                    Size = UploadedFile.Length / 1024, // Convert to KB
                    UploadDate = DateTime.UtcNow,
                    Path = filePath,
                    OwnerEmail = user.Email,
                    SharedLink = null, // <-- Initialize shared link to null
                    LinkPassword = Password // <-- Store the password
                };

                _dbContext.Files.Add(fileRecord);
                await _dbContext.SaveChangesAsync();
            }

            return RedirectToPage("/Dashboard");
        }

        public async Task<IActionResult> OnPostGenerateSecureLinkAsync(int fileId, string password)
        {
            var user = await _userManager.GetUserAsync(User);
            var file = _dbContext.Files.FirstOrDefault(f => f.Id == fileId && f.OwnerEmail == user.Email);

            if (file != null)
            {
                file.SharedLink = $"https://your-app.com/FileDownload?id={file.Id}";
                file.LinkPassword = HashHelper.HashPassword(password);
                await _dbContext.SaveChangesAsync();
            }

            return RedirectToPage("/Dashboard");
        }


        //public void OnGet()
        //{
        //    var user = _userManager.GetUserAsync(User).Result;
        //    CurrentUser = user.Email;

        //    // Retrieve user files from database
        //    Files = _dbContext.Files.Where(f => f.OwnerEmail == user.Email).ToList();
        //}
        public async Task<IActionResult> OnGetAsync()
        {
            var user = await _userManager.GetUserAsync(User);
            if (user == null || user.Email == null)
            {
                return RedirectToPage("Login");
            }

            // Check if JWT token exists
            //var token = Request.Cookies["auth_token"];
            //if (string.IsNullOrEmpty(token))
            //{
            //    return Unauthorized(); // Reject access if token is missing
            //}

            CurrentUser = user.Email; // No CS8601 warning now, as null check is added
            Files = _dbContext.Files.Where(f => f.OwnerEmail == user.Email).ToList();

            return Page();
        }

    }
}
