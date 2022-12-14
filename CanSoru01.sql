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
select FirstName,LastName, (select sum(Value_$) as toplam_tutar  from payments 
 where employee.Employee_ID=payments.Employee_ID)
 from employee;
 
 --2.yol
 SELECT Employee.FirstName, Employee.LastName, SUM(Payments.Value) AS TotalEarnings
FROM Employee
INNER JOIN Payments ON Employee.EmployeeID = Payments.EmployeeID
GROUP BY Employee.FirstName, Employee.LastName

--3.yol
Select FirstName,LastName ,(Select SUM(Value_$) from payments 
Where Employee.Employee_ID=Payments.Employee_ID) 
as toplam_tutar 
from Employee


--cevap:2

SELECT* FROM employee WHERE FirstName LIKE 'J%';

DELETE FROM employee
DELETE FROM payments


-------------------------------------------------------------------------------------------------------------------
create table family_members
(
id int,
name varchar(15),
gender varchar(10),
species varchar(10),
num_book_read int	
);

INSERT INTO family_members VALUES (1,'Dave','male','human',200);
INSERT INTO family_members VALUES (2,'Mary','female','human',180);
INSERT INTO family_members VALUES (3,'Pickles','male','dog',0);


--1-Tüm verileri tek bir tabloda gösteren query yazın
select * from family_members

--2-name and species sütunlarını gösteren query yazın.

select name,species from family_members;

--3-dog a ait tüm satırları döndüren query yazın.
select * from family_members where species='dog';

--4- num_books_read değeri 190'dan büyük olan 
--aile üyelerine a ait tüm satırları döndüren query yazın.
select * from family_members where num_book_read>190;

------------------------


create table character1
(
_id int,
_name varchar(20)
);

INSERT INTO character1 VALUES (1,'Doogie Howser');
INSERT INTO character1 VALUES (2,'Barney Stinson');
INSERT INTO character1 VALUES (3,'Lily Aldrin');
INSERT INTO character1 VALUES (4,'Willow Rosenberg');


create table character1_tv_show
(
_id int,
character1_id int,
tv_show_name varchar(30)
);

INSERT INTO character1_tv_show VALUES (1,4,'Buffey the Vampire Slayer');
INSERT INTO character1_tv_show VALUES (2,3,'How I meet your mother');
INSERT INTO character1_tv_show VALUES (3,2,'How I meet your mother');
INSERT INTO character1_tv_show VALUES (4,1,'Doogie Howser,M.D');



create table character1_actor
(
_id int,
character_id int,
actor_name varchar(20)
);

INSERT INTO character1_actor VALUES (1,4,'Alyson Hannigan');
INSERT INTO character1_actor VALUES (2,3,'Alyson Hannigan');
INSERT INTO character1_actor VALUES (3,2,'Neil Patrick Harris');
INSERT INTO character1_actor VALUES (4,1,'Neil Patrick Harris');


--5- Her character adını onları oynayan actor eşleştirmek için inner join kullanarak query yazın.
select _name, actor_name from character1 
inner join character1_actor on character1_actor._id= character1._id;