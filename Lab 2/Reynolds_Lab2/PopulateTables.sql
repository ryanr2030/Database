use master;
GO
use [Company]
GO
Alter table Employee
NOCHECK Constraint FK__Employee__SuperS__267ABA7A, FK__Employee__DNO__276EDEB3;


INSERT INTO Employee values('John', 'B', 'Smith', '123456789', '1955-01-09', '731 Fondren, Houston, TX', 'M', 30000,'987654321', 5);
INSERT INTO Employee values('Franklin', 'T', 'Wong', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'M', 40000,'888665555', 5);
INSERT INTO Employee values('Joyce', 'A', 'English', '453453453', '1962-12-31', '5631 Rice, Houston, TX', 'F',25000, '333445555', 5);
INSERT INTO Employee values('Ramesh', 'K', 'Narayan', '666884444', '1952-09-15', 'Fire Oak, Humble, TX', 'M', 38000,'333445555', 5);
INSERT INTO Employee values('James', 'E', 'Borg', '888665555', '1927-11-10', 'Stone, Houston, TX', 'M', 55000, NULL,1);
INSERT INTO Employee values('Jennifer', 'S', 'Wallace', '987654321', '1931-06-20', 'Berry, Bellaire, TX', 'F',43000, '888665555', 4);
INSERT INTO Employee values('Ahmad', 'V', 'Jabbar', '987987987', '1959-03-29', 'Dallas, Houston, TX', 'M', 25000,'987654321', 4);
INSERT INTO Employee values('Alicia', 'J', 'Zelaya', '999887777', '1958-06-19', 'Castle, SPring, TX', 'F', 25000,'987654321', 4);


