Create trigger EMPDEPTFK_UPDATE
	on Department
	for UPDATE
AS
	declare @old_Dname VARCHAR(15)
	declare @old_Dnumber INT
	declare @old_MgrSSN INT
	declare @new_Dname VARCHAR(15)
	declare @new_Dnumber INT
	declare @new_MgrSSN INT
BEGIN
	if UPDATE(Dnumber)
	UPDATE Employee
		set DNO = inserted.Dnumber
			From Employee, deleted, inserted
			where employee.DNO = deleted.Dnumber
	select @old_Dname = deleted.Dname,
		   @old_dnumber = deleted.Dnumber,
		   @old_MgrSSN=deleted.MgrSSN
		
	From deleted;
	select @new_Dname = inserted.Dname,
			@new_Dnumber = inserted.Dnumber,
			@new_MgrSSN = inserted.MgrSSN
	From inserted;

	EXEC SP_Audit_Dept @old_Dname, @new_Dname, @old_Dnumber, @new_Dnumber, @old_MgrSSN,@new_MgrSSN;
	END