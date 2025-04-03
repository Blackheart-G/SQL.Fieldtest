-- Temporary Tables

create temporary table Temp_table3
(first_name varchar(50),
last_name Varchar(50),
Favorite_movie varchar(100)
);

select *
from Temp_table3;

insert into temp_table3 values ('alex','freberg','lord of the rings the two towers');

select * from temp_table3;




CREATE TEMPORARY TABLE Temp_table (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    favorite_movie VARCHAR(100)
);

-- Insert data
INSERT INTO Temp_table VALUES ('Alex', 'Freberg', 'Lord of the Rings: The Two Towers');

-- Retrieve data
SELECT * FROM Temp_table;

show tables ;





select *
from employee_salary;

create temporary table salary_over_50k
select *
from employee_salary
where salary >= 50000;






