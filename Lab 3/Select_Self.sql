Use Company
go
select e.*, w.*, d.*
From employee e, Works_On w, Dependent d
where e.SSN='111111111'  AND w.ESSN='111111111' AND d.parentSSN='111111111';
 