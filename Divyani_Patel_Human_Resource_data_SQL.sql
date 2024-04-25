-- DDL
-- create database 
create database cs01;
-- shows list of all databases 
show databases;
-- acess database 
use cs01;

/*
Alter Queries on Human Resources Dataset
*/
select * from human_resource;
-- 1. Alter 
-- add column at first
alter table human_resource add column Sr_no int first;
desc human_resource;

-- add column after existing column 
alter table human_resource add column contact double after EmpID;
select* from human_resource;

-- 2. Drop 
-- drop column from table
alter table human_resource drop column EmpStatusID;
alter table human_resource drop column PerfScoreID;
alter table human_resource drop column FromDiversityJobFairID;
alter table human_resource drop column Termd;
alter table human_resource drop column HispanicLatino;
alter table human_resource drop column Performancescore;
alter table human_resource drop column EngagementSurvey;
alter table human_resource drop column EmpSatisfaction;
alter table human_resource drop column DaysLateLast30;
alter table human_resource drop column LastPerformanceReview_Date;
select* from human_resource;

-- 3. Rename colum 
-- rename column to new column 
alter table human_resource rename column MaritalDesc to Marital_status;
alter table human_resource rename column CitizenDesc to Citizen_status;
alter table human_resource rename column RaceDesc to Color_code;
alter table human_resource rename column DateofHire to Hiring_date;
alter table human_resource rename column DateofTermination to Leaving_date;
select* from human_resource;
desc human_resource;

-- change datatype
alter table human_resource modify column MarriedID varchar(10);

-- DQL 
-- read specific column form table 
select EmpId , Position, DOB from human_resource;

-- read all column from table 
select * from human_resource;


-- DML
-- where clause 
-- 1. query to change position where Department = IT/IS where manager name = Kelly Spirea
update human_resource set Department= "IT/IS" where ManagerName = "Kelley Spirea";
select * from human_resource;

-- 2. query to change marital status and state of employee name = Costello,Frank
update human_resource set State="TX",Marital_status="Divorced" where Employee_Name="Costello, Frank";
select * from human_resource;

-- 3. query to delete employee having salary < 45300
delete from human_resource where Salary < 45300;
select * from human_resource; 

-- Operators 
-- 1. Comparsison operators 

-- 4. query to retrive al employees whose salary is 56000
select * from human_resource where Salary > 56000;
select * from human_resource where Salary < 56000;
select * from human_resource where Salary = 56147;
select * from human_resource where Salary <= 56147;
select * from human_resource where Salary >= 56147;
select * from human_resource where Salary <> 56147; 

-- 2. Logical operators : and , or
-- 5.retrive all employess having positionid 19 from state Ma
select* from human_resource where State="MA" and PositionID= 19;

-- 6. retrive all employees having DeptId= 5 or marital_status= single
select * from human_resource where DeptID=5 or Marital_status= "Single";

-- 7. retrive all employees having GenderId = 1 and DeptID= 4
select * from human_resource where GenderID= 1 and DeptID= 4;
select* from human_resource;

-- 3. Membership operator: in, not in 

-- 8. retrive emp where empl where department = sales and production 
select * from human_resource where Department in ("Sales", "Production");

-- 9. retrive emps where recruitment source not in website and indeed
select * from human_resource where RecruitmentSource not in ("Website", "Indeed");

-- 4. range operator = between 
-- 10. retrive all employees id  whose salary is in between 63000 to 75000
select EmpID, Employee_Name from human_resource where Salary between 63000 and 75000;

-- is null, is not null 
-- 11. retrive all employees name where Leaving_date= null 
select Employee_Name from human_resource where Leaving_date is null;

-- 12. retrive all employees name where contact null
select Employee_Name from human_resource where contact is null;

-- 13. retrive all employees name where Leaving_date is not null
select Employee_Name from human_resource where Leaving_date is not null;
select Employee_Name from human_resource where contact is not null;

-- 5. case operator:
-- 14. retrive all employs name and deptid according to their salary 
select Employee_Name, DeptID ,
case 
when Salary<= 56000 then "Low"
when Salary > 56000 and Salary < 78000 then "Moderate"
when Salary > 78000 then "High"
end 
as Salary_condition
from human_resource;

-- Like operator
-- 15. employys name starting with letter A
select * from human_resource where Employee_Name like "A%";

-- 16. employee name starting with b and ends with k
select * from human_resource where Employee_Name like "A%k";

-- 17. employee name having 5th character n in their name 
select Employee_Name from human_resource where Employee_Name like "____n%";

-- 18.name having atleat 6 characters 
select Employee_Name from human_resource where Employee_Name like "%_____%";
select Employee_Name from human_resource where Employee_Name like "_____%";

-- Distinct Clause 
-- 19. query to fetch all distinct Manager name 
select distinct ManagerName from human_resource;

-- 20. query to fetch all distinct DeptId and ManagerID
select distinct DeptID , ManagerID from human_resource;

-- Order by clause 
-- 21. retrive all employees names by its deptid in ascending order 
select Employee_Name, DeptID from human_resource order by DeptID;

-- 22. query to fetch all employees detail order by salary desc 
select * from human_resource order by Salary desc;

-- 23. retrive empid asc and employ deptid desc
select * from human_resource order by EmpID , DeptID desc;

-- Built in functions 
-- 1. string function 
-- 1.1 concat 
-- 24
select concat (Sex, " ",Marital_status) as Employee_status from human_resource;

-- 1.2 upper ()
-- 25
select upper(Employee_Name) from human_resource;

-- 1.3 lower()
-- 26
select lower(Employee_Name) from human_resource;

-- 1.4 replace() : replace old string with new string 
-- 1.5 length()
-- 27 
select length (Employee_Name) from human_resource;

-- 1.6 substr()
-- 28 
select substr(Employee_Name,2,4) from human_resource;

-- limit clause 
-- 29. top 10 records 
select * from human_resource limit 10;

-- 30. acess 31 to 45 records from top 
select * from human_resource limit 30,15;

-- 31. find 1st highest salary 
select distinct salary from human_resource order by Salary desc limit 0,1;

-- 32. find 2nd highest salary 
select distinct salary from human_resource order by Salary desc limit 1,1;

-- 33. find 3rd highest salary 
select distinct salary from human_resource order by Salary desc limit 2,1;

-- Date function 
-- return current time and current date 
select now();

-- retrive current or todays date 
select curdate();

-- retrive current time 
select curtime();

-- retrive number of days between particular month 
select datediff("2024-04-07", "2023-04-08");
select * from human_resource;

-- 34. find age of employee having bday 9/19/1988
select datediff("2024-04-07", DOB)/365;

-- Aggregate function 

-- 35. Find the maximun salary 
select max(Salary) from human_resource;

-- 36. retrive the minimum salary from Departmentid 5 
select min(Salary) from human_resource where DeptID = 5;

-- 37. query to fetch max Salary of employees having state Tx and Department Production
select max(Salary) from human_resource where State= "TX" or Department = "Production";

-- 38. retrive sum salary of all emploees having manager name Jennifer zamora 
select sum(Salary) from human_resource where ManagerName = "Jennifer Zamora";

-- 39. 
select count(*) from human_resource;
select * from human_resource;

-- 40. retrive max min sum of salary and count of employees having position id 
select max(Salary), min(Salary), sum(Salary), count(*) from human_resource where PositionID = 9;

-- 41. query to fetch 75% salary is > 55000
select Salary, 0.75*Salary from human_resource where Salary *0.75>55000;

-- Group by Clause 
-- 42. Find the numberof eployees working from state
select State, count(*) from human_resource group by State;

-- 43. retrive no of employees working from each dept and marital status and sex
select Department, Marital_Status, Sex, count(*) from human_resource group by Department, Marital_Status, Sex;

-- Having Clause 
-- 44. query to fetch no of employes from Each Depart where number of employees is less than 10
select Department, count(*) from human_resource group by Department having count(*)< 10;

-- 45. retrive all employees having Marital status Married 
select Marital_Status, count(*) from human_resource group by Marital_Status having Marital_Status= "Married";

-- Subquery 
-- 46. 3rd highest salary from table using subquery
select max(Salary) from human_resource where Salary<(select max(Salary) from human_resource where Salary < (select max(Salary) from human_resource));

-- Joins 
-- 47. Retive common records from both tables.
-- Get salary of employee from employee table using joins.
select h.Employee_Name,h.EmpID,e.salary from human_resource as h Left join employee as e on h.EmpID=e.EmpID;

-- 48. cross joins
select * from human_resource cross join employee;

-- 49. query to fetch manager id using right join 
select h.Employee_Name,h.EmpID,e.manager_id,h.ManagerID from human_resource as h right join employee as e on h.EmpID=e.EmpID;

-- 50. retrive all employees who are manager 
select * from human_resource as h1 join human_resource as h2 on h1.EmpID= h2.ManagerID;
