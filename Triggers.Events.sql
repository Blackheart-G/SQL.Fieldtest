-- Triggers and Events

select *
from employee_demographics;

select *
from employee_salary;

delimiter $$
create trigger employee_insert 
	after insert on employee_salary
    for each row 
begin
	Insert into employee_demographics (Employee_id, first_name, last_name)
    values (new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;


insert into employee_salary (Employee_id, first_name, last_name, occupation,salary, Dept_id)
values(13, 'Jean-Ralphio', 'Saperstein', 'Exntertainment 720 CEO', 1000000, Null);

-- Events

Select *
from employee_demographics

Delimiter $$
create event delete_retirees
on schedule every 30 second
do 
begin
	DELETE
    from employee_demographics
    where age >= 60;
end $$
delimiter ;

SHOW VARIABLES LIKE 'EVENT%';