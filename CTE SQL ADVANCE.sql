-- CTEs



WITH CTE_Example AS
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender)
SELECT *
FROM CTE_Example ;


WITH CTE_Example (GENDER, AVG_SAL, MAX_SAL,MIN_SAL, COUNT_SAL) AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender)
SELECT *
FROM CTE_Example ;


SELECT AVG(avg_sal)
FROM (
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender) example_subquery
 ;

WITH CTE_Example AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender)
SELECT AVG(avg_sal)
FROM CTE_Example ;

SELECT AVG(avg_sal)
FROM CTE_Example;

WITH CTE_Example AS
(
SELECT employee_id,gender,birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 as
(
SELECT *
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;





