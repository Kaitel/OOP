

select dept_name , count(dept_name) as "count"
from instructor
JOIN department 
ON instructor.dept_id = department.dept_id
group by dept_name
having count(dept_name)  = 1

select name, department.dept_name, building
from instructor, department
where instructor.dept_id = department.dept_id

select  MIN(salary) as "salary", 
from instructor
natural join teaches  

select * from teaches



select I.name as "instructor name", T.course_id
from instructor as I , teaches as T
where I.ID = T.ID;


select distinct T.name , S.dept_id
from instructor as T, instructor as S
where T.salary > S.salary and S.dept_id = '1';


select * from instructor
select name, salary
from instructor
where salary = 40000


select dept_name , count(dept_name) as "count"
from instructor
JOIN department 
ON instructor.dept_id = department.dept_id
group by dept_name
SELECT  MIN(salary) FROM instructor GROUP BY dept_id ;

select min(salary) from instructor
select sum(salary) from instructor
select avg(salary) from instructor
select count(name) from instructor
select * from instructor where salary = (select min(salary) from instructor) 


select  * from instructor order by salary DESC
select  count(dept_id) , max(salary)
from instructor
group by dept_id



select * from instructor where salary < (select max(salary) from instructor)   limit 1


select max(salary) from instructor where salary < (select max(salary) from instructor)    


select *
from instructor
where salary = ( select max(salary) from  instructor where salary < (select max(salary) from instructor))


select * from instructor

with result as
(
  select * , dense_rank() over  ( order by salary desc) as rank
  from instructor
)
select  * from result where rank = 2


with result as
(
  SELECT  * from  instructor  limit 2
)
select  * from result  

 



select dept_name , building
from department
where building like '%Wat%'



select name
from instructor
order by name desc


select name
from instructor
where salary between 90000 and 100000



(select course_id
from section
where semester = 'Fall' and year= 2009)
union
(select course_id
from section
where semester = 'Spring' and year= 2010)

select *
from section


(select course_id
from section
where semester = 'Fall' and year = 2009)
except
(select course_id
from section
where semester = 'Spring' and year= 2010)



select count (distinct ID)
from teaches
where semester = 'Spring' and year = 2010

select D.dept_name,max(salary)  from instructor as I
join department  AS D
on I.dept_id = d.dept_id
group by d.dept_name



select dept_id, count ( ID) as "instr count"
from instructor natural join teaches
where semester = 'Spring'
group by dept_id


select * from instructor



select dept_id, avg (salary) as "avg salary"
from instructor
group by dept_id
having count (dept_id)  = 3


select * from course


select distinct course_id
from section
where semester = 'Fall' and year= 2009;



select course_id
from section
where semester = 'Spring' and year= 2010;

select distinct course_id
from section
where semester = 'Fall' and year = 2009 and
course_id not in (select course_id
from section
where semester = 'Spring' and year= 2010);



