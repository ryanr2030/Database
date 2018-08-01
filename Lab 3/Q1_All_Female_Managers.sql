Use Company
go


select e.Fname, e.Lname, e.Address
from employee e, Department d
where  e.SSN=d.MgrSSN and e.Sex='F';