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




