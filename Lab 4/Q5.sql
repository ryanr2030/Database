
use company
go


Select Distinct e.lname, e.ssn 
From Works_on w, employee e,
(Select w2.pno, Count(w2.essn)
From Works_on w2, Employee e2
Where w2.essn = e2.ssn and e2.sex = 'M'
Group By w2.pno) As men(pno, Mcnt),

(Select w1.pno, Count(w1.essn)
From Works_on w1, Employee e1
Where w1.essn = e1.ssn AND e1.sex = 'F'
Group By w1.pno) As fem(pno, Fcnt)
where e.ssn = w.essn
AND w.Pno=fem.pno
AND men.pno = fem.pno
AND fem.Fcnt > men.Mcnt
Order By e.lname, e.SSN

