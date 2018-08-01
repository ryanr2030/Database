use company
go
use company
go


SELECT D.Dnumber, E.FNAME, E.LNAME, S.FNAME, S.LNAME
 FROM  EMPLOYEE E  LEFT OUTER JOIN EMPLOYEE S ON E.SuperSsn = S.SSN, DEPARTMENT D
 Where E.DNO=D.Dnumber
ORDER BY D.Dnumber, E.Fname; 