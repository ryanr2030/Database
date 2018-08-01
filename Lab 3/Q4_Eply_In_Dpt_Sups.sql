/*for each department list all employees who are working in the depatemnt with the 
employee's first and last name and first and last name of his or her immediate supervisor
list the result in the order of each deparment number and derpatment name.
Extra: Include all the employees who do not have any supervisor as well in the list */

use company
go

 select Distinct d.Dnumber, d.Dname, e.Fname, e.Lname, e.SuperSSN, e.Fname, e.Lname
 from employee e, Department d, Employee s
 where  e.SuperSSN IS NULL AND e.DNO=d.Dnumber
 Group By  D.Dnumber, D.Dname, e.Fname, e.Lname, e.SuperSSN, e.Fname, e.Lname
Union
select d.Dnumber, d.Dname, e.Fname, e.Lname, e.SuperSSN, s.Fname, s.Lname
from employee e, department d, Employee s
Where e.DNO=d.Dnumber AND s.SSN=e.SuperSSN
Group By D.Dnumber, D.Dname, e.Fname, e.Lname, e.SuperSSN, s.Fname, s.Lname



	



