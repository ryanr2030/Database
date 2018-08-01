
use company
go


select Distinct e.fname, e.lname
from employee e
	Inner Join department d ON e.DNO=d.Dnumber
	Inner Join Dependent p ON e.SSN=p.parentSSN
where p.relationship!='Son' or p.relationship!='Daughter' and d.Dname='Research' and p.relationship='Spouse'
GROUP BY E.FNAME, E.LNAME
having COUNT(p.parentSSN)<2