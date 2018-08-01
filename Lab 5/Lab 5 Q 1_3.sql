

ALTER VIEW VDept_Budget(Dept_Name, Dept_Number, No_Emp, Sum_Salary, Ave_Salary) AS
SELECT D.dname, D.dnumber, Count(E.dno), Sum(E.salary), (Sum(E.salary)/Count(E.DNO))
FROM Department D Left Outer Join Employee E
ON D.Dnumber = E.dno
Group By D.dname, D.dnumber;

