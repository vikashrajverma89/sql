-- Group by
SELECT *
FROM employee_demographics

SELECT gender, AVG(age)
FROM employee_demographics
group by gender
;

SELECT occupation, salary
FROM employee_salary
group by occupation, salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
group by gender
;


-- Order BY
SELECT * 
FROM employee_demographics
ORDER BY first_name ASC;


SELECT * 
FROM employee_demographics
ORDER BY first_name desc;

SELECT * 
FROM employee_demographics
ORDER BY gender, age ;

SELECT * 
FROM employee_demographics
ORDER BY gender, age DESC
;


SELECT * 
FROM employee_demographics
ORDER BY 5, 4
;


-- Having vs where
SELECT gender , AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;


SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%Manager%'
group by occupation
having avg(salary) > 75000;


-- lImIt & aliasing
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

-- aliasing 
select gender, avg(age) AS avg_age
from employee_demographics
group by gender
HAVING avg_age > 40 ;

