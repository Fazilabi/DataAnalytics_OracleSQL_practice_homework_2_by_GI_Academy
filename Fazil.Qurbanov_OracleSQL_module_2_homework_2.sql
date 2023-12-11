--1. Display employees who joined in the month of May
select 
    first_name, 
    hire_date 
from employees
where (extract (month from hire_date)>5);

--2. Display employees who joined in the current ( 2008 ) year.
select 
    first_name , 
    hire_date 
from employees
where extract(year from hire_date) = 2008 ;

--3. Display the number of days between system date and 1st January 2011.
select 
    round( months_between(sysdate, '01-jan-2011'), 2) diff
from employees
fetch first 1 rows only ;

--4. Display maximum salary of employees.
select 
    max(salary) 
from employees;

--5. Display number of employees in each department.
select 
    department_id, 
    count(employees_id) 
from employees;

--6. Display number of employees who joined after 15th of month.
select 
    count(employee_id)
from employees
where extract(day from hire_date)>15;

--7. Display average salary of employees in  
--   each department who have commission percentage.
select 
    round(avg(salary),2),
    department_id
from employees
where commission_pct is not null
group by department_id;

--8. Display job ID for jobs with average salary more than 10000.
select
    j.job_id,
    j.job_title,
    avg(e.salary)
from employees e
left join jobs j
on e.job_id=j.job_id
group by j.job_id,j.job_title
having avg(e.salary)>10000;

--9. Display job ID, number of employees, 
--   sum of salary, and difference between the highest
-- salary and the lowest salary of the employees for all jobs.
select
    job_id,
    count(employee_id),
    sum(salary),
    max(salary),
    min(salary),
    (max(salary)-min(salary)) diff_salary
from employees
having (count(employee_id))>1
group by job_id;

--10.Display manager ID and number of employees managed by the manager.
 
SELECT m.employee_id AS manager_id, COUNT(e.employee_id) AS num_employees_managed
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
GROUP BY m.employee_id;








    













