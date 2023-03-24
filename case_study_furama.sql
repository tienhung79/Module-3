create database furama;
use furama;

create table employees(
	id_employee int primary key auto_increment,
    name_employee varchar(45),
    date_of_birth_employee date,
    id_card_employee varchar(45),
    salary_employee double,
    phone_number_employee varchar(45),
    email_employee varchar (45),
    address_employee varchar (45),
    code_position_employee int,
    code_level_employee int,
    code_department_employee int 
);


create table customer (
id_customer int primary key auto_increment,
id_kind_of_customer int,
name_customer varchar (45),
date_of_birth_customer date,
gender_customer bit(1),
id_card_customer varchar (45),
phone_number_customer varchar (45),
email_customer varchar (45),
address_customer varchar (45)
);