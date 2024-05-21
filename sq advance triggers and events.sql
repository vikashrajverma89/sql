-- triggers and Events

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;


DELIMITER $$
CREATE TRIGGER employee_insert 
	AFTER INSERT ON employee_salary
    FOR EACH ROW 
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name , last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values (13, 'Jean-Ralphio', 'saperstone' , 'Entertainment' ,'100000' , NULL);


-- EVENTS
SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 second
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ; 

SHOW VARIABLES LIKE 'event%';




