create  table employee
(
Employee_ID char(5) primary key,
FirstName varchar(15),
LastName varchar(15),
City varchar(15),
state_ varchar(10)
);

INSERT INTO employee VALUES ('10330' ,  'John'    ,  'John '   ,  'NY',               'NY');
INSERT INTO employee VALUES ('10449' ,  '"Sarah" '  , ' "Lebat " ' ,  '"Melbourne"',  '"Bourke"');
INSERT INTO employee VALUES ('11012' ,  '"Jon "  '  ,  '"Dallas"'  ,  '"NY"' ,            '" NY"');
INSERT INTO employee VALUES ('11013' ,  '"Gheorghe"',  '"Honey" '  ,  '"NY"',           ' " NY"');
INSERT INTO employee VALUES ('11014' , ' "Anton" '  ,  '" Savar"'  ,  '"NY"',           ' " NY"');

create table payments
(
Employee_ID char(5) , 
Salary_date varchar(10),
Month_ID char(2), 
Value_$ int

);

INSERT INTO payments VALUES ('10330',      ' June',        '6 ',              128);
INSERT INTO payments VALUES ('10330',      ' July',        '7' ,              158);
INSERT INTO payments VALUES ('10330',       'Agugust',       '8' ,              133);
INSERT INTO payments VALUES ('10330',         'September',   '9 ',              120);
INSERT INTO payments VALUES ('10330',         'October' ,    '10',              188);
INSERT INTO payments VALUES ('10330',         'November',    '11',              160);
INSERT INTO payments VALUES ('10330',          'December' ,  '12',              105);
INSERT INTO payments VALUES ('10449',         'September',   '9' ,              150);
INSERT INTO payments VALUES ('10449',         'October',     '10',              158);
INSERT INTO payments VALUES ('10449',         'November',    '11',              160);
INSERT INTO payments VALUES ('10449',         'December ',   '12',              180);

--1. Her çalışanın adı ve soyadına göre kazanılan toplam tutarı görüntülemek için SQL sorgularını yazın.
--2. Adları J harfi ile başlayan tüm çalışanları görüntüleyin.



select * from employee;
select * from payments;
--cevap:1
select FirstName,LastName, 
(select sum(Value_$)
 as toplam_tutar 
 from payments 
 where employee.Employee_ID=payments.Employee_ID)
 from employee;
--cevap:2

SELECT* FROM employee WHERE FirstName LIKE 'J%';

DELETE FROM employee
DELETE FROM payments