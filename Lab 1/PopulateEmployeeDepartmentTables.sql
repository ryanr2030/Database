use [Company];
go

insert  into Employee values('John','B','Smith','123456789','09-Jan-55', 
	'731 Fondren, Houston, TX','M',30000.00 ,'987654321',5);
insert into Employee values('Franklin','T','Wong','333445555','08-Dec-1945',
	'638 Voss, Houston, TX','M',40000,'888665555',5);
insert into Employee values ('Joyce','A','English','453453453','31-Jul-62',
	'5631 Rice, Houston, TX','F',25000,'333445555',5);
insert into Employee values('Ramesh','K','Narayan','666884444','15-Sep-52',
	'975 Fire Oak, Humble, TX','M',38000,'333445555',5);
insert into Employee values('James','E','Borg','888665555','10-Nov-1927',
	'450 Stone, Houston, TX','M',55000,null,1);
insert into Employee values('Jennifer','S','Wallace','987654321','20-Jun-1931',
	'291 Berry, Bellaire, TX','F',43000,'888665555',4);
insert into Employee values('Ahmad','V','Jabbar','987987987','29-Mar-59',
	'980 Dallas, Houston, TX','M',25000,'987654321',4);
insert into Employee values('Alicia','J','Zelaya','999887777','19-Jul-58',
	'3321 Castle, Spring, TX','F',25000,'987654321',4);

insert into Department values('Headquarters',1,'888665555','19-Jun-71');
insert into Department values('Administation',4,'987654321','01-Jan-85');
insert into Department values('Research',5,'333445555','22-May-78');
insert into Department values('Automation',7,'123456789','06-Oct-1905');