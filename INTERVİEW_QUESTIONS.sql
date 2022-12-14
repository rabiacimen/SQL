---INTERVIEW QUESTION
CREATE TABLE personel33 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20) );


INSERT INTO personel33 VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel33 VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel33 VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel33 VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO personel33 VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT'); 
INSERT INTO personel33 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel33 VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');

CREATE TABLE isciler33
(
id int, 
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO isciler33 VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler33 VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler33 VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler33 VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO isciler33 VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO isciler33 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler33 VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

--1)Her iki tablodaki ortak id’leri ve personel tablosunda bu id’ye sahip isimleri listeleyen query yaziniz
select  distinct personel33.id, personel33.isim   from personel33 inner join isciler33 on isciler33.id=personel33.id; --==> benim çözüm

SELECT isim,id
FROM personel33
WHERE id IN (SELECT id
FROM isciler33
WHERE isciler33.id=personel33.id);

--2) Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz
select distinct personel33.id, personel33.isim from personel33 
inner join isciler33 on isciler33.id=personel33.id and isciler33.isim=personel33.isim;---===>benim çözüm


SELECT isim,id FROM personel33
INTERSECT
SELECT isim,id FROM isciler33

--3) Personel tablosunda kac farkli sehirden personel var?
select  count(distinct sehir) as sehir_sayisi from personel33; --'6'

--4) Personel tablosunda id’si cift sayi olan personel’in tum bilgilerini listeleyen Query yaziniz



SELECT *  --=================!!!!!!!!!!!!
FROM personel33 
WHERE MOD (id,2)=0;

--5) Personel tablosunda kac tane kayit oldugunu gosteren query yazin
select count(isim) as kayit_sayisi from personel33;--==>benim çözüm
SELECT COUNT(*) FROM personel;

--6) Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
select * from isciler33 order by maas desc limit 1;--====>benim çözüm
select * from isciler33 where maas in(select max(maas) from isciler33);----===================!!!!!!!!!!!!!!!!!!

--7) Personel tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren query yazin
select * from personel33 where maas in(select min(maas) from personel33);
select * from personel33 order by maas limit 1;--2.yol
SELECT *FROM personel33 ORDER BY maas FETCH NEXT 1 ROW ONLY;--3.yol

--8) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
select maas from isciler33 order by maas desc  offset 1 limit 1; --3000
SELECT MAX(maas) FROM isciler33 WHERE maas<>(SELECT MAX(maas) FROM isciler33);----=====>>>>?????????????? <> ??

--9) Isciler tablosunda ikinci en dusuk maasi alan iscinin tum bilgilerini gosteren query yazin
select * from isciler33 order by maas offset 1 limit 1;
SELECT * FROM isciler33 ORDER BY maas OFFSET 1 ROW FETCH NEXT 1 ROW ONLY;

--extra
select min(maas) from isciler33 where maas<>(select min(maas) from isciler33);--2.en düşük maaşı getirdi.1500  <> ?????

--10) Isciler tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, tum bilgilerini gosteren query yazin
select * from isciler33
except
select * from isciler33 where maas in (select max(maas)from isciler33);  --==> benim çözüm

--2.yol
select * from isciler33 where maas <>(select max(maas) from isciler33) order by maas desc;  --- <> dışındaki anlamında...



