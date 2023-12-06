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
    
# 37 part 3 - 21 - 37