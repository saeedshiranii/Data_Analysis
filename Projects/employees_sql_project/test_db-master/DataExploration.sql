# Select the information from the dept_no column of the departments table.
SELECT 
    dept_no
FROM
    employees.departments;

# Select all data from the departments table.
SELECT 
    *
FROM
    employees.departments;

# Select all people from the employees table whose first name is Elvis.
SELECT 
    *
FROM
    employees.employees
WHERE
    first_name = 'Elvis';
    
# Retrieve a list with all female employees whose first name is Kellie.
SELECT 
    *
FROM
    employees.employees
WHERE
    (gender = 'F' AND first_name = 'Kellie');
    
# Retrieve a list with all employees whose first name is either Kellie or Aruna.
SELECT 
    *
FROM
    employees.employees
WHERE
    (first_name = 'Kellie' OR first_name = 'Aruna');
    
# Retrieve a list with all female employees whose first name is either Kellie or Aruna.
SELECT 
    *
FROM
    employees.employees
WHERE
    gender = 'M'
        AND (first_name = 'Kellie' OR first_name = 'Aruna');
        
# Use the IN operator to select all individuals from the employees table, whose first name is either Denis, or Elvis.
SELECT 
    *
FROM
    employees.employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
    
# Extract all records from the employees table, aside from those with employees named John, Mark, or Jacob.
SELECT 
    *
FROM
    employees.employees
WHERE
    first_name NOT IN ('John', 'Mark', 'Jacob');
    
/* Working with the employees table, use the LIKE operator to select the data about all individuals,
 whose first name starts with Mark; specify that the name can be succeeded by any sequence of characters.*/

SELECT 
    *
FROM
    employees.employees
WHERE
    first_name LIKE ('Mark%') ;


# Retrieve a list with all employees who have been hired in the year 2000.
SELECT 
    *
FROM
    employees.employees
WHERE
    hire_date like('2000%');
    
    
    
    
# Retrieve a list with all employees whose employee number is written with 5 characters, and starts with 1000.
select * from employees.employees where emp_no like ('1000_');


# Extract all individuals from the employees table whose first name contains Jack.
SELECT 
    *
FROM
    employees.employees
WHERE
    first_name like('%jack%');
# Once you have done that, extract another list containing the names of employees that do not contain Jack.
SELECT 
    *
FROM
    employees.employees
WHERE
    first_name Not LIKE ('%jack%');
    
    
# Select all the information from the salaries table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT 
    *
FROM
    employees.salaries
WHERE
    salary BETWEEN 66000 AND 70000;

# Retrieve a list with all individuals whose employee number isnotbetween 10004 and 10012.
SELECT 
    *
FROM
    employees.salaries
WHERE
    salary NOT BETWEEN 10004 AND 10012;

# Select the names of all departments with numbers between d003 and d006.
SELECT 
    *
FROM
    employees.departments;
  
  
SELECT 
    *
FROM
    employees.departments
    
WHERE
    dept_no BETWEEN "d003" AND "d006";
    
    
    
# Select the names of all departments whose department number value is not null.
SELECT 
    *
FROM
    employees.departments
WHERE
    dept_no IS NOT NULL;
    


# Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT 
    *
FROM
    employees.employees
WHERE
    gender = 'f'
        AND hire_date >= '2000-01-01';


# Extract a list with all employees salaries higher than $150,000 per annum.
SELECT 
    *
FROM
    employees.salaries
WHERE
    salary > 150000;
    
# Obtain a list with all different hire dates from the employees table.
SELECT DISTINCT
    hire_date
FROM
    employees;
    
# How many annual contracts with a value higherthan or equal to $100,000 have been registered in thesalaries table?
SELECT 
    *
FROM
    salaries
WHERE
    salary >= 100000;

# How many managers do we have in the employees database? Use the star symbol (*) in your code to solve this exercise.
    
SELECT 
    COUNT(*)
FROM
    dept_manager;
    
# Select all data from the employees table, ordering it by hire date in descending order.
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

# Write a query that obtains an output whose first column must contain annual salaries higher than 80,000 dollars.
# The second column, renamed to emps_with_same_salary, must show the number of employee contracts signed with this salary.
SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
order by salary;

# Select all employees whose average salary is higher than $120,000 per annum.
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

# Select the employee numbers of all individuals who have signed more than 1 contract after the 1stof January 2000.

SELECT 
    emp_no, COUNT(dept_no) as number_of_contracts
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY COUNT(dept_no);

# Select the first 100 rows from the dept_emp table.
SELECT 
    *
FROM
    dept_emp
LIMIT 100;

# How many departments are there in the employees database? Use the dept_emp table to answer the question.
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;


# What is the total amount of money spent on salaries for all contracts starting after the 1stof January 1997?
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
    
# Create and fill in the departments_dup table, using the following code:



DROP TABLE IF EXISTS departments_dup;

CREATE TABLE departments_dup

(

dept_no CHAR(4) NULL,

dept_name VARCHAR(40) NULL

);


INSERT INTO departments_dup

(

dept_no,

dept_name

)SELECT

*

FROM

departments;


INSERT INTO departments_dup (dept_name)

VALUES ('Public Relations');


DELETE FROM departments_dup

WHERE

dept_no = 'd002';


INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');


# Create and fill in the dept_manager_dup table, using the following code:



DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

emp_no int(11) NOT NULL,

dept_no char(4) NULL,

from_date date NOT NULL,

to_date date NULL

);


INSERT INTO dept_manager_dup

select * from dept_manager;


INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES (999904, '2017-01-01'),

(999905, '2017-01-01'),

(999906, '2017-01-01'),

(999907, '2017-01-01');


DELETE FROM dept_manager_dup

WHERE

dept_no = 'd001';



# Extract a list containing information about all managers employee number, first and last name, department number, and hire date.
SELECT 
     dm.dept_no, e.emp_no, e.hire_date, e.first_name, e.last_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;


# Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch.
# See if the output contains a manager with that name.
# Hint: Create an output containing information corresponding to the following fields:emp_no, first_name, last_name, dept_no, from_date.Order by 'dept_no' descending, and then by 'emp_no'.

SELECT
e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM
employees e
LEFT JOIN
dept_manager dm ON e.emp_no = dm.emp_no
WHERE
e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC, e.emp_no;


/*Extract a list containing information about all managers
 employee number, first and last name, department number, and hire date.
 Use the old type of join syntax to obtain the result.
*/

SELECT 
    e.emp_no,
    dm.dept_no,
    e.first_name,
    e.last_name,
    e.hire_date
FROM
    dept_manager dm
        LEFT JOIN
    employees e ON e.emp_no = dm.emp_no;
