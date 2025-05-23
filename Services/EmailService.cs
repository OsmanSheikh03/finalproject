using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using MailKit.Net.Smtp;
using MimeKit;
using Microsoft.Extensions.Configuration;
using System.Threading.Tasks;


namespace File_Mgr_EF_JWT3.Services
{
    public class EmailService
    {
        private readonly UserManager<IdentityUser> _userManager;

        private readonly IConfiguration _config;

        public EmailService(IConfiguration config)
        {
            _config = config;
        }


        //public EmailService(UserManager<IdentityUser> userManager)
        //{
        //    _userManager = userManager;
        //}

        public async Task SendEmailAsync(string recipientEmail, string subject, string message)
        {
            var email = new MimeMessage();
            email.From.Add(new MailboxAddress("YourApp", _config["EmailSettings:SenderEmail"]));
            email.To.Add(new MailboxAddress("Recipient", recipientEmail));
            email.Subject = subject;

            email.Body = new TextPart("plain")
            {
                Text = message
            };

            using var client = new SmtpClient();
            await client.ConnectAsync(_config["EmailSettings:SmtpServer"], int.Parse(_config["EmailSettings:Port"]), false);
            await client.AuthenticateAsync(_config["EmailSettings:SenderEmail"], _config["EmailSettings:SenderPassword"]);
            await client.SendAsync(email);
            await client.DisconnectAsync(true);
        }

        public async Task<string> SendVerificationEmail(string email)
        {
            var user = await _userManager.FindByEmailAsync(email);
            var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);
            var confirmationLink = $"https://your-app.com/confirm-email?token={token}&email={email}";

            return $"Email verification link: {confirmationLink}";
        }

    }
}
