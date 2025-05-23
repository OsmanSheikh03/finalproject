using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using File_Mgr_EF_JWT3.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;


namespace File_Mgr_EF_JWT3.Pages
{
    public class RenameFileModel : PageModel
    {
        private readonly ApplicationDbContext _dbContext;

        public RenameFileModel(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        [BindProperty(SupportsGet = true)]
        public int FileId { get; set; }

        [BindProperty]
        public string NewFileName { get; set; }

        public string Message { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            var file = _dbContext.Files.FirstOrDefault(f => f.Id == FileId);
            if (file == null)
            {
                Message = "File not found!";
                return Page();
            }

            // Get current file path
            var currentFilePath = Path.Combine(Directory.GetCurrentDirectory(), file.Path.Replace("\\", "/"));

            // Get new file path
            var newFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads", NewFileName);

            if (!System.IO.File.Exists(currentFilePath))
            {
                Message = "File does not exist on the server.";
                return Page();
            }

            try
            {
                // Rename the actual file
                System.IO.File.Move(currentFilePath, newFilePath);

                // Update database entry
                file.Name = NewFileName;
                file.Path = newFilePath;
                await _dbContext.SaveChangesAsync();
            }
            catch
            {
                Message = "An error occurred while renaming the file.";
                return Page();
            }

            return RedirectToPage("/Dashboard");
        }


        public void OnGet()
        {
        }
    }
}
