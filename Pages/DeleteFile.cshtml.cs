using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using File_Mgr_EF_JWT3.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;


namespace File_Mgr_EF_JWT3.Pages
{
    public class DeleteFileModel : PageModel
    {
        private readonly ApplicationDbContext _dbContext;

        public DeleteFileModel(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        [BindProperty(SupportsGet = true)]
        public int FileId { get; set; }

        public string Message { get; set; }

        public async Task<IActionResult> OnPostDeleteAsync(int FileId)
        {
            var file = _dbContext.Files.FirstOrDefault(f => f.Id == FileId);
            if (file == null)
            {
                return new JsonResult(new { message = "File not found" }) { StatusCode = 400 };
            }

            var filePath = Path.Combine(Directory.GetCurrentDirectory(), file.Path.Replace("\\", "/"));

            try
            {
                if (System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath); // Delete the actual file
                }

                _dbContext.Files.Remove(file);
                await _dbContext.SaveChangesAsync();
            }
            catch
            {
                return new JsonResult(new { message = "Error while deleting file" }) { StatusCode = 500 };
            }

            return new JsonResult(new { message = "File deleted successfully" });
        }

        public void OnGet()
        {
        }
    }
}
