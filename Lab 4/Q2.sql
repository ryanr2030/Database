use company
go

select e.SSN, e.Lname
from employee e, WORKS_ON w
where e.SSN=w.Essn AND e.Sex='F'
Group by e.SSN, e.Lname
Having Count(w.Essn)>2;