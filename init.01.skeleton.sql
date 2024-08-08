use store ;

create table employee (
employee_id int primary key,
last_name varchar(40),
first_name varchar(20),
birth_date date not null,
hire_date date not null,
address varchar(128) not null,
city varchar(30) not null,
counttry varchar(30) not null,
reorts_to int not null
);

ALTER TABLE employee ADD CONSTRAINT FOREIGN KEY (`reorts_to`) REFERENCES employee (`employee_id`);

create table purchase (
purchase_id int primary key, 
customer_id int, 
employee_id int,
total_price decimal(10.2),
purchase_data timestamp not null,
shipped_data timestamp not null,
ship_addres varchar(60) not null,
ship_city varchar(15) not null,
ship_counttry varchar(15) not null
);

ALTER TABLE purchase ADD CONSTRAINT FOREIGN KEY (`employee_id`) REFERENCES employee (`employee_id`);

create table customer (
customer_id int primary key, 
contact_name varchar(30), 
company_name varchar(40) not null,
contact_email varchar(128),
address varchar(120) not null,
city varchar(30) not null,
country varchar(30) not null
);

ALTER TABLE purchase ADD CONSTRAINT FOREIGN KEY (`customer_id`) REFERENCES customer (`customer_id`);

create table purchase_item (
purchase_id int, 
product_id int, 
unit_price decimal(10.2) not null,
quantity int,
primary key (purchase_id, product_id)
);


ALTER TABLE purchase_item ADD CONSTRAINT FOREIGN KEY (`purchase_id`) REFERENCES purchase (`purchase_id`);

create table product (
product_id int primary key, 
product_name varchar(45), 
category_id int,
quantity_per_unit int,
unit_price decimal(10.2) not null,
units_in_stock int not null,
discontinued boolean not null
);

ALTER TABLE purchase_item ADD CONSTRAINT FOREIGN KEY (`product_id`) REFERENCES product (`product_id`);

create table category (
category_id  int primary key, 
name varchar(60) , 
description text not null,
parent_category_id int not null
);

ALTER TABLE category ADD CONSTRAINT FOREIGN KEY (`parent_category_id`) REFERENCES category (`category_id`);

ALTER TABLE product ADD CONSTRAINT FOREIGN KEY (`category_id`) REFERENCES category (`category_id`);