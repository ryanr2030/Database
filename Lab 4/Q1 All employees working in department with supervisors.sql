use company
go


SELECT D.Dnumber, A.fname, A.Lname, b.fname, b.lname
	from Department d
	FULL JOIN Employee a ON A.DNO=d.Dnumber
	FULL JOIN EMPLOYEE b ON b.ssn=a.SuperSSN
	WHERE d.DNUMBER IS NOT NULL
	Group by D.Dnumber, A.fname, A.Lname, b.fname, b.lname
	
