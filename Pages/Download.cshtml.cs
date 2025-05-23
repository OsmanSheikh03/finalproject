using File_Mgr_EF_JWT3.Data;
using File_Mgr_EF_JWT3.Utilities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.IO;
using System.Linq;


namespace File_Mgr_EF_JWT3.Pages
{
    public class DownloadModel : PageModel
    {
        private readonly ApplicationDbContext _dbContext;

        public DownloadModel(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        [BindProperty]
        public string EnteredPassword { get; set; }

        public string Message { get; set; }

        [BindProperty(SupportsGet = true)]
        public int FileId { get; set; }

        public async Task<IActionResult> OnPostDownloadAsync()
        {
            var file = _dbContext.Files.FirstOrDefault(f => f.Id == FileId);
            if (file == null)
            {
                Message = "File not found!";
                return Page();
            }

            // Validate password
            //            if (!string.IsNullOrEmpty(file.LinkPassword) && !HashHelper.VerifyPassword(EnteredPassword, file.LinkPassword))
            if (!string.IsNullOrEmpty(file.LinkPassword) && (EnteredPassword != file.LinkPassword))
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
    }

}
