# Pewlett-Hackard-Analysi

## Employee Database Analysis 

Pewlett Hackard is a large company boasting several thousand employees.This analysis will help future-proof Pewlett Hackard by generating a list of all employees eligible for the retirement package. The main aim of the analysis is to find the answers of following questions:
Who will be retiring in the next few years? And how many positions will Pewlett Hackard need to fill. 
There are 6 tables from which we will extraxt the data and will create new tables and will find the answers of our questions. 
The six csvs are 
* Departments
* Employees
* Salaries
* Managers
* Dept_Emp
* Titles

We started by creating an ERD diagram. this will let us flow chart or the blue print of the tables and how they are related via primary key and foreign keys. 

![alt text](resources/ERD.png)


## Results

* Firstly we created the number of Retiring Employees by Title which contains the emp_no, first name , titles , from date and to_date of the employees whose birthdate is between 1952 to 1955. from the table it can be infered that high percentage of workforce could retire at given time.

![alt text](resources/query1.png)

![alt text](resources/table%20.png)


* Then some employees were having mutiple titles so we created table that contains the most recent title of each employee in the name of unique titles.


![alt text](resources/UNIQUE.png)

* Then we found out the number of employees by their most recent title who are about to retire and created retiring titles table. it was infered that highest number of employees are in staff and senior engineer departments.



![alt text](resources/retiring_titles.png)

* A query is written and executed to create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.

![alt text](resources/QUERY2.png)

![alt text](resources/table4.png)


## Summary

1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
 
There are 72,458 positions eligible to be impacted by this upcoming retirement wave called "Silver tsunami". 

2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Yes there are far enough qualified , retirement-ready employees in the departments to mentor next generation. this can be proof via table retirement_ready_employees.


Using the code shown below, we can display a new table that shows the total count of retiring employees, employees eligible for the mentor program, and the percentage of mentor-eligible employees to retiring employees by title. there are at least 14 retirement-ready employees available to mentor every 1 employee, depending on the position. Some positions have over 50 retirement-ready employees for every 1 employee eligible for mentors

 ![alt text](resources/query4.png)

 ![alt text](resources/table6.png)

 ![alt text](resources/query3.png)

 ![alt text](resources/table5.png)


