CREATE PROCEDURE User_Login_WithEmail
    @Email VARCHAR(255),
    @Password VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

   
    DECLARE @UserID INT;
    DECLARE @FirstName VARCHAR(255);
    DECLARE @LastName VARCHAR(255);
    DECLARE @Username VARCHAR(50);
    DECLARE @PhoneNumber VARCHAR(10);
    DECLARE @Profile_Image VARCHAR(255);
    DECLARE @isActive BIT;
    DECLARE @isVerified BIT;

    
    SELECT 
        @UserID = UserID,
        @FirstName = FirstName,
        @LastName = LastName,
        @Username = Username,
        @PhoneNumber = PhoneNumber,
        @Profile_Image = Profile_Image,
        @isActive = isActive,
        @isVerified = isVerified
    FROM Users
    WHERE Email = @Email AND [Password] = @Password;


    IF @UserID IS NOT NULL
    BEGIN
      
        IF @isActive = 1
        BEGIN
          
            IF @isVerified = 1
            BEGIN
         
                SELECT 
                    'Success' AS Status,
                    @UserID AS UserID,
                    @FirstName AS FirstName,
                    @LastName AS LastName,
                    @Username AS Username,
                    @Email AS Email,
                    @PhoneNumber AS PhoneNumber,
                    @Profile_Image AS ProfileImage,
                    @isActive AS IsActive,
                    @isVerified AS IsVerified;
            END
            ELSE
            BEGIN
             
                SELECT 'Error' AS Status, 'Account is not verified. Please verify your account.' AS Message;
            END
        END
        ELSE
        BEGIN
          
            SELECT 'Error' AS Status, 'Account is inactive. Please contact support.' AS Message;
        END
    END
    ELSE
    BEGIN
      
        SELECT 'Error' AS Status, 'Invalid email or password.' AS Message;
    END
END;


EXEC User_Login_WithEmail 
    @Email = 'ahmad@gmail.com', 
    @Password = 'Ahmad@12342';