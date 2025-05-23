﻿using System.Security.Cryptography;
using System.Text;

namespace File_Mgr_EF_JWT3.Utilities
{
    public class HashHelper
    {
        public static string HashPassword(string password)
        {
            using var sha256 = SHA256.Create();
            var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            return Convert.ToBase64String(hashedBytes);
        }

        public static bool VerifyPassword(string input, string hashed)
        {
            return HashPassword(input) == hashed;
        }
    }

}
