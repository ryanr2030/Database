Use Friendbook
INSERT INTO UserInfo(UserID, fname, lname, address, email, phoneNum, password) VALUES
('ryanr2030', 'Ryan', 'Reynolds', '1234 Coventry Road', 'rreynold@csu.edu','2161234567', 'password'),
('jdahl', 'Jessie', 'Dahlhausen', '9999 Hampshire', 'goldenretriever@ruff.com','2169876969', 'chalk'),
('patty12', 'Patrick', 'Star', '120 Conch Street', 'patrickstart@bikkinibottom.net','6541112222', 'youllneverguess')
;

EXEC SP_Add_UserInfo @UserId='johnnyC', @fname='Johnny', @lname='Cruise', @address='1679 Lamberton road', @email='johnnyc@csu.edu', @phoneNum='4408889090', @password='help1';