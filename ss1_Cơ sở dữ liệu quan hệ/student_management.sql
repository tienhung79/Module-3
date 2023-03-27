create database ss1_database_relationship;
use ss1_database_relationship;

create table class (
	id int primary key auto_increment,
    name varchar(50) not null
);
insert into class (name) value ('Ngo Tien Hung');
select *  from class;
update class set name ='Le Thi Thuy Duong';
delete from class;



create table teacher(
id int primary key auto_increment,
name varchar(50) not null,
age int,
country varchar(50) not null
);

insert into teacher (name,age,country) value ('Nguyen Cong Thanh Danh',12,'Da Nang');
select * from teacher;
update teacher set name = 'Ngo Tien Hung';
 delete from teacher;
 alter table teacher add email varchar(50);
 delete from teacher;
alter table teacher drop column email;
update teacher set email = 'ngotienhung2000@gmail.com' where id =2;
insert into teacher (name,age,country) value ('Nguyen Van A',18,'da nang');

create table family (
	id int primary key auto_increment,
    name_member varchar(50),
    age int 
);
insert into family (name_member,age) value ('Ngo Tien Hung',12);
insert into family (name_member) value('Nguyen Van A');
insert into family (name_member,age) value ('Nguyen Van B',12);
select * from family;
select name_member from family;
update family set name_member = 'Nguyen Van C' where id =2;
delete from family where id = 1;
delete from family where id = 3;
delete from family where age;
update family set name_member ='' where id =2;
set sql_safe_updates =0;
alter table class_room rename to classes;