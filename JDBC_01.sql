CREATE TABLE countries
(
    country_id CHAR(3),
    country_name VARCHAR(50),
    region_id SMALLINT
);
Insert into countries values ('AR','Argentina',2);
Insert into countries values ('AU','Australia',3);
Insert into countries values ('BE','Belgium',1);
Insert into countries values ('BR','Brazil',2);
Insert into countries values ('CA','Canada',2);
Insert into countries values ('CH','Switzerland',1);
Insert into countries values ('CN','China',3);
Insert into countries values ('DE','Germany',1);
Insert into countries values ('DK','Denmark',1);
Insert into countries values ('EG','Egypt',4);
Insert into countries values ('FR','France',1);
Insert into countries values ('IL','Israel',4);
Insert into countries values ('IN','India',3);
Insert into countries values ('IT','Italy',1);
Insert into countries values ('JP','Japan',3);
Insert into countries values ('KW','Kuwait',4);
Insert into countries values ('ML','Malaysia',3);
Insert into countries values ('MX','Mexico',2);
Insert into countries values ('NG','Nigeria',4);
Insert into countries values ('NL','Netherlands',1);
Insert into countries values ('SG','Singapore',3);
Insert into countries values ('UK','United Kingdom',1);
Insert into countries values ('US','United States of America',2);
Insert into countries values ('ZM','Zambia',4);
Insert into countries values ('ZW','Zimbabwe',4);

select * from countries;

-- //1. Örnek:  region id'si 1 olan "country name" değerlerini çağırın.
select country_name from countries where region_id=1;

-- ////2.Örnek: "region_id"nin 2'den büyük olduğu "country_id" ve "country_name" değerlerini çağırın.

select country_id,country_name from countries where region_id>2;
----------------------------------
 CREATE TABLE companies
(
 company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies;
--//3.Örnek: "number_of_employees" değeri en düşük olan satırın tüm değerlerini çağırın.
select * from companies order by number_of_employees limit 1;
SELECT * FROM companies WHERE number_of_employees = (SELECT MIN(number_of_employees) FROM companies) --2.yol

select number_of_employees from companies order by number_of_employees desc offset 1 limit 1 


--//1. Örnek: number_of_employees değeri ortalama çalışan sayısından az olan number_of_employees değerlerini 16000 olarak UPDATE edin.

update companies set number_of_employees=16000 where number_of_employees <  (select avg (number_of_employees) from companies)

--2.yol
UPDATE companies
SET number_of_employees = 16000
WHERE number_of_employees < (SELECT AVG(number_of_employees)
                             FROM companies)

--//1. Örnek: Prepared statement kullanarak company adı IBM olan number_of_employees değerini 9999 olarak güncelleyin.

select * from companies

update companies set number_of_employees=9999 where company='IBM'

--//2. Örnek: Prepared statement kullanarak company adı GOOGLE olan number_of_employees değerini 5555 olarak güncelleyin.

------------------------------------------------------------


CREATE  OR REPLACE  FUNCTION toplamaF(x NUMERIC,y NUMERIC)
RETURNS NUMERIC 
LANGUAGE plpgsql
AS
$$
BEGIN


RETURN x+y;


END

$$

SELECT * FROM toplamaF(4,6);



-------------------

--Bazı işlerimleri hızlı yapmak için fonksiyonlar kullanıyoruz.(Ortalama alma)
--Function (Fonksiyon) nasıl yazılır? 
--CRUD operation için function oluşturulabilir.
--bir data vermiyorsa javada void deriz sql de ise procedure deriz.
--SQL de her function return type olarak bir data verir.
--Return type olarak data vermeyen işlemlere "procedure" deriz.

CREATE OR REPLACE FUNCTION addf (x NUMERIC,y NUMERIC) -- OR REPLACE yazarsak o functıon daha önceden varsa problem olmaz. üzerine yazar.
RETURNS NUMERIC 
LANGUAGE plpgsql
AS
$$

BEGIN

RETURN x+y;

END

$$
 
SELECT * FROM addf (2,3) AS "Addition";


--Koninin hacmini hesaplayan bir function yazın.
--3.14*r*r*h/3
CREATE OR REPLACE FUNCTION konininHacmi(r NUMERIC,h NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$

BEGIN

RETURN (3.14*r*r*h/3);

END

$$


SELECT * FROM konininHacmi(3,6);



---------------------
CREATE TABLE countries
(
    country_id CHAR(3),
    country_name VARCHAR(50),
    region_id SMALLINT
);


Insert into countries values ('AR','Argentina',2);
Insert into countries values ('AU','Australia',3);
Insert into countries values ('BE','Belgium',1);
Insert into countries values ('BR','Brazil',2);
Insert into countries values ('CA','Canada',2);
Insert into countries values ('CH','Switzerland',1);
Insert into countries values ('CN','China',3);
Insert into countries values ('DE','Germany',1);
Insert into countries values ('DK','Denmark',1);
Insert into countries values ('EG','Egypt',4);
Insert into countries values ('FR','France',1);
Insert into countries values ('IL','Israel',4);
Insert into countries values ('IN','India',3);
Insert into countries values ('IT','Italy',1);
Insert into countries values ('JP','Japan',3);
Insert into countries values ('KW','Kuwait',4);
Insert into countries values ('ML','Malaysia',3);
Insert into countries values ('MX','Mexico',2);
Insert into countries values ('NG','Nigeria',4);
Insert into countries values ('NL','Netherlands',1);
Insert into countries values ('SG','Singapore',3);
Insert into countries values ('UK','United Kingdom',1);
Insert into countries values ('US','United States of America',2);
Insert into countries values ('ZM','Zambia',4);
Insert into countries values ('ZW','Zimbabwe',4);




