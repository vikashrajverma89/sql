-- CASE STATEMENT

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'YOUNG'
    WHEN age BETWEEN 31 AND 50 THEN 'OLD'
    WHEN age >= 50 THEN "ON DEATH'S DOOR"
END AS age_bracket
FROM employee_demographics;

-- pAY INCREASE AND BONUS 
-- <50000 = 5%
-- >50000 = 7%
-- FINANCE = 10% BONUS
SELECT first_name,last_name,salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
	WHEN salary > 50000 THEN salary + (salary * 0.07)
END as New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END as Bonus
FROM employee_salary;



SELECT *
FROM parks_departments;

-- Subqueries

SELECT *
FROM employee_demographics
WHERE employee_id IN
 (SELECT employee_id
 FROM employee_salary
WHERE dept_id = 1)
;

select first_name,salary,
(select avg(salary)
FROM employee_salary )
FROM employee_salary
;

SELECT gender, 
AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
group by gender;


SELECT AVG(max_age)
FROM
(SELECT gender, 
AVG(age) as avg_age,
 MAX(age) as max_age, 
 MIN(age) as min_age,
 COUNT(age)
FROM employee_demographics
group by gender) AS Agg_table
;

-- Window Function 
SELECT gender, AVG(salary) as avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
group by gender;


SELECT dem.first_name,dem.last_name, AVG(salary) OVER(partition by gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id,dem.first_name,dem.last_name,gender,salary, SUM(salary) OVER(partition by gender ORDER BY dem.employee_id) AS rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id,dem.first_name,dem.last_name,gender,salary,
ROW_NUMBER() OVER(partition by gender ORDER BY salary DESC) as row_num,
RANK() OVER(partition by gender ORDER BY salary DESC) as rank_num,
DENSE_RANK() OVER(partition by gender ORDER BY salary DESC) as DENSE_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;



