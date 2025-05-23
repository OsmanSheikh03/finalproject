using System;
using System.ComponentModel.DataAnnotations;

namespace File_Mgr_EF_JWT3.Models
{
    public class FileModelcs
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        public long Size { get; set; } // Size in KB

        public DateTime UploadDate { get; set; }

        [Required]
        public string Path { get; set; } // Physical file path

        [Required]
        public string OwnerEmail { get; set; } // User who uploaded the file

        public int DownloadCount { get; set; } = 0;
        public DateTime? LastAccessTime { get; set; }
        
        public string? SharedLink { get; set; } // Link for sharing the file
        public string? LinkPassword { get; set; } // Stores hashed password for security

    }
}
