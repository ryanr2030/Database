
use company
go


select e.fname, e.lname
from employee e
RIGHT JOIN DEPENDENT d ON d.relationship='Spouse'
RIGHT JOIN DEPENDENT o ON o.relationship='Daughter'
where e.SSN=d.parentSSN and e.SSN=o.parentSSN and d.parentSSN NOT IN (Select d2.parentSSN
	From Dependent d2
	WHERE d.parentSSN=d2.parentSSN and d2.relationship='Son')
Group BY e.fname, e.lname;
