-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE Employees(
        emp_no  	VARCHAR(20) NOT NULL,
		birth_date 	date NOT NULL, 
		first_name  VARCHAR(20) NOT NULL,
		last_name   VARCHAR(20) NOT NULL,
		gender      VARCHAR NOT NULL,
		hire_date   date NOT NULL,
		PRIMARY KEY (emp_no)
	
	
);

CREATE TABLE dept_manager (
dept_no VARCHAR(20) NOT NULL,
    emp_no VARCHAR(20) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE salaries (
  emp_no VARCHAR(20) NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);


CREATE TABLE DEPT_EMP(
	dept_no   VARCHAR(20) NOT NULL,
	emp_no	  VARCHAR(20) NOT NULL,
	from_date  date NOT NULL,
	to_date    date NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);



CREATE TABLE titles(
	emp_no   VARCHAR(20) NOT NULL,
	title    VARCHAR(45) NOT NULL,
	from_date  date  NOT NULL,
	to_date    date 	NOT NULL,
	PRIMARY KEY (emp_no, title, from_date),
	FOREIGN KEY (emp_no) REFERENCES salaries (emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);


select first_name, last_name, birth_date
from employees
where birth_date between '1952-01-01' AND '1955-12-31';


SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name, birth_date
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name, birth_date, hire_date
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') and (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name) 
from employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') and (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Creating new table 
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select * from retirement_info;

drop table retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
select d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;


-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
from retirement_info left join 
dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;
 
 
 
 -- Joining retirement_info and dept_emp tables
SELECT re.emp_no,
    re.first_name,
re.last_name,
    de.to_date
FROM retirement_info as re
LEFT JOIN dept_emp as de
ON re.emp_no = de.emp_no;


SELECT ri.emp_no,
ri.first_name,
ri.last_name,
de.to_date
into current_emp
from retirement_info as ri   
Left  JOIN dept_emp as de 
ON ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

SELECT * FROM current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

