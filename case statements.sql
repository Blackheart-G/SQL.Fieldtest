-- case statements

select first_name,
last_name,
age,
case 
	when age <= 30 then 'young'
    when age between 31 and 50 then 'Old'
    when age >= 50 then 'on deaths door'
end as age_bracket
from employee_demographics;

-- pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- finance = 10%



select first_name, last_name, Salary,
case
	when salary <  50000 then salary * 1.05
    when salary > 50000 then salary * 1.07
end as new_salary,
case
	when Dept_id = 6 then salary * .10
end as bonus
from employee_salary; 