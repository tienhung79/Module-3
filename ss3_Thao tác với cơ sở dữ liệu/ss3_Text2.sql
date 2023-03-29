create database ss3_text2;
use ss3_text2;

create table customer(
c_id int primary key auto_increment,
c_name varchar(45),
c_age int
);

select * from customer;

create table order_product (
o_id int primary key auto_increment,
c_id int,
o_date date,
o_total_price int,
foreign key (c_id) references customer (c_id)
);

select * from order_product;
create table order_detail (
	o_id int,
    p_id int,
    primary key (o_id,p_id),
    od_qty int,
    foreign key (o_id) references order_product (o_id),
    foreign key (p_id) references product (p_id)
);

select*from order_detail;
create table product (
	p_id int primary key auto_increment,
    p_name varchar(45),
    p_price int
);
select * from product;

insert into customer 
values (1,'Minh Quan',10),(2,'Ngoc Oanh',20),(3,'Hong Ha',50);
insert into order_product 
values (1,1,'2006-03-21',null),(2,2,'2006-03-23',null),(3,1,'2006-03-16',null);
insert into product 
values (1,'May giat',3),(2,'Tu Lanh',5),(3,'Dieu Hoa',7),(4,'Quat',1),(5,'Bep Dien',2);
insert into order_detail
values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select o_id,o_date,o_total_price from order_product;

select c_name,p_name from customer c 
inner join order_product o on c.c_id =  o.c_id
inner join order_detail od on od.o_id = o.o_id
inner join product p on od.p_id = p.p_id;

select c_name from customer c 
left join order_product o on c.c_id =  o.c_id 
where o.c_id is null; 

select o.o_id,o.o_date, sum(p.p_price * od.od_qty)  as o_total_price from customer c 
inner join order_product o on c.c_id =  o.c_id
inner join order_detail od on od.o_id = o.o_id
inner join product p on od.p_id = p.p_id 
group by o.o_id; 

select * from customer c  join order_product o on c.c_id= o.o_id ;


