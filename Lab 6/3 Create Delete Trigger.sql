Create trigger EMPDEPTFK_DELETE
	on department
	for delete
AS
	declare @default int
	declare @old_Dname varchar(15)
	declare @old_Dnumber INT
	declare @old_MgrSSN INT
	set @default =1
BEGIN
	Update employee
		set DNO=@default
			from employee, deleted
			where employee.DNO=deleted.Dnumber;
	select @old_Dname=deleted.Dname,
		   @old_Dnumber=deleted.Dnumber,
		   @old_MgrSSN=deleted.MgrSSN
	from deleted;

	exec SP_audit_Dept @old_Dname, NULL, @old_Dnumber, NULL, @old_MgrSSN, NULL;
END