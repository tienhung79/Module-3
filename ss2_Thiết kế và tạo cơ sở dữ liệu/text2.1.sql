create database ss2_convert_ERD_to_relational_model;
use ss2_convert_ERD_to_relational_model;

create table export_slip(
	id_export int primary key auto_increment,
    date_export date
);

create table supplies(
	id_supplies int primary key auto_increment,
    name_supplies varchar(45)
);

create table detail_export(
	id_detail_export int,
    id_detail_supplies int,
    export_price int,
    export_name varchar(45),
    primary key (id_detail_export, id_detail_supplies),
    foreign key (id_detail_export) references export_slip(id_export),
    foreign key (id_detail_supplies) references supplies (id_supplies)
);

create table import_slip(
	id_import int primary key auto_increment,
    date_import date
);

create table detail_import(
	detail_id_import int,
    detail_id_supplies int,
    primary key (detail_id_import,detail_id_supplies),
    foreign key (detail_id_import) references import_slip(id_import),
    foreign key (detail_id_supplies) references supplies (id_supplies)
);

create table order_slip(
	id_order int primary key  auto_increment,
    date_order date
);
alter table order_slip add id_supplier int;
alter table order_slip add constraint fk_order_slip foreign key (id_supplier) references supplier (id_supplier);

create table detail_order(
	detail_id_supplies int,
    detail_id_order int,
    primary key (detail_id_supplies,detail_id_order),
    foreign key (detail_id_supplies) references supplies(id_supplies),
    foreign key (detail_id_order) references order_slip (id_order)
);

create table supplier (
	id_supplier int primary key auto_increment,
    name_supplier varchar(45),
    address_supplier varchar(45),
    phone_number varchar(45)
);

create table phone_number(
	id_phone_number int primary key auto_increment,
    phone_number varchar(45),
    id_phone_number_2 int,
    foreign key (id_phone_number_2) references supplier(id_supplier) 
);