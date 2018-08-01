/* List the names of all managers who have no dependents
*/
Use Company
Go
select Lname, Fname
from Employee
where exists 
	( select *
		from Department
		where SSN=MgrSSN )
		and
	not exists ( select *
	from Dependent
	where SSN=parentSSN )
