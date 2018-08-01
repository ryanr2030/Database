use master;

if DB_ID('Company') is Not Null
	drop database Company;
create database Company;
GO
use Company;
GO

create table Employee(
	Fname varchar(10),
	Mint varchar(1),
	Lname varchar(15),
	SSN Char(9),
	Birthday date,
	Address varchar(30),
	Sex char(1),
	Salary decimal(10),
	SuperSSN char(9),
	DNO int
	);
create table Department(
	Dname char(15),
	Dnumber int,
	MgrSSN char(9),
	MgrStartDate Date,
	);