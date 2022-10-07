-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE Employees(
       emp_no  	int NOT NULL,
		birth_date 	date NOT NULL, 
		first_name  VARCHAR(20) NOT NULL,
		last_name   VARCHAR(20) NOT NULL,
		gender      VARCHAR NOT NULL,
		hire_date   date NOT NULL,
		PRIMARY KEY (emp_no)
	
	
);


CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);


CREATE TABLE DEPT_EMP(
	dept_no   VARCHAR(4) NOT NULL,
	emp_no	  int NOT NULL,
	from_date  date NOT NULL,
	to_date    date NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE titles(
	emp_no   int NOT NULL,
	title    VARCHAR(45) NOT NULL,
	from_date  date  NOT NULL,
	to_date    date 	NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES salaries (emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);



SELECT * FROM Departments;
