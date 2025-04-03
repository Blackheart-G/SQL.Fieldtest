-- Store Procedures

Select *
From employee_salary
where salary >= 50000;


create procedure large_salaries()
Select *
From employee_salary
where salary >= 50000;

call large_salaries();

Delimiter $$
create procedure large_salaries3()
begin
	Select *
	From employee_salary
	where salary >= 50000;
	Select *
	From employee_salary
	where salary >= 10000;
End $$
delimiter ;


call large_salaries3();


Delimiter $$
create procedure large_salaries4(p_employee_id int)
begin
	Select salary
	From employee_salary
	where empolyee_id = p_employee_id
    ;
End $$
delimiter ;

call large_salaries4(1);
