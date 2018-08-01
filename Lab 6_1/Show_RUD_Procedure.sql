Use FriendBook
GO
--Get Friends List of jdahl then get jdahl's information
EXEC SP_Get_FriendsList @UserId = 'jdahl';
EXEC SP_Get_UserInfo @UserId = 'jdahl';

--Update jdahl's information then show the updated information

EXEC SP_Update_UserInfo @UserId = 'jdahl', @fname='Jessica',  @lname='Smith', @address = '332 Somewhere with a Balcony Rd', 
	@email = 'jdahl@gmail.com', @phoneNum = '1231231234', @password='chalk';
EXEC SP_Get_UserInfo @UserId = 'jdahl';



--Delete the friend, Patrick Starr, patty12 from the user ryanr2030, Ryan Reynolds, friends list
EXEC SP_Delete_Friend @UserId='ryanr2030', @FriendID='patty12';
EXEC SP_Get_FriendsList @UserId = 'ryanr2030';


--Delete the User jdahl from the User's table showing the cascade deletion

EXEC SP_Delete_UserInfo @UserId = 'jdahl';

select * From UserInfo;
select * From FriendsList;
