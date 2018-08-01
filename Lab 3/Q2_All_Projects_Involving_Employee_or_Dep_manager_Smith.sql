

 use company
 go

( select w.Pno
 from employee e, WORKS_ON w
 where e.Lname='Smith' AND e.SSN=w.ESSN )
 
  UNION
 (select p.Pnumber
 from employee e, Project p, Department d
 where e.Lname='Smith' And e.SSN=d.MgrSSN AND d.Dnumber=p.Dnum);
