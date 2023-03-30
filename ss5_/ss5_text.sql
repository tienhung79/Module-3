create database ss5_text;
use ss5_text;

create table products (
	id int primary key auto_increment,
    product_code int ,
    product_name varchar(45),
	product_price varchar(45),
	product_amount int,
	product_description varchar(45),
	product_status varchar (45)
);

insert into products (product_code,product_name,product_price,product_amount,product_description,product_status)
values (1,'xe hoi',23000,12,'phuong tien','tot'),
		(3,'xe may',12000,21,'phuong tien','binh thuong'),
		(2,'may bay',10000,24,'tau bay','oke');