use FriendBook


CREATE TABLE UserInfo (
UserID varchar(20) not null,
fname varchar (20) not null,
lname varchar (20) not null,
address varchar(30),
email varchar(30),
phoneNum float (10),
password varchar(15)
Constraint UserPK
	primary key (UserID),
);

CREATE TABLE FriendsList(
FriendID varchar (20) NOT NULL,
UserID varchar (20),
FriendLName varchar (20),
Constraint FriendListPK
	primary key (UserID, FriendID),
Constraint UserIDFK
	foreign key (UserID) References UserInfo(UserID) On delete cascade on UPDATE Cascade,
Constraint FriendsListFK
	foreign key (FriendID) References UserInfo(UserID)
);
