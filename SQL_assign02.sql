# Create and use the database
CREATE DATABASE office_db;
USE office_db;

# Create Department table
CREATE TABLE Department (
    Dept_Code INT PRIMARY KEY,
    Dept_Name CHAR(30),
    Budget INT
);

# Insert data into Department
INSERT INTO Department VALUES
(1, "IT", 60000),
(2, "Finance", 50000),
(3, "HR", 70000),
(4, "Marketing", 45000),
(5, "Operations", 80000);

# Create Employee table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    First_Name CHAR(15),
    Last_Name CHAR(15),
    Dept_Code INT
);

# Insert data into Employee 
INSERT INTO Employee VALUES
(101, "Rajesh", "Kumar", 1),
(102, "Anita", "Sharma", 2),
(103, "Vikram", "Singh", 3),
(104, "Priya", "Patel", 1),
(105, "Amit", "Gupta", 2),
(106, "Neha", "Iyer", 4),
(107, "Suman", "Reddy", 3),
(108, "Arjun", "Verma", 5);

# View records
SELECT * FROM Department;
SELECT * FROM Employee;

# 1. Select unique last names from Employee
SELECT DISTINCT (Last_Name) FROM Employee;

# 2. Select all employees with the last name "Singh"
SELECT * FROM Employee WHERE Last_Name = "Singh";

# 3. Select employees who work in IT or Finance departments
SELECT * FROM Employee WHERE Dept_Code IN (1, 2);

# 4. Select employees whose last name starts with "S"
SELECT * FROM Employee WHERE Last_Name LIKE "S%";

# 5. Count the number of employees in each department
SELECT Dept_Code, COUNT(*) AS Employee_Count 
FROM Employee 
GROUP BY Dept_Code;

# 6. Calculate the total budget of all departments
SELECT SUM(Budget) AS Total_Budget FROM Department;

# 7. Select all employees and their corresponding department details
SELECT Employee.First_Name, Employee.Last_Name, Department.Dept_Name, Department.Budget
FROM Employee
JOIN Department ON Employee.Dept_Code = Department.Dept_Code;

# 8. Select employees working in departments with a budget greater than 60,000
SELECT Employee.First_Name, Employee.Last_Name, Department.Dept_Name
FROM Employee
JOIN Department ON Employee.Dept_Code = Department.Dept_Code
WHERE Department.Budget > 60000;

# 9. Select departments with budgets higher than the average budget
SELECT Dept_Name, Budget
FROM Department
WHERE Budget > (SELECT AVG(Budget) FROM Department);

# 10. Select the names of departments with more than 2 employees
SELECT Department.Dept_Name
FROM Department
WHERE Dept_Code IN (
    SELECT Dept_Code
    FROM Employee
    GROUP BY Dept_Code
    HAVING COUNT(*) > 2
);

# 11. Add a new department called "Legal" with a budget of 40,000
INSERT INTO Department (Dept_Code, Dept_Name, Budget)
VALUES (6, "Legal", 40000);
SELECT * FROM Department;

# 12. Add a new employee named "Ravi Kumar" to the Legal department
INSERT INTO Employee (Emp_ID, First_Name, Last_Name, Dept_Code)
VALUES (109, "Ravi", "Kumar", 6);
SELECT * FROM Employee;

# 13. Increase the budget of all departments by 5%
UPDATE Department
SET Budget = Budget * 1.05;
SELECT * FROM Department;

# 14. Move all employees from HR (code 3) to Marketing (code 4)
UPDATE Employee
SET Dept_Code = 4
WHERE Dept_Code = 3;
SELECT * FROM Employee;

# 15. Delete all employees in the Marketing department
DELETE FROM Employee WHERE Dept_Code = 4;
SELECT * FROM Employee;

# 16. Delete employees who work in departments with a budget greater than 70,000
DELETE FROM Employee
WHERE Dept_Code IN (
    SELECT Dept_Code
    FROM Department
    WHERE Budget > 70000
);
SELECT * FROM Employee;

# 17. Delete all employees from the Employee table
DELETE FROM Employee;
SELECT * FROM Employee;
