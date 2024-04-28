-- JOins
SELECT * 
FROM employee_demographics;

select *
FROM employee_salary;

SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
;

SELECT dem.employee_id,dem.age, sal.occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
    WHERE salary >= 70000
;


SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
;


SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
;

-- Self Join

select *
FROM employee_salary EMP1
JOIN employee_salary EMP2
	ON EMP1.employee_id +1 = EMP2.employee_id
 ;
 
 
select EMP1.employee_id as emp_santa,
EMP1.first_name AS first_name_santa,
EMP1.last_name AS last_name_santa,
EMP2.employee_id as emp_name,
EMP2.first_name AS first_name_emp,
EMP2.last_name AS last_name_emp
FROM employee_salary EMP1
JOIN employee_salary EMP2
	ON EMP1.employee_id +1 = EMP2.employee_id
 ;
 
 
 
 -- joining multiple tables together
 
 SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;

SELECT * 
FROM parks_departments;
 
 
 -- UNIONS 
 SELECT first_name,last_name
 FROM employee_demographics
 UNION 
  SELECT first_name,last_name
 FROM employee_salary;
 
  SELECT first_name,last_name
 FROM employee_demographics
 UNION ALL
  SELECT first_name,last_name
 FROM employee_salary;
 
  SELECT first_name,last_name, 'Old LAdy' as Label
 FROM employee_demographics
 where age > 40 AND gender = 'Female'
 UNION
  SELECT first_name,last_name, 'Old MAn' as Label
 FROM employee_demographics
 where age > 40 AND gender ='Male'
 UNION 
 SELECT first_name, last_name, 'Highly Paid EMployee' AS Label
 FROM employee_salary
 where salary > 70000
 ORDER BY first_name,last_name
 ;
 
 -- string function
 SELECT length('skyfall');
 
SELECT first_name, length(first_name)
FROM employee_demographics
ORDER BY 2;

SELECT UPPER('sky');
SELECT LOWER('SKY');


SELECT first_name, UPPER(first_name)
FROM employee_demographics;

SELECT TRIM('                    SKY                 ');

SELECT LTRIM('                    SKY                 '); 
 
 SELECT RTRIM('                    SKY                 ');
 
 SELECT first_name,
 LEFT(first_name, 4),
RIGHT(first_name, 4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) AS birth_month
 FROM employee_demographics;
 
 
 update employee_demographics
 join (select employee_id, substring(birth_date,6,2) AS birth_month
 from employee_demographics) as temp_table 
 ON employee_demographics.employee_id = temp_table.employee_id
 SET employee_demographics.birth_month = temp_table.birth_month;
 
 
 select *
 from employee_demographics;
 
 
 SELECT first_name,REPLACE(first_name, 'a','z')
  FROM employee_demographics;
  
  SELECT LOCATE('x','Alexander');
 
 SELECT first_name, last_name
  FROM employee_demographics;
  
  
  SELECT first_name, last_name,
  CONCAT(first_name,last_name)
  FROM employee_demographics;
  
  
  SELECT first_name, last_name,
  CONCAT(first_name,' ',last_name) AS Full_name
  FROM employee_demographics;