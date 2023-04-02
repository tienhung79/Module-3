create database furama;
use furama;

-- customer
create table kind_customer (
id_kind_customer int  primary key auto_increment,
name_kind_customer varchar(45)
);

create table customer (
id_customer int primary key auto_increment,
name_customer varchar (45),
date_of_birth_customer date,
gender_customer bit(1),
id_card_customer varchar (45),
phone_number_customer varchar (45),
email_customer varchar (45),
address_customer varchar (45),
id_kind_of_customer int,
foreign key (id_kind_of_customer) references kind_customer (id_kind_customer)
);
-- service 
create table kind_service(
	id_kind_service int primary key auto_increment,
    name_kind_service varchar(45)
);

create table kind_rent(
	id_kind_rent int primary key auto_increment,
    name_kind_rent varchar(45)
);

create table service (
id_service int primary key auto_increment,
name_service varchar (45),
area_service int,
cost_service double,
max_people_service int,
room_standard varchar(45),
description_utilities varchar(45),
area_swimmingpool double,
number_floors int,
id_kind_rent int,
id_kind_service int,
foreign key (id_kind_rent) references kind_rent (id_kind_rent),
foreign key (id_kind_service) references kind_service (id_kind_service)
);
-- employee 
create table position (
id_position int primary key auto_increment,
name_position varchar(45)
);

create table department(
id_department int primary key auto_increment,
name_department varchar(45)
);

create table level_employees(
id_employees int primary key auto_increment,
name_level varchar(45)
);

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
-- contract
create table accompanied_service (
id_accompanied_service int primary key auto_increment,
name_accompanied_service varchar(45),
price_accompanied_service double,
unit_accompanied_service varchar(10),
status_accompanied_service varchar (45)
);

create table contract (
	id_contract int primary key auto_increment,
    date_start_contract datetime,
    date_finish_contract datetime,
    deposits_contract double,
    id_employees int,
    id_customer int,
    id_service int,
    foreign key (id_employees) references employees (id_employee),
    foreign key (id_customer) references customer (id_customer),
    foreign key (id_service) references service (id_service)
);

create table detail_contract (
	id_detail_contract int  primary key auto_increment,
    quantity_contract int,
    id_contract int,
    id_service int,
    foreign key (id_contract) references contract (id_contract),
    foreign key (id_service) references accompanied_service (id_accompanied_service)
);

insert into position (name_position)
values  ('Quản lý '),
		('Nhân Viên');
        
insert into level_employees (name_level)
values ('Trung Cấp'),
		('Cao Đẳng '),
		('Đại Học '),
		('Sau Đại Học');
        
insert into department (name_department)
values ('Sale-Marketing'),
		('Hành chính '),
		('Phục vụ'),
		('Quản lý');
        
insert into employees ( name_employee,date_of_birth_employee,id_card_employee,salary_employee,phone_number_employee,email_employee,address_employee,id_position_employee,id_level_employee,id_department_employee)
values ('Nguyễn Văn An',	'1970-11-07','456231786'	,10000000	,'0901234121'	,'annguyen@gmail.com',	'295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),
('Lê Văn Bình','1997-04-09',	'654231234',	7000000	,'0934212314',	'binhlv@gmail.com',	'22 Yên Bái, Đà Nẵng',1,2,2),
('Hồ Thị Yến', '1995-12-12',	'999231723',	14000000	,'0412352315'	,'thiyen@gmail.com',	'234/11 Điện Biên Phủ, Gia Lai',1,3,2),
('Võ Công Toản',	'1980-04-04',	'123231365',	17000000	,'0374443232'	,'toan0404@gmail.com'	,'77 Hoàng Diệu, Quảng Trị',1,4,4),
('Nguyễn Bỉnh Phát',	'1999-12-09','454363232',	6000000	,'0902341231',	'phatphat@gmail.com',	'43 Yên Bái, Đà Nẵng',2,1,1),
('Khúc Nguyễn An Nghi',	'2000-11-08',	'964542311',	7000000	,'0978653213',	'annghi20@gmail.com',	'294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
('Nguyễn Hữu Hà',	'1993-01-01','534323231',	8000000,'0941234553	','nhh0101@gmail.com',	'4 Nguyễn Chí Thanh, Huế',2,3,2),
('Nguyễn Hà Đông',	'1989-09-03',	'234414123',	9000000	,'0642123111'	,'donghanguyen@gmail.com'	,'111 Hùng Vương, Hà Nội',2,4,4),
('Tòng Hoang',	'1982-09-03',	'256781231',	6000000	,'0245144444'	,'hoangtong@gmail.com',	'213 Hàm Nghi, Đà Nẵng',2,4,4),
('Nguyễn Công Đạo',	'1994-01-08'	,'755434343'	,8000000	,'0988767111','	nguyencongdao12@gmail.com',	'6 Hoà Khánh, Đồng Nai',2,3,2);

insert into kind_customer (name_kind_customer)
values ('Diamond'),
		('Platinium'),
		('Gold'),
		('Silver'),
		('Member');
        
insert into customer (name_customer,date_of_birth_customer,gender_customer,id_card_customer,phone_number_customer,email_customer,address_customer,id_kind_of_customer)
values  ('Nguyễn Thị Hào','1970-11-07'	,0,	'643431213',	'0945423362'	,'thihao07@gmail.com',	'23 Nguyễn Hoàng, Đà Nẵng'	,5),
('Phạm Xuân Diệu'	,'1992-08-08'	,1	,'865342123',	'0954333333'	,'xuandieu92@gmail.com',	'K77/22 Thái Phiên, Quảng Trị'	,3),
('Trương Đình Nghệ','1990-02-27',	1	,'488645199	','0373213122',	'nghenhan2702@gmail.com',	'K323/12 Ông Ích Khiêm, Vinh	',1),
('Dương Văn Quan',	'1981-07-08',1,	'543432111',	'0490039241',	'duongquan@gmail.com',	'K453/12 Lê Lợi, Đà Nẵng	',1),
('Hoàng Trần Nhi Nhi',	'1995-12-09',	0,	'795453345',	'0312345678	','nhinhi123@gmail.com',	'224 Lý Thái Tổ, Gia Lai	',4),
('Tôn Nữ Mộc Châu',	'2005-12-06',0	,'732434215','0988888844'	,'tonnuchau@gmail.com'	,'37 Yên Thế, Đà Nẵng'	,4),
('Nguyễn Mỹ Kim',	'1984-04-08'	,0	,'856453123',	'0912345698'	,'kimcuong84@gmail.com'	,'K123/45 Lê Lợi, Hồ Chí Minh	',1),
('Nguyễn Thị Hào',	'1999-04-08',0	,'965656433',	'0763212345'	,'haohao99@gmail.com',	'55 Nguyễn Văn Linh, Kon Tum',	3),
('Trần Đại Danh',	'1994-07-01',1	,'432341235',	'0643343433	','danhhai99@gmail.com'	,'24 Lý Thường Kiệt, Quảng Ngãi	',1),
('Nguyễn Tâm Đắc',	'1989-07-01',1	,'344343432',	'0987654321'	,'dactam@gmail.com'	,'22 Ngô Quyền, Đà Nẵng',2);

insert into kind_rent (name_kind_rent)
values ('year'),
		('month'),
		('day'),
		('hour');

insert into kind_service (name_kind_service)
values ('Villa'),
		('House'),
		('Room');
 
insert into service (name_service,area_service,cost_service,max_people_service,room_standard,
description_utilities,area_swimmingpool,number_floors,id_kind_rent,id_kind_service) 
values ('Villa Beach Front',	25000,	10000000,	10,	'vip',	'Có hồ bơi',	500,	4,	3,	1),
		('House Princess 01',	14000,	5000000	,7	,'vip',	'Có thêm bếp nướng',null,	3,	2,	2),
		('Room Twin 01',	5000	,1000000,	2	,'normal',	'Có tivi',null,	null,	4, 3),
		('Villa No Beach Front',	22000,	9000000	,8,	'normal',	'Có hồ bơi' ,	300,	3,	3,	1),
		('House Princess 02',	10000	,4000000,	5,	'normal',	'Có thêm bếp nướng',	null,	2,	3,	2),
		('Room Twin 02',	3000,	900000,	2,	'normal',	'Có tivi',	null,	null,	4,	3);

insert into accompanied_service (name_accompanied_service,price_accompanied_service,unit_accompanied_service,status_accompanied_service)
values ('Karaoke',	10000,	'giờ',	'tiện nghi, hiện tại'),
		('Thuê xe máy',	10000	,'chiếc',	'hỏng 1 xe'),
		('Thuê xe đạp',	20000	,'chiếc',	'tốt'),
		('Buffet buổi sáng',	15000,	'suất',	'đầy đủ đồ ăn, tráng miệng'),
		('Buffet buổi trưa',	90000,	'suất',	'đầy đủ đồ ăn, tráng miệng'),
		('Buffet buổi tối',	16000	,'suất',	'đầy đủ đồ ăn, tráng miệng');
        
insert into contract (date_start_contract,date_finish_contract,deposits_contract,id_employees,id_customer,id_service)
values ('2020-12-08',	'2020-12-08',	0,	3,	1,	3),
		('2020-07-14',	'2020-07-21',	200000,	7,	3,	1),
		('2021-03-15',	'2021-03-17',	50000,	3,	4,	2),
		('2021-01-14',	'2021-01-18',	100000,	7,	5,	5),
		('2021-07-14',	'2021-07-15',	0,	7,	2,	6),
		('2021-06-01',	'2021-06-03',	0,	7,	7,	6),
		('2021-09-02',	'2021-09-05',	100000	,7,	4,	4),
		('2021-06-17',	'2021-06-18',	150000,	3,	4,	1),
		('2020-11-19',	'2020-11-19',	0,	3,	4,	3),
		('2021-04-12',	'2021-04-14',	0,	10,	3,	5),
		('2021-04-25',	'2021-04-25',	0,	2,	2,	1),
		('2021-05-25',	'2021-05-27',	0,	7,	10,	1);
        
insert into detail_contract (quantity_contract,id_contract,id_service)
values (5,2,4),
		(8,2,5),
		(15,2,6),
		(1,3,1),
		(11,3,2),
		(1,1,3),
		(2,1,2),
		(2,12,2);
-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from employees
where (name_employee like ('h%') or name_employee like ('t%') or name_employee like ('k%')) and char_length(name_employee <=15);

-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *, year(current_date())-year(date_of_birth_customer) as age_customer from customer
where year((current_date())-year(date_of_birth_customer)>18 and  year(current_date())-year(date_of_birth_customer) < 50 )and address_customer
like ('%Đà Nẵng') or address_customer like ('%Quảng Trị');

-- 4.  Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần
-- theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select customer.* ,count(contract.id_customer) from customer  
inner join kind_customer on kind_customer.id_kind_customer = customer.id_kind_of_customer
inner join contract on customer.id_customer = contract.id_customer
where kind_customer.name_kind_customer = 'Diamond'
group by contract.id_customer
order by count(contract.id_customer);

-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select customer.id_customer,name_customer,kind_customer.name_kind_customer,contract.id_contract,service.name_service,
contract.date_start_contract,contract.date_finish_contract,ifnull(sum(quantity_contract*price_accompanied_service),0)+service.cost_service
 as sum from kind_customer 
inner join customer on customer.id_kind_of_customer = kind_customer.id_kind_customer
inner join contract on customer.id_customer = contract.id_customer
left join service on service.id_service = contract.id_service
left join detail_contract on contract.id_contract = detail_contract.id_contract
left join accompanied_service on accompanied_service.id_accompanied_service = detail_contract.id_service 
group by customer.id_customer ;
set global sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));     

-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select service.id_service, service.name_service, service.area_service, service.cost_service, contract.date_start_contract
, contract.date_finish_contract
from  kind_service
inner join  service on kind_service.id_kind_service = service.id_kind_service
inner join contract on contract.id_service =  service.id_service
inner join customer on contract.id_customer = customer.id_customer
where service.id_service not in (
select service.id_service
from  kind_service
inner join  service on kind_service.id_kind_service = service.id_kind_service
inner join contract on contract.id_service =  service.id_service
inner join customer on contract.id_customer = customer.id_customer
where  ((contract.date_start_contract)>='2021-01-01' and date(contract.date_start_contract) <= '2021-03-31') or  year(contract.date_start_contract) = '2020' );

-- 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021. 

select service.id_service, service.name_service, service.area_service, service.max_people_service ,service.cost_service, contract.date_start_contract
, contract.date_finish_contract, contract.id_contract
from  kind_service
inner join  service on kind_service.id_kind_service = service.id_kind_service
inner join contract on contract.id_service =  service.id_service
where year(contract.date_start_contract) = 2020;

-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau
-- Cách 1 
select customer.name_customer from customer
union select customer.name_customer from customer; 
-- Cách 2
select distinct name_customer from customer;
-- Cách 3
select name_customer from customer
group by name_customer;

-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng

select month(contract.date_start_contract),count(contract.id_customer) from  contract 
where year(contract.date_start_contract) = 2021
group by month(contract.date_start_contract); 

-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select contract.id_contract,contract.date_start_contract,contract.date_finish_contract, contract.deposits_contract, ifnull(sum(detail_contract.quantity_contract),0)
from contract
left join detail_contract on detail_contract.id_contract = contract.id_contract
left join accompanied_service on accompanied_service.id_accompanied_service = detail_contract.id_service 
group by contract.id_contract;

-- 11. Hiển thị thông tin các dịch vụ đi kèm đã được 
-- sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.


select accompanied_service.*, customer.address_customer,kind_customer.name_kind_customer,customer.name_customer from kind_customer 
inner join customer on customer.id_kind_of_customer = kind_customer.id_kind_customer
inner join contract on customer.id_customer = contract.id_customer
left join service on service.id_service = contract.id_service
left join detail_contract on contract.id_contract = detail_contract.id_contract
left join accompanied_service on accompanied_service.id_accompanied_service = detail_contract.id_service
where kind_customer.name_kind_customer = 'Diamond' and ( customer.address_customer like '%Vinh' 
or customer.address_customer like  '%Quãng Ngãi');

-- 12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
--  so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
--  tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
--  nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select contract.id_contract, employees.name_employee, customer.name_customer,customer.phone_number_customer,
 accompanied_service.name_accompanied_service, contract.deposits_contract,contract.date_start_contract, sum(detail_contract.quantity_contract) from employees 
inner join contract on employees.id_employee = contract.id_employees 
inner join customer on customer.id_customer = contract.id_customer
inner join detail_contract on contract.id_contract = detail_contract.id_contract
inner join accompanied_service on accompanied_service.id_accompanied_service = detail_contract.id_service
where (month(contract.date_start_contract) in (10,11,12)
and year(contract.date_start_contract) = 2020)  and contract.date_start_contract not in (
select contract.date_start_contract from employees 
inner join contract on employees.id_employee = contract.id_employees 
inner join customer on customer.id_customer = contract.id_customer
inner join detail_contract on contract.id_contract = detail_contract.id_contract
inner join accompanied_service on accompanied_service.id_accompanied_service = detail_contract.id_service 
where (month(contract.date_start_contract) in (1,2,3,4,5,6)
and year(contract.date_start_contract) = 2021) );

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select id_accompanied_service,name_accompanied_service,price_accompanied_service,unit_accompanied_service,
status_accompanied_service, sum(detail_contract.quantity_contract)  as count from kind_customer 
inner join customer on customer.id_kind_of_customer = kind_customer.id_kind_customer
inner join contract on customer.id_customer = contract.id_customer
inner join service on service.id_service = contract.id_service
inner join detail_contract on contract.id_contract = detail_contract.id_contract
inner join accompanied_service on accompanied_service.id_accompanied_service = detail_contract.id_service 
group by contract.id_contract;

 -- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, 
 -- ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select id_accompanied_service,name_accompanied_service,price_accompanied_service,unit_accompanied_service,
status_accompanied_service, count(accompanied_service.id_accompanied_service)  as count from kind_customer 
inner join customer on customer.id_kind_of_customer = kind_customer.id_kind_customer
inner join contract on customer.id_customer = contract.id_customer
inner join service on service.id_service = contract.id_service
inner join detail_contract on contract.id_contract = detail_contract.id_contract
inner join accompanied_service on accompanied_service.id_accompanied_service = detail_contract.id_service 
group by accompanied_service.id_accompanied_service having count(accompanied_service.id_accompanied_service) =1; 

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, 
-- ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select employees.id_employee, employees.name_employee, level_employees.name_level, department.name_department,
employees.phone_number_employee,employees.address_employee, contract.id_contract,
if(contract.id_contract =0,0,count(contract.id_contract)) from employees 
left join contract on employees.id_employee = contract.id_employees
left join department on department.id_department = employees.id_department_employee
left join level_employees on level_employees.id_employees = employees.id_level_employee
group by employees.id_employee having count(employees.id_employee) <3








