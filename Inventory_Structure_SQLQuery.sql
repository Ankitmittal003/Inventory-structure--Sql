--create database and use
create database Inventorystructure ;
use Inventorystructure

-- CREATE TABLES
---- Create table for Supplier
create table Supplier(S_id char(5),S_Name varchar(15),
S_Addr varchar(60)
,S_City varchar(15),S_phone varchar(10)
,s_email varchar(30));

---- Create table for Customer
create table Customer(C_id char(5),C_Name varchar(15)
,C_Addr varchar(60),C_City varchar(15)
,C_phone varchar(10),C_email varchar(30),
C_DOB Date );

---- Create table for product
create table product(P_Id char(5), p_desc varchar(40), Price money, Category varchar(15), S_ID Char(5))
select * from product

---- create table for Orders
create table orders (O_id char(5), O_Date Date , C_ID Char(5),P_id char(5),O_QTY int)
Select * from Orders;

---- create table for stock
create table stock(P_ID char(5), S_Qty int, ROL int , MOQ int)
select * from stock;


-- Add constraints in Supplier Table
---- Make S_ID as primary Key
Alter table supplier
alter column S_id char(5) not null;

Alter table supplier
add constraint SPK Primary key(S_ID);

---- Add constrain NOT NUL in S_Name and S_Addr
Alter table supplier 
alter column S_Name varchar(10) Not null;

Alter table supplier
alter column S_Addr varchar(60) Not null;

---- Add constrain default in S_city
alter table supplier
add constraint City_Delhi default 'Delhi' For S_City;

---- Add unique constrain in s_mobile
alter table supplier
add constraint Unique_mobile Unique (s_phone); 
 

--Add constrain in customer table

----Make C_ID as Primary Key
Alter table customer
alter column c_id char(5) not null;

Alter table Customer
add constraint CPK Primary key(C_ID);

---- Add constrain NOT NULL
Alter table Customer 
alter column C_Name varchar(10) Not null;

Alter table Customer
alter column C_Addr varchar(60) Not null;

Alter table Customer
alter column C_City varchar(15) Not null;

Alter table Customer
alter column C_Phone char(10) Not null;

Alter table Customer
alter column C_Email varchar(20) Not null;

---- Add check constraint in C_DOB
alter table customer
add constraint above2000 check (C_DOB<'jan 1,2001');

-- Add constraint in product table
---- Make p_Id as primary key
alter table product 
alter column P_ID char(5) not null;

alter table product 
add constraint PPK primary key (P_ID);

---- make p_desc as primary key
alter table product
alter column P_desc varchar(40) not null;

---- add constraint for price is greater than 0
alter table product 
add constraint notequalto0 check(price>0);

---- ADD product category should be in IT , HA , HC
alter table product 
add constraint outofcategory check (Category in ('IT','HA','HC'));

---- Make s_id as foreign key
alter table product
add constraint SIDforeign foreign key(S_ID) references supplier(s_ID);


-- Add constraint in orders table
---- Make O_ID as primary key
alter table orders
alter column O_ID char(5) not null;
alter table orders
add constraint OPK primary key (O_ID) ;

---- Make C_id and P_id as foreign key
alter table orders
add constraint CIDforeign foreign key(C_ID) references customer(C_ID);

alter table orders
add constraint PIDforeign foreign key(P_ID) references product(P_ID);

---- Add constraint for qty greater than 1
alter table orders
add constraint QTY check(O_Qty>=1);


--Add constraint in stock table
---- make P_id as foreign key
 alter table stock
 add constraint PIDforeignkey foreign key (P_ID) references product (P_ID)
 
---- add constraint for s_qty>=1 ,ROL>1 and MOQ>=5
alter table stock
add constraint SQty check(S_QTY>=1 and ROL>1 and MOQ>=5)


--ADD Data in the tables
---- Add Data in supplier table
insert into supplier
values('S0001','Rohan','Najafgarh','Delhi','8738495833','Rohan@gmail.com')

insert into supplier
values('S0002','Kartik','Dwarka','Delhi','8478656633','Kartikss@gmail.com')

insert into supplier
values('S0003','Sonu','sec 15','noida','9478886633','sonu47@gmail.com')

insert into supplier
values('S0004','Vishal','Rajender place','delhi','9497366633','vish373@gmail.com')

insert into supplier
values('S0005','Anshul','Patel Nagar','Delhi','9982587633','anshul888@gmail.com')

----Add data in customer table
select * from customer;
 insert into customer
values('C0001','Ankit','najafgarh','Delhi','8800730293','ankit007@gmail.com','Jan 29,1998')

 insert into customer
values('C0002','Soni','Nangloi','Delhi','8758473857','sonni8@gmail.com','June 9,1991')

  insert into customer
values('C0003','Umesh','Uttam nagar','Delhi','9365736483','umeshjd@gmail.com','sep 2,1996')

 insert into customer
values('C0004','Jatin','Rajouri','Delhi','8936475738','jTINFH@gmail.com','oct 26,1999')

 insert into customer
values('C0005','Yogesh','SEC-15','Ghaziabad','7046583743','YOGI@gmail.com','nov 19,1992')

 insert into customer
values('C0006','Abhishek','Sec-16','Gurugram','9073846273','abhi89@gmail.com','Jan 9,1995')

----Add data in product table
insert into product
values('P0001','Lights',2000,'HA','S0001')

insert into product
values('P0002','Laptop',70000,'IT','S0003')

insert into product
values('P0003','Sanitizer',40,'Hc','S0004')

insert into product
values('P0004','Fan',1500,'HA','S0001')

insert into product
values('P0005','Masks',20,'Hc','S0005')

insert into product
values('P0006','Mouse',400,'IT','S0002')

insert into product
values('P0007','Gloves',10,'Hc','S0005')

insert into product
values('P0008','TV',50000,'HA','S0001')

insert into product
values('P0009','Keyboard',800,'it','S0002')

insert into product
values('P0010','Mobile',55000,'It','S0003')

insert into product
values('P0011','Monitor',10000,'IT','S0003')
select * from product;


--Add data in orders
insert into orders
values('O0001','April 01,2022','C0001','P0001',4)

insert into orders
values('O0002','April 02,2022','C0006','P0005',2)

insert into orders
values('O0003','April 04,2022','C0004','P0008',6)

insert into orders
values('O0004','April 05,2022','C0003','P0009',3)

insert into orders
values('O0005','April 05,2022','C0002','P0007',7)

insert into orders
values('O0006','April 06,2022','C0005','P0011',1)

select * from orders;

--Add Data in stock
insert into stock
values ('P0001',100,20,10)

insert into stock
values ('P0002',50,10,5)

insert into stock
values ('P0003',90,12,6)

insert into stock
values ('P0004',40,20,10)

insert into stock
values ('P0005',25,2,20)

insert into stock
values ('P0006',30,10,15)

insert into stock
values ('P0007',38,8,16)

insert into stock
values ('P0008',22,4,18)

insert into stock
values ('P0009',110,15,22)

insert into stock
values ('P0010',70,15,25)

select * from stock;

--Display by using inner join -- product.P_Id,p_desc,category,s_name,s_city
select product.P_Id,p_desc,category,s_name,s_city
from product
inner join Supplier
on product.S_ID=Supplier.S_id

select orders.O_id,orders.O_Date,c_name,c_addr,C_Phone,P_desc,Price,O_qty