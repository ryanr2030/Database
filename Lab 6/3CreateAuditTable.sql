--Table used to record all changes to the department table

Create Table Audit_Dept_Table(
	date_of_change DATE NOT NULL,
	old_Dname varchar(15) NOT NULL,
	new_Dname varchar(15),
	old_Dnumber INT NOT NULL,
	new_Dnumber INT,
	old_MgrSSN char(9) NOT NULL,
	new_MgrSSN char(9)
);