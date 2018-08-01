use master;
GO
use Company;
GO

alter table Depend 
	Add constraint ForeignKey1
	foreign key (parentSSN) references Employee(SSN);
alter table Employee 
	Add constraint FoereignKey2
	foreign key (SuperSSN) references Employee(SSN),
	foreign key (DNO) references Department(Dnumber);
alter table Department ADD
	foreign key (MgrSSN) references Employee(SSN);
alter table Dept_Locations ADD
	foreign key (DNO) references Department(Dnumber);

