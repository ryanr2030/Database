use company
go

Create Trigger EMPDEPTFK_UPDATE
	ON Department
	FOR UPDATE
AS
	IF UPDATE(Dnumber)
Begin
	Update Employee
		set DNO=inserted.Dnumber
			from Employee, deleted, inserted
			where Employee.DNO = deleted.Dnumber
			END
GO
Update Department SET DNUMBER = 99 WHERE Dnumber = 4;