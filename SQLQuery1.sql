create database ecommerce01;
use cnstring
CREATE TABLE CATEGORY
(
CATID INT PRIMARY KEY,
CATEGORY VARCHAR(100)
)
drop table if exists ITEMS
CREATE TABLE ITEMS
(
ITEMCODE VARCHAR(100) primary key,
ITEMNAME VARCHAR(100),
CATID INT REFERENCES CATEGORY(CATID),
EXPIREDATE DATETIME,
ACTIVE BIT, 
PICTURE VARCHAR(200)
)
insert into category values(1,'Electronics'),(2,'Grossary'),(3,'Crokeries')
insert into items values('G-001','Rice Grade-1',2,'2024-01-01',1,'1.jpg')
select * from category
select * from items