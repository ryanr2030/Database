use master;
go
use company;
go


INSERT INTO Employee values('Ryan','P','Reynolds', '111111111','1995-07-14','2330 Coventry, Cleveland, OH', 'M', 90000, '888665555', 5);
INSERT INTO WORKS_ON VALUES('111111111', 1, 92);
INSERT INTO DEPENDENT VALUES('111111111', 'Chad', 'M','2000-01-01', 'Son');