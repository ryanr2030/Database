Use FriendBook;

--CREATE ADD PROCEDURE 
Set ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SP_Add_UserInfo
	(@UserID varchar(20),
	@fname varchar (20),
	@lname varchar (20) ,
	@address varchar(30),
	@email varchar(30),
	@phoneNum float (10),
	@password varchar(15))
	AS
	BEGIN
	INSERT INTO UserInfo(UserID, fname, lname, address, email, phoneNum, password)
	VALUES (@UserID, @fname, @lname, @address, @email, @phoneNum, @password)
	SET @UserID = SCOPE_IDENTITY();
	END 
	
	
--CREATE UPDATE PROCEDURE USING PK	
Set ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SP_Update_UserInfo
	(@UserID varchar(20),
	@fname varchar (20),
	@lname varchar (20) ,
	@address varchar(30),
	@email varchar(30),
	@phoneNum float (10),
	@password varchar(15))
	AS
	BEGIN

	UPDATE UserInfo
	SET  fname=@fname, lname = @lname, address = @address, email = @email, phoneNum=@phoneNum, password=@password
	WHERE UserID =@UserID;
	END 


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Retieve User's Info from UserInfo Table
CREATE PROCEDURE SP_Get_UserInfo(
	@UserID		varchar(30))
AS
BEGIN
	SELECT *
	FROM UserInfo U
	WHERE U.UserID = @UserID;
END


--Retrieve User's Friend's List
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter PROCEDURE SP_Get_FriendsList(
	@UserID		varchar(30))
AS
BEGIN
	SELECT U2.UserId AS FriendsId, U2.fname, U2.lname, U2.phoneNum, U2.Email, U2.address
	FROM FriendsList F, UserInfo U, UserInfo U2
	WHERE U.UserID = @UserID AND U.UserId = F.UserId AND F.FriendID = U2.UserID;
END
GO


--Add a Friend to Friend List
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SP_Add_Friend
	@UserId		varchar(30),
	@FriendID	varchar(30),
	@FriendLname varchar(30)

AS
BEGIN
	INSERT INTO FriendsList (UserId, FriendID, FriendLname)
	VALUES (@UserId, @FriendId, @FriendLname);
END
GO

--Delete a Friend from a user's friends list
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SP_Delete_Friend
	@UserId		varchar(30),
	@FriendId	varchar(30)
AS
BEGIN
	DELETE FROM FriendsList
	WHERE UserID = @UserID AND FriendID = @FriendID;
END
GO

--Delete a user from the UserInfo Table cascade deletes user from all friends lists
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SP_Delete_UserInfo
	@UserId		varchar(30)
AS
BEGIN
	DELETE FROM FriendsList
	WHERE UserID = @UserID OR FriendID = @UserId;
	DELETE FROM UserInfo 
	WHERE UserID = @UserID;
END
GO