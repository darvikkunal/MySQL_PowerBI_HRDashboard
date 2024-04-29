SELECT *
FROM hr;
-- --------------------------------
-- Changing Column Name
ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;
-- ------------------------------------------------
-- TO FIND what Data types are used----------------------------

DESCRIBE hr;

-- ------------------------------------------------------
-- Asigning DATE data-type to birthdate------------------------

SELECT birthdate FROM hr;

SET sql_safe_updates = 0;
UPDATE hr
SET birthdate = CASE
    WHEN birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

-- -------------------------------------------------
-- ------------------------------------------------------
-- Asigning DATE data-type to hiredate------------------------

SELECT hire_date FROM hr;

SET sql_safe_updates = 0;
UPDATE hr
SET hire_date = CASE
    WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

-- ------------Modifying termdate-----------------------------

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SELECT * FROM hr;
-- -------------------------------------------------
-- Altering Age-------------------------------------

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr 
SET age = timestampdiff(YEAR, birthdate, CURDATE()); 

SELECT birthdate, age
FROM hr;

SELECT
	min(age) AS youngest,
    max(age) AS oldest
FROM
	hr;
    
SELECT count(*) FROM hr WHERE age<18;

SELECT *
FROM hr;

describe hr;



