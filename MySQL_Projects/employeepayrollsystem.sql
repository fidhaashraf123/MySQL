create database EmployeePayrollSystem;
use EmployeePayrollSystem;

#tables:-
#Employees Table:-
create table employees(employee_id int not null unique auto_increment primary key,
employee_name varchar(255) not null,
department varchar(100)not null,position varchar(100) not null,
hire_date date ,base_salary decimal(10,2));

#attendence table
create table attendence(attendence_id int not null unique auto_increment primary key,
employee_id int,attendence_date date,status enum('present','absent','leave'),
foreign key(employee_id)references employees(employee_id));

#salaryies table
create table salaries(salary_id int not null unique auto_increment primary key,
employee_id int,base_salary decimal(10,2),bonus decimal(10,2),
deductions decimal(10,2),month varchar(20),year int,
foreign key(employee_id)references employees(employee_id));

#payroll table
create table payroll(payroll_id int not null unique auto_increment primary key,
employee_id int,total_salary decimal(10,2),
payment_date date,
foreign key(employee_id)references employees(employee_id));

#1:-insert sql
#insert employees
INSERT INTO employees (employee_id,employee_name, department, position, hire_date, base_salary)
VALUES
(1,'Fidha Ashraf', 'HR', 'HR Manager', '2022-01-15', 30000.00),
(2,'Anjali Mohan', 'IT', 'Software Developer', '2021-06-10', 50000.00),
(3,'Shyam Das', 'Finance', 'Accountant', '2023-03-01',25000.00),
(4,'Arjun Mohan','IT','System Administrator','2022-02-10',55000.00);

#insert attendance
INSERT INTO attendence(attendence_id,employee_id,attendence_date,status)values
(1,1,'2026-01-02','present'),
(2,2,'2026-01-02','present'),
(3,3,'2026-01-02','absent'),
(4,4,'2026-01-02','present');

#insert salaries
INSERT INTO salaries(salary_id,employee_id,base_salary,bonus,deductions,month,year)values
(1,1,30000.00,5000.00,1000.00,'january',2026),
(2,2,50000.00,3000.00,1500.00,'january',2026),
(3,3,25000.00,2000.00,1000.00,'january',2026),
(4,4,55000.00,6000.00,2000.00,'january',2026);

#insert payroll
INSERT INTO payroll(payroll_id,employee_id,total_salary,payment_date)values
(1,1,34000.00,'2026-02-01'),
(2,2,51500.00,'2026-02-01'),
(3,3,26000.00,'2026-02-01'),
(4,4,59000.00,'2026-02-01');

#2.ADD new employees
INSERT INTO employees(employee_id,employee_name, department, position, hire_date, base_salary)
VALUES(5,'sana akbar','Marketing','Marketing Executive','2023-03-04',22000.00);

#3.Update employee information
update employees
set position='Senior Software Developer',
department='IT',
base_salary=52000.00
where employee_id=2;

#4.delete employee recorords
delete from salaries
where employee_id=2;



#5.Track employee attendence
select e.employee_id,e.employee_name,
a.attendence_date,a.status
from employees e
join attendence a on e.employee_id=a.employee_id;




#6.calculate salary
select e.employee_id,e.employee_name, (s.base_salary+s.bonus-s.deductions) as Total_salary 
from salaries s
join employees e on s.employee_id=e.employee_id;

#7.manage deductions and bonuses
update salaries
set bonus=5000.00,
deductions=2500.00
where employee_id=1;

update salaries
set bonus=4000.00,
deductions=2000.00
where employee_id=2;

update salaries
set bonus=3000.00,
deductions=1500.00
where employee_id=3;

update salaries
set bonus=2000.00,
deductions=500.00
where employee_id=4;

#8.update payroll records;
select e.employee_id,e.employee_name,s.base_salary,s.bonus,s.deductions,
(s.base_salary + s.bonus -s.deductions) as total_salary,p.payment_date
from employees e
join salaries s on e.employee_id=s.employee_id
join payroll p on e.employee_id=p.employee_id;

#9. generate pay slips
#for employee no-1
SELECT 
    e.employee_id,
    e.employee_name,
    e.department,
    e.position,
    s.month,
    s.year,
    s.base_salary,
    s.bonus,
    s.deductions,
    (s.base_salary + s.bonus - s.deductions) AS total_salary,
    p.payment_date
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN payroll p ON e.employee_id = p.employee_id
where e.employee_id=1;

#for employee no-2
SELECT 
    e.employee_id,
    e.employee_name,
    e.department,
    e.position,
    s.month,
    s.year,
    s.base_salary,
    s.bonus,
    s.deductions,
    (s.base_salary + s.bonus - s.deductions) AS total_salary,
    p.payment_date
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN payroll p ON e.employee_id = p.employee_id
where e.employee_id=2;

#for employee no-3
SELECT 
    e.employee_id,
    e.employee_name,
    e.department,
    e.position,
    s.month,
    s.year,
    s.base_salary,
    s.bonus,
    s.deductions,
    (s.base_salary + s.bonus - s.deductions) AS total_salary,
    p.payment_date
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN payroll p ON e.employee_id = p.employee_id
where e.employee_id=3;

#for employee no-4
SELECT 
    e.employee_id,
    e.employee_name,
    e.department,
    e.position,
    s.month,
    s.year,
    s.base_salary,
    s.bonus,
    s.deductions,
    (s.base_salary + s.bonus - s.deductions) AS total_salary,
    p.payment_date
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN payroll p ON e.employee_id = p.employee_id
where e.employee_id=4;

#10.generate payroll reports
SELECT
    e.employee_id,
    e.employee_name,
    e.department,
    e.position,
#attendence
    a.attendence_date,a.status,
    #Salary details 
    s.month,s.year,s.base_salary,s.bonus,
    s.deductions,(s.base_salary + s.bonus - s.deductions) AS total_salary,
    #payroll
    p.payment_date,
    p.total_salary
FROM employees e
 JOIN attendence a ON e.employee_id = a.employee_id
 JOIN salaries s ON e.employee_id = s.employee_id
 JOIN payroll p ON e.employee_id = p.employee_id;