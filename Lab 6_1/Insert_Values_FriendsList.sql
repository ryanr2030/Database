USE Friendbook
INSERT INTO FriendsList( FriendID, UserID, FriendLName) VALUES
('ryanr2030', 'jdahl', 'Reynolds'),
('jdahl', 'ryanr2030', 'Dahlhausen'),
('patty12', 'ryanr2030', 'Star');

EXEC SP_Add_Friend @UserID='patty12', @FriendID='jdahl', @FriendLname='Star';

