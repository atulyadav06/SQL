create database company;
use company ; 

Create Table Salary (
Employid int primary key,
name varchar (50),
department varchar (50),
salary int CHECK (salary>35000) ,
joiningdate date 
);

INsert into Salary
(employid, name,  department, salary, joiningdate)
VALUES
(1, "Atul", "IT", 50000, "2024-09-12"),
(2, "Manya", "DataAnalysis", 35000, "2024-06-08"),
(3, "Kuldeep", "DataEngineer", 45000, "2024-09-12"),
(4, "Yash", "bussinessanalyst", 55000, "2024-04-12"),
(5, "heena", "Javadeveloper", 40000, "2024-08-13");

Select * from Salary WHERE department = "IT" or SALAry > 35000;
UPDATE Salary
SET Department = "IT"
WHERE Employid = 2;

Select department, SUM(salary) AS Totalsalary
from Salary
Group by department;


Select * from  Salary
order by joiningdate Desc
limit 1;