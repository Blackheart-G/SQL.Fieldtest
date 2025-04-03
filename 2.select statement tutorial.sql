select *
FROM parks_and_recreation.employee_demographics;

select first_name,
last_name,
Birth_date,
age,
(age + 10) * 10 + 10
FROM parks_and_recreation.employee_demographics;
# pemdas 

select distinct first_name, gender
FROM parks_and_recreation.employee_demographics;
