Create Procedure SP_Audit_Dept(
	@old_Dname VARCHAR (15),
	@new_Dname VARCHAR (15),
	@old_Dnumber int,
	@new_Dnumber int, 
	@old_MgrSSN CHAR(9),
	@new_MgrSSN CHAR(9))
	AS
		declare @date_of_change DATE = GETDATE()
	BEGIN
		insert into Audit_dept_table Values(
			@date_of_change, @old_Dname, @new_Dname, @old_Dnumber, @new_Dnumber, 
			@old_MgrSSN, @new_MgrSSN);
	END