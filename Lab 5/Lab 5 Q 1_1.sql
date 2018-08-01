CREATE VIEW VDept_Budget(Dept_Name, Dept_Num, No_Emp) as
SELECT D.dname, D.dnumber, Count(E.dno)
FROM Department D Left Outer Join Employee E
ON D.Dnumber = E.dno
Group By D.dname, D.dnumber


