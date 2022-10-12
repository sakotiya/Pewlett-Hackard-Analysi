drop table retirement_titles;

SELECT 
cast(em.emp_no as INT) as emp_no1, 
em.first_name, 
em.last_name, 
t1.title,
t1.from_date,
t1.to_date
INTO retirement_titles
FROM employees as em inner join 
titles as t1
on em.emp_no = t1.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no1, em.first_name ASC;

select * from retirement_titles;


-- Use Dictinct with Orderby to remove duplicate rows

drop table Unique_titles;


select DISTINCT ON (emp_no1) emp_no1,first_name, last_name, title
into Unique_titles
from retirement_titles
where to_date = '9999-01-01'
order by emp_no1 asc , to_date desc;

select * from 	Unique_titles;


 -- number of employees by their most recent job title who are about to retire
 
 Select Count(title) , title
 INTO retiring_titles
 FROM unique_titles
 GROUP BY title
 ORDER BY count(title) desc
 
SELECT  * FROM retiring_titles
 

 --create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965. 


drop table mentorship_table;

SELECT 
DISTINCT ON (em.emp_no::INTEGER) em.emp_no,
em.first_name, 
em.last_name, 
em.birth_date,
de.from_date, 
de.to_date, 
t1.title
INTO Mentorship_table
FROM 
employees AS em INNER JOIN 
dept_emp AS de
ON  (em.emp_no = de.emp_no)
INNER JOIN titles as t1
ON  (em.emp_no = t1.emp_no)
WHERE   (de.to_date = '9999-01-01')AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY em.emp_no::INTEGER;
 
select * from Mentorship_table
 
 
 -- Creating mentor_title_count table 
 SELECT title,
  	COUNT(title)
  INTO mentor_title_count
  FROM Mentorship_table
  GROUP BY title;
  
  select * from mentor_title_count

-- Creating comparision table data 
 SELECT rc.title,
  rc.total_number as retire_count,
  	mc.count as mentoree_count
  INTO comparison_data
  FROM retiring_titles as rc
  LEFT JOIN mentor_title_count as mc
  ON (rc.title = mc.title)

  
  select * from comparison_data
  drop table comparison_data
  
  SELECT title, mentoree_count, retire_count, 
			ROUND(mentoree_count * 100.0 / retire_count, 1) AS Percent
  FROM comparison_data;
