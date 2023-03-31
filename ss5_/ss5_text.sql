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
        
-- indexes 
explain select product_code, product_name, product_price, product_amount, product_description
from products where product_code= 1;
create unique index unique_index
on products (product_code);
explain select product_code, product_name, product_price,product_amount, product_description
 from products where product_code= 1;
 
explain select product_code, product_name, product_price, product_amount, product_description
from products where product_name = 'xe may' or product_price = '10000'; 
create index index_products 
on products (product_name, product_price);
explain select product_code, product_name, product_price
from products where product_name = 'xe may' or product_price = '10000';

-- view
create view view_product (product_code, product_name, product_price, product_status) as
select product_code, product_name, product_price, product_status
from products;
select * from view_product;
update view_product 
set product_name = 'tau thuy'
where product_code = 3;
drop view view_product;

 -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
 delimiter //
	create procedure get_all_product()
    begin
    select * from products;
    end
 // delimiter ;
 call get_product();
 
 -- Tạo store procedure thêm một sản phẩm mới
 delimiter //
	create procedure add_product()
    begin
    insert into products(product_code, 
    product_name, 
    product_price, 
    product_amount, 
    product_description, 
    product_status)
    value (5,'may bay',80000,14,'tau bay','oke');
    end
 // delimiter ;
 
 call add_product();
 -- Tạo store procedure sửa thông tin sản phẩm theo id
  set sql_safe_updates = 0;
 delimiter //
	create procedure edit_product()
    begin
    update products
    set product_description = 'phuong tien di lai '
    where id = 4;
    end
 // delimiter ;
 
 call edit_product();
 
-- Tạo store procedure xoá sản phẩm theo id
 delimiter //
	create procedure delete_product()
    begin
    delete from products
    where id = 4;
    end
 // delimiter ;
 call delete_product();