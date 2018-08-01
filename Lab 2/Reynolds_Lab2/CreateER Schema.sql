use master;

if DB_ID('Company') is Not Null
	drop database Company;
create database Company;
GO
use Company;
GO
create table Department(
	Dname varchar(15) NOT NULL,
	Dnumber int NOT NULL,
	MgrSSN char(9) NOT NULL,
	MgrStartDate Date,
	Primary key (Dnumber),
	Unique(Dname),

	);

create table Employee(
	Fname varchar(15) NOT NULL,
	Mint varchar(1),
	Lname varchar(15) NOT NULL,
	SSN Char(9) NOT NULL,
	Birthday date,
	Address varchar(30),
	Sex char(1),
	Salary decimal(10),
	SuperSSN char(9) ,
	DNO int NOT NULL,
	Primary Key (SSN),
	foreign key (SuperSSN) references Employee(SSN),
	foreign key (DNO) references Department(Dnumber),
	);

	alter table department
			ADD foreign key (MgrSSN) references employee(SSN);
	

create table Dept_Location(
	DNO int NOT NULL,
	Dlocation varchar(30) NOT NULL,
	primary key(DNO,Dlocation),
	foreign key (DNO) references Department(Dnumber),

);

create table Dependent(
	parentSSN char(9) NOT NULL, 
	Dependent_Name varchar(10) NOT NULL,
	Sex char(1),
	Birth_date date,
	realtionship varchar(15),

	primary key(Dependent_Name,parentSSN),
	foreign key (parentSSN) references employee(SSN)


);



create table Project(
	Pname varchar(15) NOT NULL,
	Pnumber int NOT NULL,
	Plocation varchar(30),
	Dnum int NOT NULL,
	Unique(Pname),
	primary key (Pnumber),
	foreign key (Dnum) references Department(Dnumber),

);

CREATE TABLE WORKS_ON
( 
Essn char(9) NOT NULL,
Pno int NOT NULL,
Hours decimal (3,1) NOT NULL,
primary key (Essn, Pno),
foreign key (Essn) references EMPLOYEE(SSN),
foreign key (Pno) references Project(Pnumber),
);