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
    id_position_employee int,
    id_level_employee int,
    id_department_employee int ,
    foreign key (id_position_employee) references position (id_position),
    foreign key (id_level_employee) references level_employees (id_employees),
    foreign key (id_department_employee) references department (id_department)
);

create table position (
id_position int primary key auto_increment,
name_position varchar(45)
);

create table level_employees(
id_employees int primary key auto_increment,
name_level varchar(45)
);

create table department(
id_department int primary key auto_increment,
name_department varchar(45)
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
address_customer varchar (45),
foreign key (id_kind_of_customer) references kind_customer (id_kind_customer)
);

create table kind_customer (
id_kind_customer int  primary key auto_increment,
name_kind_customer varchar(45)
);

create table contact (
	id_contact int primary key auto_increment,
    date_start_contact datetime,
    date_finish_contact datetime,
    deposits_contact double,
    id_employees int,
    id_customer int,
    id_service int,
    foreign key (id_employees) references employees (id_employee),
    foreign key (id_customer) references customer (id_customer),
    foreign key (id_service) references service (id_service)
);

create table detail_contact (
	id_detail_contact int  primary key auto_increment,
    id_contact int,
    id_service int,
    quantity_contact int,
    foreign key (id_contact) references contact (id_contact),
    foreign key (id_service) references accompanied_service (id_accompanied_service)
);

create table accompanied_service (
id_accompanied_service int primary key auto_increment,
name_accompanied_service varchar(45),
price_accompanied_service double,
unit_accompanied_service varchar(10),
status_accompanied_service varchar (45)
);

create table service (
id_service int primary key auto_increment,
name_service varchar (45),
area_service int,
cost_service double,
max_people_service int,
id_kind_rent int,
id_kind_service int,
room_standard varchar(45),
description_utilities varchar(45),
area_swimmingpool double,
number_floors int,
foreign key (id_kind_rent) references kind_rent (id_kind_rent),
foreign key (id_kind_service) references kind_service (id_kind_service)
);

create table kind_rent(
	id_kind_rent int primary key auto_increment,
    name_kind_rent varchar(45)
);

create table kind_service(
	id_kind_service int primary key auto_increment,
    name_kind_service varchar(45)
);

