
 use company
 go
 select e.Fname, e.Lname, e.Address, d.Dname
 from employee e, Department d
 where  e.SuperSSN IS NULL AND e.DNO=d.Dnumber;