-- string functions

select length('skyfall');

select first_name, Length(first_name)
from employee_demographics
order by 2;

select upper('sky');
select lower('sky');
select first_name, upper(first_name)
from employee_demographics;

select rtrim('           sky       ');


-- sub string
select first_name, 
left(first_name, 4),
right(first_name, 4),
substring(first_name,3,2),
birth_date,
substring(Birth_date,6,2) as birth_month
from employee_demographics;

-- replace

select first_name, replace (first_name, 'a','z')
from employee_demographics
;

select locate('j','josh');

select first_name, locate('a', first_name)
from employee_demographics;


select first_name, last_name,
concat(first_name,'  ',last_name) as full_name
from employee_demographics;