

--creating all the tables in the COMPANY database with primary keys and foreign key constraints

use [FriendBook];

--creating the USER table

CREATE TABLE dbo.USERS (

	Fname		varchar(15)		not null,

	Minit		char,

	Lname		varchar(15)		not null,

	UserId		varchar(30)		not null,	--unique pk username string that user chooses

	Sex			char,

	Email		varchar(30),

	Phone		char(12),		--'440-263-5132' format

	Address		varchar(50),

	Constraint USERSPK

		primary key (UserId),	--UserId is the primary key

);

--creating the CONTACTS cross table (which shows the specific user's connections/friends)

CREATE TABLE dbo.CONTACTS (

	UserId		varchar(30)		not null,

	ContactId	varchar(30)		not null,

	Constraint CONTACTSPK

		primary key (UserId, ContactId),	--combo primary key

	Constraint USERIDFK

		foreign key (UserId) REFERENCES USERS(UserId) ON DELETE CASCADE ON UPDATE CASCADE,

	Constraint CONTACTFK

		foreign key (ContactId) REFERENCES USERS(UserId)

);

GO



--Creating all the stored procedures for the CRUDE functions

USE [FriendBook];



--Add a new User to USERS table

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE PROCEDURE SP_Add_User

	(@Fname		varchar(15),

	@Minit		char,

	@Lname		varchar(15),

	@UserId		varchar(30),

	@Sex		char,

	@Email		varchar(30),

	@Phone		char(12),

	@Address	varchar(50))

AS

BEGIN

	INSERT INTO USERS (Fname, Minit, Lname, UserId, Sex, Email, Phone, Address)

	VALUES (@Fname, @Minit, @Lname, @UserId, @Sex, @Email, @Phone, @Address)



	SET @UserId = SCOPE_IDENTITY();

END

GO



--Update a User's Information via UserId

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE PROCEDURE SP_Update_User_Info

	(@UserId		varchar(30),

	@Fname		varchar(15),

	@Minit		char,

	@Lname		varchar(15),

	@Sex		char,

	@Email		varchar(30),

	@Phone		char(12),

	@Address	varchar(50))

AS

BEGIN

	UPDATE USERS

	SET Fname = @Fname, Minit = @Minit, Lname = @Lname, Sex = @Sex, Email = @Email, Phone = @Phone, Address = @Address

	WHERE UserId = @UserId;

END

GO





--Retrieve a User's information from UserId

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE PROCEDURE SP_Get_User_Info(

	@UserId		varchar(30))

AS

BEGIN

	SELECT *

	FROM USERS U

	WHERE U.UserId = @UserId;

END

GO



--Retrieve a UserId's Contacts/Friends List from UserId

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE PROCEDURE SP_Get_Contacts(

	@UserId		varchar(30))

AS

BEGIN

	SELECT U2.UserId AS ContactId, U2.Fname, U2.Lname, U2.Phone, U2.Email, U2.Address

	FROM CONTACTS C, USERS U, USERS U2

	WHERE U.UserId = @UserId AND U.UserId = C.UserId AND C.ContactId = U2.UserId;

END

GO



--Add a Contact to Your Contacts Table via UserId & ContactId

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE PROCEDURE SP_Add_Contact

	@UserId		varchar(30),

	@ContactId	varchar(30)

AS

BEGIN

	INSERT INTO CONTACTS (UserId, ContactId)

	VALUES (@UserId, @ContactId);

END

GO



--Delete a Contact from a User's Contacts List

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE PROCEDURE SP_Delete_Contact

	@UserId		varchar(30),

	@ContactId	varchar(30)

AS

BEGIN

	DELETE FROM CONTACTS

	WHERE UserId = @UserId AND ContactId = @ContactId;

END

GO



--Delete a User from the Users List (also deletes all their entries in the CONTACTS table)

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE PROCEDURE SP_Delete_User

	@UserId		varchar(30)

AS

BEGIN

	DELETE FROM CONTACTS

	WHERE UserId = @UserId OR ContactId = @UserId;

	DELETE FROM USERS 

	WHERE UserId = @UserId;

END

GO



--Examples of Adding in Users via a manual SQL query insert or using the Stored Procedures

use [FriendBook];

--Add Users into the USERS Table manually via SQL

INSERT INTO USERS VALUES

	('Dean', 'J', 'Choi', 'deanzel', 'M', 'deanchoi@gmail.com', '440-263-5132', '8993 Crooked Creek Ln, Broadview Heights, OH'),

	('Franklin', 'T', 'Wong', 'fwong99@yahoo.com', 'M', 'fwong99@yahoo.com', '888-665-5555', '638 Voss, Houston, TX'),

	('John', 'B', 'Smith', 'smithers', 'M', 'john.b.smith@gmail.com', '321-654-0987', '731 Fondren, Houston, TX'),

	('Joyce', 'A', 'English', 'jae123', 'F', 'jae123@outlook.com', '453-453-4539', '5631 Rice, Houston, TX'),

	('Ramesh', 'K', 'Narayan', 'RammaNara', 'M', 'rammanara@hotmail.com', '667-688-4444','975 Fire Oak, Humble, TX'),

	('James', 'E', 'Borg', 'thebigboss', 'M', 'imincharge@yourboss.com', '880-866-5555', '450 Stone, Las Vegas, NV'),

	('Jennifer', 'S', 'Wallace', 'jennyfromtheblock', 'F', 'j.wall@gmail.com', '198-765-4321','291 Berry, Bellaire, TX'),

	('Ahmad', null, 'Jabbar', 'JabbarTheHut', null, 'jabbar.a@anon.com', null, null),

	('Alicia', null, 'Zelaya', 'alicia.z@yahoo.com', 'F', 'alicia.z@real.com', '599-988-7777', '3321 Castle, Spring, TX');



--Add Users into the Users Table via stored procedure SP_Add_User

EXEC SP_Add_User @Fname = 'Ricky', @Minit = 'F', @Lname = 'Bobby', @UserId = 'dagreatest', @Sex = 'M', 

	@Email = 'dagreatest@best.com', @Phone = '555-867-5309', @Address = '1337 Biggest House Dr, New York City, NY';

EXEC SP_Add_User @Fname = 'Broi', @Minit = 'W', @Lname = 'Deanzel', @UserId = 'dankzel', @Sex = 'M', 

	@Email = 'dankzel@gmail.com', @Phone = '123-456-7890', @Address = '4545 Glen Eagle Dr, Brecksville, OH';

EXEC SP_Add_User @Fname = 'Kardashian', @Minit = 'N', @Lname = 'Kim', @UserId = 'kim@kardashian.com', @Sex = 'F', 

	@Email = 'kim@kardashian.com', @Phone = '999-888-7777', @Address = '1 Of Many Houses Ln, Los Angeles, CA';

EXEC SP_Add_User @Fname = 'Beyonce', @Minit = null, @Lname = 'Knowles', @UserId = 'beyonce', @Sex = 'F', 

	@Email = 'beyonce@beyonce.com', @Phone = '111-000-1111', @Address = '99 Penthouse, New York City, NY';



--Add Contacts for Each UserId (essentially your Friends List cross table)

--manual SQL insert

INSERT INTO CONTACTS VALUES

	('deanzel', 'fwong99@yahoo.com'), ('fwong99@yahoo.com', 'deanzel'), ('kim@kardashian.com', 'beyonce'), ('thebigboss', 'deanzel'),

	('dankzel', 'deanzel'), ('dagreatest', 'dankzel'), ('rammanara', 'jabbarthehut'), ('jabbarthehut', 'rammanara'), ('beyonce', 'smithers');



--contact insert via stored procedure

EXEC SP_Add_Contact @UserId = 'deanzel', @ContactId = 'beyonce';

EXEC SP_Add_Contact @UserId = 'deanzel', @ContactId = 'dagreatest';

EXEC SP_Add_Contact @UserId = 'deanzel', @ContactId = 'jabbarthehut';

EXEC SP_Add_Contact @UserId = 'deanzel', @ContactId = 'kim@kardashian.com';

EXEC SP_Add_Contact @UserId = 'deanzel', @ContactId = 'jennyfromtheblock';

EXEC SP_Add_Contact @UserId = 'beyonce', @ContactId = 'deanzel';

EXEC SP_Add_Contact @UserId = 'beyonce', @ContactId = 'kim@kardashian.com';

EXEC SP_Add_Contact @UserId = 'beyonce', @ContactId = 'thebigboss';

EXEC SP_Add_Contact @UserId = 'fwong99@yahoo.com', @ContactId = 'jennyfromtheblock';

EXEC SP_Add_Contact @UserId = 'dankzel', @ContactId = 'jae123';



--SELECT * FROM USERS;

--SELECT * FROM CONTACTS;



--Execution of the RUD (Retrieve, Update, Delete) Stored Procedure Functions

USE [FriendBook];

--Get Friends List of User 'deanzel'

EXEC SP_Get_Contacts @UserId = 'deanzel';



--Get User information of User 'beyonce'

EXEC SP_Get_User_Info @UserId = 'beyonce';

--Update the User information of User 'beyonce'

EXEC SP_Update_User_Info @UserId = 'beyonce', @Fname='Beyonce', @Minit='G', @Lname='Knowles-Carter', @Sex = 'F', 

	@Email = 'beyonce@beyonce.me', @Phone = '911-911-9111', @Address = '911 Bigger Penthouse, New York City, NY';

EXEC SP_Get_User_Info @UserId = 'beyonce';



--Delete the Contact of 'fwong99@yahoo.com' from the user 'deanzel''s Contacts List

EXEC SP_Delete_Contact @UserId='deanzel', @ContactId='fwong99@yahoo.com';



--Delete the User 'beyonce' entirely from the USERS & CONTACTS table

EXEC SP_Delete_User @UserId = 'beyonce';



--Compare the current Query select return of the two tables to the original return right after we inserted

SELECT * FROM USERS;

SELECT * FROM CONTACTS;



USE master;

--Drops the database from master and this is allowed because all of its tables within have been dropped 

Drop DATABASE [FriendBook];