namespace RMS_API.DTOs.AuthDTO.Request
{
    public class RestPasswordDTO
    {
       
            public string Email { get; set; }
            public int OTPCode { get; set; }
            public string NewPassword { get; set; }
        
    }
}
