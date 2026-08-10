/*--------------------------------------------------
HR-001--Requirement:
Departments with highest overtime employees
Dashboard:--Bar Chart
--------------------------------------------------*/
SELECT Department, COUNT(EmpID) AS Overtime_Employee_Count
FROM hr_analytics
WHERE OverTime = 'Yes'
GROUP BY Department
ORDER BY Overtime_Employee_Count DESC;
/*--------------------------------------------------
HR-002--Requirement:
The Finance Manager wants to know the average monthly
salary of each department.
Dashboard:--Column Chart
--------------------------------------------------*/
Select Department,AVG(MonthlyIncome) AS Average_monthlyIncome_salary 
FROM hr_analytics 
GROUP BY Department 
ORDER BY Average_monthlyIncome_salary DESC;
/*--------------------------------------------------
HR-003--Requirement:
Show the total number of employees in each department.
Dashboard:--Bar Chart / Column Chart
--------------------------------------------------*/
Select Department, Count(EmpId) AS Employee_count 
FROM hr_analytics
GROUP BY Department;
/*--------------------------------------------------
HR-004---Requirement:
Show the highest monthly salary in each department.
Dashboard:--Table Visual
--------------------------------------------------*/
Select Department, MAX(MonthlyIncome) AS Highest_monthlysalary
FROM hr_analytics
GROUP BY department 
ORDER BY Highest_monthlysalary DESC;
/*--------------------------------------------------
HR-005--Requirement:
Show the lowest monthly salary in each department.
Dashboard:--Table Visual
--------------------------------------------------*/
SELECT department , Min(MonthlyIncome) AS Lowest_montlysalary 
FROM hr_analytics
GROUP BY Department
ORDER BY Lowest_montlysalary  Desc;
/*--------------------------------------------------
HR-006--Requirement:
Show the average monthly salary of employees
who work overtime, department-wise.
Dashboard:--Clustered Column Chart
--------------------------------------------------*/
SELECT Department, AVG(MonthlyIncome) AS Average_monthlysalary 
From hr_analytics
WHERE Overtime='yes'
GROUP BY department;
/*--------------------------------------------------
HR-007--Requirement:
Show the number of employees in each Education Field.
Dashboard:--Bar Chart
--------------------------------------------------*/
SELECT EducationField, Count(EmpID) AS Employee_count From hr_analytics
GROUP by EducationField
ORDER BY Employee_count Desc;
/*--------------------------------------------------
HR-008--Requirement:
The HR Manager wants to identify departments that have
more than 20 employees.
Dashboard:--Table / KPI Card
--------------------------------------------------*/
Select Department, Count(EmpID) AS employee_count from hr_analytics
Group by Department
Having Count(EmpID)>20
Order by employee_count Desc;
/*--------------------------------------------------
HR-009-- Requirement:
The HR Manager wants a report showing all different
job roles available in the company without duplicates.
Dashboard:--Dropdown Filter / Job Role List
--------------------------------------------------*/
Select  distinct JobRole AS Different_Jobrole from hr_analytics;
/*--------------------------------------------------
HR-010- Requirement:
The HR Manager wants to identify the highest monthly
salary paid in the organization for salary revision
planning.
Dashboard:-KPI Card
--------------------------------------------------*/
Select Max(MonthlyIncome) AS highest_monthlysalary From hr_analytics;
/*--------------------------------------------------
HR-011-Objective:
Identify departments with lower average salaries
for compensation review.
Dashboard:
Compensation Review
--------------------------------------------------*/
Select Department, Avg(MonthlyIncome) AS Avg_salary From hr_analytics
Group by Department
Order By Avg_salary Asc;
/*--------------------------------------------------
HR-012--Business Objective:
Identify departments with the highest employee
attrition to prioritize retention strategies.
Dashboard:--Attrition Analysis
--------------------------------------------------*/
Select  Attrition, Department, Count(EmpID) AS employee_count from hr_analytics
Where Attrition='yes'
Group by Department
Order by employee_count Desc;
/*--------------------------------------------------
HR-013-Business Objective:
Identify departments with higher average overtime
hours to monitor workload distribution and improve
workforce planning.
Dashboard:-Overtime Analysis
--------------------------------------------------*/
Select Department, Count(EmpID) As overtime_working_hours
From hr_analytics
where overtime='yes'
Group by department
Order by  overtime_working_hours desc;

/*--------------------------------------------------
HR-014--- Objective:
Identify departments with lower average job
satisfaction to improve employee engagement.
Dashboard:-Employee Satisfaction Analysis
--------------------------------------------------*/
Select Department, Avg(JobSatisfaction) AS average_jobSatisfaction 
From hr_analytics Group by Department
Order by average_jobSatisfaction  Asc;
/*--------------------------------------------------
HR-015-- Objective:
HR wants to identify the highest-paid employee in
each department for salary benchmarking
Dashboard:
Salary Analysis
--------------------------------------------------*/
Select Department, Max(MonthlyIncome) As Highest_paid_employee from hr_analytics
Group by Department Order By Highest_paid_employee Desc;
/*--------------------------------------------------
HR-016--Business Objective:
HR wants to identify the lowest-paid employee in
each department to review compensation fairness.
Dashboard:
Salary Analysis
--------------------------------------------------*/
Select Department, Min(MonthlyIncome) AS Lowest_paid_employee 
From hr_analytics 
Group by Department
Order by Lowest_paid_employee Asc;
/*--------------------------------------------------
HR-017--Business Objective:
HR wants to understand the average age of employees
in each department for workforce planning
Dashboard:
Workforce Demographics
--------------------------------------------------*/
Select Department, Avg(Age) AS avg_of_employees From hr_analytics
Group by Department Order By  avg_of_employees Desc;
/*--------------------------------------------------
HR-018--Business Objective:
Prepare a report showing the total number of
employees in each department to support workforce
planning and resource allocation.
Dashboard:--Department Overview
--------------------------------------------------*/
Select Department, Count(EmpID) As employee_count 
From hr_analytics Group By department 
Order By employee_count Desc;
/*--------------------------------------------------
HR-019-Business Objective:
Support the annual promotion review process by
identifying employees who satisfy the organization's
promotion policy.
Dashboard:Promotion Eligibility
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole, TotalWorkingYears,
PerformanceRating, JobSatisfaction From hr_analytics
Where TotalWorkingYears>5
AND PerformanceRating=4
AND Jobsatisfaction>=3
Order By TotalWorkingYears Desc;
/*--------------------------------------------------
HR-020

Title:
Experienced Employee Report

Business Objective:
The HR Leadership Team wants to identify employees
who have spent a significant portion of their career
within the organization.

Dashboard:
Employee Experience Analysis

Business Rules:
• YearsAtCompany >= TotalWorkingYears / 2
• Exclude employees whose TotalWorkingYears = 0
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - TotalWorkingYears
  - YearsAtCompany
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole, TotalWorkingYears, YearsAtCompany
From hr_analytics
Where YearsAtCompany>=TotalWorkingYears/2 
AND TotalWorkingYears<>0
Order By Totalworkingyears Desc;
/*--------------------------------------------------
HR-021--Business Objective:
The Compensation & Benefits Team wants to identify
employees whose salary is higher than the overall
average salary of the organization.

Dashboard:
Compensation Analysis

Business Rules:
• Employee's MonthlyIncome must be greater than the
  organization's average MonthlyIncome.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole, MonthlyIncome
From hr_analytics 
where MonthlyIncome> (Select Avg(MonthlyIncome) from hr_analytics);
/*--------------------------------------------------
HR-022

Title:
Top Experienced Employees Report

Business Objective:
The HR Leadership Team wants to identify employees
who have the highest total working experience in
the organization.

Dashboard:
Employee Experience Analysis

Business Rules:
• Display only employee(s) having the maximum
  TotalWorkingYears.
• If multiple employees share the same maximum
  experience, include all of them.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - TotalWorkingYears
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole, TotalWorkingYears
From hr_analytics
where TotalWorkingYears=(select Max(TotalWorkingYears) from hr_analytics);
/*--------------------------------------------------
HR-023

Title:
Lowest Salary Employee Report

Business Objective:
The HR Compensation Team wants to identify employees
who receive the lowest monthly salary in the
organization.

Dashboard:
Compensation Analysis

Business Rules:
• Display only employee(s) having the minimum
  MonthlyIncome.
• If multiple employees share the same minimum
  salary, include all of them.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole, MonthlyIncome 
From hr_analytics 
Where MonthlyIncome=(Select Min(MonthlyIncome) from hr_analytics);
/*--------------------------------------------------
HR-024

Title:
Department Salary Benchmark Report

Business Objective:
The HR Compensation Team wants to identify employees
whose salary is above the average salary of their
own department.
Dashboard:
Department Compensation Analysis

Business Rules:
• Compare an employee's MonthlyIncome with the
  average MonthlyIncome of their own department.
• Include only employees whose salary is greater
  than their department's average salary.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole,MonthlyIncome From hr_analytics h1
Where MonthlyIncome>
( Select Avg(MonthlyIncome) from hr_analytics h2
 Where h2.Department= h1.Department
 );
 /*--------------------------------------------------
HR-025

Title:
Department Experience Benchmark Report

Business Objective:
The HR Workforce Planning Team wants to identify
employees whose total working experience is above
the average experience of employees within their
own department.

Dashboard:
Workforce Experience Analysis

Business Rules:
• Compare each employee's TotalWorkingYears with the
  average TotalWorkingYears of employees in the same
  department.
• Include only employees whose experience is greater
  than their department's average.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - TotalWorkingYears
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole, TotalWorkingYears From hr_analytics h1
where TotalWorkingYears>
( Select Avg(TotalWorkingYears) from hr_analytics h2
Where h2.Department=h1.Department
);
/*--------------------------------------------------
HR-026

Title:
Department Top Earner Report

Business Objective:
The HR Compensation Team wants to identify the
highest-paid employee(s) within each department.

Dashboard:
Department Compensation Analysis

Business Rules:
• Display employees whose MonthlyIncome is equal to
  the highest MonthlyIncome in their own department.
• If multiple employees share the highest salary
  within a department, include all of them.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole,MonthlyIncome From hr_analytics h1
Where MonthlyIncome=
( Select Max(MonthlyIncome) from hr_analytics h2
Where h2.Department=h1.Department
);
/*--------------------------------------------------
HR-027

Title:
Active Department Report

Business Objective:
The HR Operations Team wants to identify departments
that currently have employees working in overtime.

Dashboard:
Department Operations Analysis

Business Rules:
• Display only departments where at least one
  employee is working overtime.
• Duplicate departments should not appear.
• Display:
  - Department
--------------------------------------------------*/
Select distinct Department from hr_analytics where OverTime>='yes';
/*--------------------------------------------------
HR-028

Title:
Employees Working in High Attrition Departments

Business Objective:
The HR Analytics Team wants to identify employees
who belong to departments experiencing employee
attrition.

Dashboard:
Attrition Analysis

Business Rules:
• A department is considered a high-attrition
  department if it has at least one employee whose
  Attrition = 'Yes'.
• Display all employees working in those departments.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole from hr_analytics
Where Attrition='yes'AND 
(select distinct Department from hr_analytics);
/*--------------------------------------------------
HR-029

Title:
Payroll Audit – Duplicate Salary Payment Investigation

Business Objective:
The Payroll Team suspects that some employees may
have received duplicate salary payments due to a
system issue. They need a report for investigation.

Dashboard:
Payroll Audit

Business Rules:
• Display employees whose MonthlyIncome is the same
  as one or more other employees.
• Show:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole, MonthlyIncome
From hr_analytics Where MonthlyIncome 
IN (Select MonthlyIncome From hr_analytics 
Group by MonthlyIncome
Having Count(*)>1);
/*--------------------------------------------------
HR-030
Title:
Recruitment Priority Report

Business Objective:
The Recruitment Team wants to identify departments
that currently do not have any employees with a
Manager job role.
Business Rules:
• Display departments that do not have any employee
  whose JobRole is 'Manager'.
• Each department should appear only once.
• Display:
  - Department
--------------------------------------------------*/
Select  Distinct Department from hr_analytics where Department
NOT IN( Select Department from hr_analytics Where JobRole='Manager');
/*--------------------------------------------------
HR-031

Title:
Performance Review - Promotion Eligibility

Business Objective:
The HR Leadership Team wants to identify employees
who are eligible for promotion based on performance
and work experience.

Dashboard:
Promotion Eligibility

Business Rules:
• Employees must have a PerformanceRating of 4.
• Employees must have TotalWorkingYears greater than
  the overall average TotalWorkingYears of the
  organization.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - PerformanceRating
  - TotalWorkingYears
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole, PerformanceRating, TotalWorkingYears
From hr_analytics Where PerformanceRating=4 
AND TotalWorkingYears> (
Select Avg(TotalWorkingYears) from hr_analytics);
/*--------------------------------------------------
HR-032

Title:
Employee Recognition Report

Business Objective:
The HR Recognition Committee wants to identify
employees who have never worked overtime but have
maintained excellent performance.

Dashboard:
Employee Recognition

Business Rules:
• OverTime must be 'No'
• PerformanceRating must be 4
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - PerformanceRating
  - OverTime
--------------------------------------------------*/
Select EmployeeNumber, Department, JobRole, PerformanceRating, Overtime
From hr_analytics Where Overtime='No' AND PerformanceRating=4;
/*==========================================================
HR-033

Title:
Above Average Salary Review

Business Objective:
The Finance Team wants to identify employees whose
MonthlyIncome is greater than the organization's
average MonthlyIncome.

Dashboard:
Salary Analysis
Business Rules:
• Consider the overall organization average salary.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
==========================================================*/
Select EmployeeNumber, Department, JobRole, MonthlyIncome From hr_analytics
Where MonthlyIncome>( Select Avg(MonthlyIncome) from hr_analytics);
/*==========================================================
HR-034

Title:
Long Service Recognition

Business Objective:
The HR Team wants to recognize employees whose
YearsAtCompany is greater than the organization's
average YearsAtCompany.

Dashboard:
Employee Service Analysis
Business Rules:
• Consider the overall average YearsAtCompany.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - YearsAtCompany
==========================================================*/
Select EmployeeNumber, Department, JobRole, YearsAtCompany from hr_analytics
Where YearsAtCompany>(Select Avg(YearsAtCompany) from hr_analytics);
/*==========================================================
HR-035

Title:
Department Workforce Strength

Business Objective:
The HR Operations Team wants to identify JobRoles
that have more than 100 employees in the organization.
Only those JobRoles should be included in the report.

Dashboard:
Workforce Planning
Business Rules:
• Display:
  - JobRole
  - EmployeeCount
==========================================================*/
Select JobRole, Count(EmployeeCount) AS EmployeeNumber From hr_analytics
Group By JobRole
Having Count(EmployeeNumber)>100;
/*==========================================================
HR-036

Title:
Department Performance Review

Business Objective:
The HR Director wants to identify departments where
the average PerformanceRating is greater than 3.5.

Dashboard:
Department Performance

Business Rules:
• Display:
  - Department
  - AveragePerformanceRating
==========================================================*/
Select Department, Avg(PerformanceRating) AS Avg_rating From hr_analytics
Group By Department
Having Avg(PerformanceRating)>3.5;
/*-----------------------------------------------------
HR-037

Title:
Highest Paid Job Role
Business Objective:
The HR Compensation Team wants to identify the JobRole
that has the highest average MonthlyIncome across the
organization.
Dashboard:
Compensation Analysis
Business Rules:
• Calculate the average MonthlyIncome for each JobRole.
• Return only the JobRole(s) with the highest average.
• Display:
  - JobRole
  - AverageMonthlyIncome
----------------------------------------------------------*/
Select JobRole, Avg(MonthlyIncome) As avg_salary from hr_analytics
Group By JobRole
Having AVg(MonthlyIncome)=(Select Max(avg_salary) from 
(Select JobRole, Avg(MonthlyIncome) As avg_salary from hr_analytics Group By JobRole) AS T);
-/* HR-038

Title:
Lowest Paid Department (Based on Average Salary)

Business Objective:
The HR Compensation Team wants to identify the Department
that has the lowest average MonthlyIncome across the
organization.
Business Rules:
• Calculate the average MonthlyIncome for each Department.
• Return only the Department(s) with the lowest average.
• Display:
  - Department
  - AverageMonthlyIncome
  /*--------------Method 1----------------------*/
  SELECT Department,AVG(MonthlyIncome) AS avg_salary
FROM  hr_analytics
GROUP BY Department
HAVING ROUND(AVG(MonthlyIncome),4) =
(
    SELECT ROUND(MIN(avg_salary),4)
    FROM
    (
        SELECT AVG(MonthlyIncome) AS avg_salary
        FROM hr_analytics
        GROUP BY Department
    ) AS T
);
------/*Method -2-------------------------*/
SELECT
    Department,
    AVG(MonthlyIncome)
FROM hr_analytics
GROUP BY Department
ORDER BY AVG(MonthlyIncome) ASC
LIMIT 1;
/*-------------------------
-- HR-039
Title:
Most Experienced Department
Business Objective:
The HR Leadership Team wants to identify the Department
that has the highest average TotalWorkingYears across the
organization.
Business Rules:
• Calculate the average TotalWorkingYears for each Department.
• Return only the Department(s) with the highest average.
• Display:
  - Department
  - AverageTotalWorkingYears
  -------------*/
  Select Department, Avg(TotalWorkingYears) As average_totalworkingyears 
  From hr_analytics
  Group by Department
  having  ROUND(Avg(TotalWorkingYears),2)= 
       (select ROUND(Max(average_totalworkingyears),2) from 
           (Select Avg(TotalWorkingYears) As average_totalworkingyears From hr_analytics 
  Group by Department) AS T);
 /* -- HR-040---------------------------
Title:
Most Experienced Job Role
Business Objective:
The HR Leadership Team wants to identify the JobRole
that has the highest average TotalWorkingYears across the
organization.

Business Rules:
• Calculate the average TotalWorkingYears for each JobRole.
• Return only the JobRole(s) with the highest average.
• Display:
  - JobRole
  - AverageTotalWorkingYears
-----------------------------------------------------*/
Select JobRole, Avg(TotalWorkingYears) As avg_workingyears
From hr_analytics 
Group By JobRole
Having Avg(TotalWorkingYears)=
 ( Select (Max(avg_workingyears)) From 
     ( Select (Avg(TotalWorkingYears)) As avg_workingyears
     from hr_analytics
     Group by JobRole)
     AS T);
  /*-- HR-041-----------------------
Title:
Department with Maximum Employee Count

Business Objective:
The HR Operations Team wants to identify the Department
that has the highest number of employees in the
organization.

Business Rules:
• Count the total number of employees in each Department.
• Return only the Department(s) with the highest employee count.
• Display:
  - Department
  - EmployeeCount
  -------------------------------*/
  Select Department, Count(EmployeeNumber) AS EmployeeCount from hr_analytics
  group by Department
  Having Count(EmployeeNumber)=
     (Select Max(EmployeeCount) from 
        (Select  Department, Count(EmployeeNumber) AS EmployeeCount
        from hr_analytics
        group by Department) AS T);
/*----------------HR-042-----------------------------

Title:
Top Performer in Each Department

Business Objective:
The HR Leadership Team wants to identify the highest-performing employee(s)
in each Department based on PerformanceRating. If multiple employees have
the same highest PerformanceRating, all of them should be displayed.

Dashboard:
Performance Analysis

Business Rules:
• Rank employees within each Department based on PerformanceRating
  (highest first).
• Return only employee(s) ranked 1.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - PerformanceRating       
  --------------------------------------------*/   
  With HighestPerformingEmployee AS
   (Select EmployeeNumber, Department,JobRole,
   PerformanceRating AS Highest_first,
    RANK() OVER(
             PARTITION BY Department
             Order by PerformanceRating Desc
             ) AS Rank_no
     From hr_analytics        
  )
  Select EmployeeNumber, Department, JobRole, Highest_first
  from HighestPerformingEmployee
  where Rank_no=1;
  /*-- HR-043

Title:
Highest Paid Employee in Each Department

Business Objective:
The HR Compensation Team wants to identify the highest-paid employee(s)
in each Department. If multiple employees have the same highest
MonthlyIncome, all of them should be displayed.

Business Rules:
• Rank employees within each Department based on MonthlyIncome
  (highest first).
• Return only employee(s) ranked 1.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
  -------------------*/
  With HighestPaidEmployee AS
   ( Select EmployeeNumber, Department, JobRole, MonthlyIncome AS Highest_salary,
    RANK() OVER(
    partition by Department
    Order by MonthlyIncome Desc
    ) AS Rank_no
    from hr_analytics
    )
    (Select EmployeeNumber, Department, JobRole, Highest_salary
    from HighestPaidEmployee
    Where Rank_no=1);
    /*-- HR-044----------------------------

Title:
Top 3 Highest Paid Employees in Each Department

Business Objective:
The HR Compensation Team wants to identify the top 3 highest-paid
employees in every Department for salary benchmarking and
compensation planning.

Business Rules:
• Rank employees within each Department based on MonthlyIncome
  (highest first).
• Return only the Top 3 employees from each Department.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
  - SalaryRank
  ------------------------------------*/
  With HighestPaidEmployee AS
(  select EmployeeNumber, Department, JobRole, MonthlyIncome AS salary_rank,
    RANK() over(
    partition by Department
    Order By MonthlyIncome Desc)
    AS r_n
    from hr_analytics
 )
 ( Select EmployeeNumber, Department, JobRole, salary_rank, r_n
 from HighestPaidEmployee
 where r_n<=3);
 /*-----------------  -- HR-045------------------

Title:
Most Recently Joined Employee in Each Department

Business Objective:
The HR Operations Team wants to identify the most recently joined
employee(s) in each Department to support onboarding and workforce planning.

Business Rules:
• Rank employees within each Department based on YearsAtCompany.
• Employees with the lowest YearsAtCompany are considered the most recently joined.
• Return only employee(s) ranked 1.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - YearsAtCompany
  ----------------------------------*/
  With RecentlyJoined AS 
  ( Select EmployeeNumber, Department, JobRole, YearsAtCompany AS LowestYearsAtCompany,
      Rank() Over(
            Partition By Department
            Order By YearsAtCompany Asc
            ) As Rank_no
            from hr_analytics
     )
( Select EmployeeNumber, Department, JobRole, LowestYearsAtCompany
from RecentlyJoined
Where Rank_no=1);
/*-- HR-046------------------------------------------
Title:
Top Performing Employee in Each Job Role

Business Objective:
The HR Performance Team wants to identify the top-performing
employee(s) within each JobRole to support promotions,
recognition programs, and performance reviews.

Business Rules:
• Rank employees within each JobRole based on PerformanceRating
  (highest first).
• If multiple employees have the same highest PerformanceRating,
  include all of them.
• Return only employee(s) ranked 1.
• Display:
  - EmployeeNumber
  - JobRole
  - Department
  - PerformanceRating
  ------------------------------------*/
  With TopPerformEmployee As
  ( Select EmployeeNumber, JobRole, Department, PerformanceRating AS Top_rating,
  Rank() Over(
      partition by JobRole
      Order by PerformanceRating Desc
      ) As Rank_no 
      from hr_analytics
   )
    Select EmployeeNumber, JobRole, Department, Top_rating
   from TopPerformEmployee
   Where Rank_no=1;
/*-- HR-047----------------------------------------
Title:
Second Highest Paid Employee(s) in Each Department

Business Objective:
The HR Compensation Team wants to identify the employee(s)
earning the second highest MonthlyIncome in each Department.
This helps HR benchmark salary structures and identify
employees close to the highest pay band.
Business Rules:
• Calculate salary rankings within each Department.
• Employees with the same second highest salary should all
  be included.
• Return only employee(s) with the second highest salary.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
  ----------------------------------*/
  With SecondHighestSalary AS
  ( Select EmployeeNumber, Department, JobRole, MonthlyIncome As Highest_salary,
   Rank() Over(
   Partition By Department
   Order By MonthlyIncome Desc
   ) As Rank_no
   From hr_analytics
  )
  Select EmployeeNumber, Department, JobRole, Highest_salary
  From SecondHighestSalary
  Where Rank_no=2;
/* HR-048----------------------------------------------------
Title:
Employees Earning Above Department Average
Business Objective:
The HR Compensation Team wants to identify employees whose
MonthlyIncome is higher than the average MonthlyIncome of
their respective Department. These employees are considered
high-value contributors for compensation review.

Business Rules:
• Calculate the average MonthlyIncome for each Department.
• Compare every employee's MonthlyIncome with the average
  salary of their own Department.
• Return only employees earning above their Department average.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
  - DepartmentAverageSalary
  ---------------------------------------*/
  With AverageMonthlyIncome As
  ( Select Department, Avg(MonthlyIncome) As DepartmentAverageSalary
  From hr_analytics
  group by Department)
  Select h.EmployeeNumber, h.Department, h.JobRole, h.MonthlyIncome, a.DepartmentAverageSalary
  from hr_analytics h
  JOIN AverageMonthlyIncome a
  On h.department=a.department
  Where h.MonthlyIncome> a.departmentAverageSalary;
  /*-- HR-049---------------------------------------------

Title:
Highest Paid Employee Above Department Average

Business Objective:
The HR Compensation Team wants to identify the highest-paid employee(s)
in each Department whose MonthlyIncome is above their Department's
average MonthlyIncome. This helps identify exceptional earners for
leadership and retention planning.

Business Rules:
• Calculate the average MonthlyIncome for each Department.
• Consider only employees earning above their Department average.
• Rank the remaining employees within each Department based on
  MonthlyIncome (highest first).
• Return only employee(s) ranked 1.
• Display:
  - EmployeeNumber
  - Department
  - JobRole
  - MonthlyIncome
  - DepartmentAverageSalary
  ----------------------------------------------------------*/
  With DepartmentAverageSalary As
  ( Select Department, Avg(MonthlyIncome) As Avg_salary 
  From hr_analytics  Group By Department),
  
  EmployeeHighestEarning AS
  ( Select EA.EmployeeNumber,
  EA. Department, EA.JobRole, EA.MonthlyIncome, 
  DA.Avg_salary,
  
  RANk() OVER(
   Partition By  EA.Department
   Order By EA.MonthlyIncome Desc
   ) AS Rank_no
  From hr_analytics EA
  Join DepartmentAverageSalary DA
  On EA.Department=DA.Department
  Where EA.MonthlyIncome> DA.Avg_salary
  )
  Select EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    Avg_salary From 
   EmployeeHighestEarning
   Where Rank_no=1;
   /*HR-050Title:------------------------------------------------------
Employees with Highest Performance Rating and Above Department Average Salary
Business Objective:
The HR Leadership Team wants to identify top-performing employees
who are also earning above their Department's average salary.
These employees are strong candidates for promotions and leadership programs.

Business Rules:
• Calculate the average MonthlyIncome for each Department.
• Consider only employees earning above their Department average.
• Among those employees, identify only the highest PerformanceRating
  within each Department.
• If multiple employees share the highest PerformanceRating,
  include all of them.
• Display:
    - EmployeeNumber
    - Department
    - JobRole
    - MonthlyIncome
    - PerformanceRating
    - DepartmentAverageSalary
  -------------------------------------------*/  
  With DepartmentAverageSalary AS
   ( Select Department, Avg(MonthlyIncome) As Avg_salary
   From hr_analytics Group By Department
   ),
   EmployeeEaringDeptAvg AS
   ( Select EE.EmployeeNumber, EE.Department, EE.JobRole, EE.MonthlyIncome, EE.PerformanceRating, Avg_salary
   From hr_analytics EE
   JOIN DepartmentAverageSalary DA
   ON EE.Department = DA.Department
   Where EE.MonthlyIncome> DA.Avg_salary
   ),
   HighestPerformanceRating AS
   (Select EmployeeNumber, Department, JobRole, MonthlyIncome, 
PerformanceRating,Avg_salary,
   RANK() Over(
   Partition By Department
   Order By PerformanceRating Desc) AS rank_no
   from EmployeeEaringDeptAvg
  )
  SELECT
    EmployeeNumber,Department, JobRole,MonthlyIncome,
    PerformanceRating,Avg_salary
FROM HighestPerformanceRating
WHERE rank_no = 1;
  
  
  
  
  
  
  
  
  
  
  