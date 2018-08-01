Create Trigger EMPDEPTFK_DELETE
	on department
	for delete
as
	declare @default int
	set @default = 1
begin
		Update Employee
				set DNO=@default
				From employee, deleted
				where employee.DNO=deleted.Dnumber
				END
go
Delete from department where Dnumber=5;