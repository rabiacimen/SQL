--TRUNCATE--
--bir tablodaki tüm verileri geri alamayacağımız şekilde siler. Şartlı silme yapmaz(where kullanamayız).



--ON DELETE CASCADE

DROP TABLE if exists adresler -- Eğer tablo varsa tabloyu siler.

CREATE TABLE talebeler2
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar3(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar3_fk FOREIGN KEY (talebe_id) REFERENCES talebeler2(id)
on delete cascade--buraya dikkat!!!
);

INSERT INTO talebeler2 VALUES(113, 'Ali Can', 'Mustafa',75);
INSERT INTO talebeler2 VALUES(114, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler2 VALUES(115, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler2 VALUES(116, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler2 VALUES(117, 'Mustafa Bak', 'Can',99);


INSERT INTO notlar3 VALUES ('113','kimya',75);
INSERT INTO notlar3 VALUES ('114', 'fizik',65);
INSERT INTO notlar3 VALUES ('115', 'tarih',90);
INSERT INTO notlar3 VALUES ('116', 'Matematik',90);


select * from talebeler2;
select *from notlar3;

--Notlar tablosundan talebe_id'si 123 olan datayı silelim.
DELETE FROM notlar3 WHERE talebe_id='113';

--Talebeler tablosundan id'si 126 olan datayı silelim.
DELETE FROM talebeler2 	WHERE id='116';



-- IN CONDITION--
DROP TABLE if exists musteriler2-- bu tablo varsa sil dedik.

CREATE TABLE musteriler2 (
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO musteriler2 VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler2 VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler2 VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler2 VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler2 VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler2 VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler2 VALUES (40, 'John', 'Apricot'); 

							
SELECT * FROM musteriler2-- tabloyu listeledik,gördük

--Musteriler tablosundan urun ismi orange,apple VEYA apricot olan VERİLERİ listeleyiniz.
SELECT * FROM musteriler2 WHERE urun_isim='Orange' OR  urun_isim='Apple' OR urun_isim='Apricot';

SELECT * FROM musteriler2 WHERE urun_isim='Orange' and urun_id=10;

-- IN CONDITION
SELECT * FROM musteriler2 WHERE urun_isim IN ('Orange','Apple','Apricot');

--NOT IN--- yazdığımız verilerin dışındakileri getririr.
SELECT * FROM musteriler2 WHERE urun_isim NOT IN ('Orange','Apple','Apricot');


--BETWEEN CONDITION

--Musteriler tablosundan id'si 20 ile 40 arasında olan tüm verileri listeleyiniz.
SELECT * FROM musteriler2 WHERE urun_id>=20 and urun_id<=40;


--Musteriler tablosundan id'si 10 ile 30 arasında olan tüm verileri listeleyiniz.
SELECT * FROM musteriler2  WHERE urun_id BETWEEN 10 and 30;

SELECT * FROM musteriler2  WHERE urun_id  NOT BETWEEN 10 and 30;-- dışındakileri getririr.


--SUBQUERIES---------------------------------------------------


CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', null, 'Vakko');


CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nıke', 19000);


SELECT * FROM calisanlar2;
SELECT * FROM markalar;

--calisan sayısı 15000 den fazla olan markaların isimlerini
--ve bu markada calisanların isimlerini ve maaslarını listeleyin..

SELECT isim,maas,isyeri FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

--nıke çıkmadı tabloda yukarıdaki soruya sonradan ekledğimiz veri..çünkü işyeri sutununda yok.


-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz
SELECT isim,maas,sehir FROM calisanlar2
WHERE isyeri IN(SELECT marka_isim FROM markalar WHERE marka_id>101);

--ÖDEV- Ankara’da calisani olan markalarin marka id'lerini
--ve calisan sayilarini listeleyiniz.





-- 							AGGREGATE METOT KULLANIMI
/*Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde
kullanilabilir.
Ancak, Sorgu tek bir değer döndürüyor olmalidir.
SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı
*/

---------------------------AGGREGATE METHOD--------------
SELECT max(maas) FROM calisanlar2;
--burada tablodaki  maas sutununa gecici olarak  bir isim vermek için aşağıdaki yöntemi kullanırız:

SELECT max(maas) AS maksimum_maas FROM calisanlar2;


--en düşük maaşı listeleyelim
SELECT min(maas) FROM calisanlar2;
SELECT min(maas) AS en_dusuk_maas FROM calisanlar2;

--calisanlar tablosundaki mmasların toplamını listeleyin
SELECT sum(maas) FROM calisanlar2;

--maasların ortalamasını listeleyin.----AVG---
SELECT avg(maas) FROM calisanlar2;
--eğer virgüllü kısım olmasın istersek, yuvarlamak istersek;
SELECT round(avg(maas)) FROM calisanlar2;--2714.294758490340
--nooktadan sonra 2 sayı daha vermesini istersek;--2714
SELECT round(avg(maas),2) FROM calisanlar2;--2714.29



--calisanlar tablsoundaki maasların sayısını listeleyiniz.
SELECT count(maas) FROM calisanlar2;--maas yerine "*" da yazabiliriz. count satırları sayar.
--maas yazınca null olan satırı yazmadı. count 7 geldi. 
SELECT count(*) FROM calisanlar2;
--"* koyduğumuzda null olan satırı da saydı ve count 8 geldi."

SELECT * FROM calisanlar2;

--AGGREGATE METHOD
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu 
--listeleyen bir SORGU yaziniz
SELECT * FROM calisanlar2;
SELECT * FROM markalar;

SELECT marka_id,marka_isim,
(SELECT count(sehir) as sehir_sayisi FROM calisanlar2 WHERE marka_isim=isyeri)
FROM markalar;
--as sehir_sayisi yazdık sutunun adını değiştirdik.


-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
--toplam maaşini listeleyiniz
CREATE VIEW summaas
as
SELECT marka_isim, calisan_sayisi,
(SELECT sum (maas) FROM calisanlar2 WHERE isyeri=marka_isim) as toplam_maas
FROM markalar;

SELECT * FROM summaas;

-- Her markanin ismini, calisan sayisini ve o markaya ait 
--calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar

----------VIEW Kullanımı-------------
--yaptığımız sorguları hafızaya alır ve 
--tekrar bizden istenen sorgulama yerine view'e atatdığımız ismi
--select komutuyla çağırırız.
CREATE VIEW maxMinMaas
AS SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar

SELECT*FROM maxMinMaas;--method gibi kısa yol oluşturmuş oluyoruz.
---bir daha ihtiyac duyunca çağırıcaz.
SELECT *FROM summaas;

-- 							EXISTS CONDITION
/*
EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar
*/

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
SELECT * FROM mart;


CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
SELECT * FROM nisan;

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
 --URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
 --MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
 SELECT urun_id,musteri_isim FROM mart WHERE exists 
 (SELECT urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id)
 
 --Her iki ayda birden satılan ürünlerin 
 --URUN_ISIM'lerini ve bu ürünleri NİSAN ayında satın alan 
 --MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
 select urun_isim,musteri_isim from nisan where exists
 (select urun_isim from mart where mart.urun_isim=nisan.urun_isim)
 
 
-----NOT EXİSTS---
--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
-- NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

-----------------------ÖDEV------------------------




--DML--> UPDATE
CREATE TABLE tedarikciler5 -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler5 VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler5 VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler5 VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler5 VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler6 -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler6 FOREIGN KEY(ted_vergino) REFERENCES tedarikciler5(vergi_no)
on delete cascade
);    

INSERT INTO urunler6 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler6 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler6 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler6 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler6 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler6 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler6 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
select * from tedarikciler5
select * from urunler6

/*
UPDATE tablo_adi
SET sutun_ismi = 'istenen veri' WHERE sutun_ismi='istenen veri'
*/


--  vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak 
--güncelleyeniz.
UPDATE tedarikciler5 SET firma_ismi='Vestel' WHERE vergi_no=102;


-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve 
--irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler5 SET firma_ismi='Casper',irtibat_ismi='Ali Veli'
WHERE vergi_no=101;


-- urunler tablosundaki 
--'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler6
SET urun_isim='telefon' WHERE urun_isim='Phone';

-- urunler tablosundaki urun_id değeri 1004'ten 
--büyük olanların urun_id’sini 1 arttırın.
update urunler6
set urun_id=urun_id+1 where urun_id>1004;

-- urunler tablosundaki tüm ürünlerin urun_id değerini 
--ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
update urunler6
set urun_id=urun_id+ted_vergino;

/*
DELETE FROM tedarikciler5
--ardından INSERT ile tabloya yeniden ekle....
*/

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, 
--tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
/*
update urunler6
set urun_isim='APPLE' where musteri-isim='Ali Bak'
*/--- apple yazarsak olmaz onu tedarikciler tablsoundan alcaz.

update urunler6
set urun_isim=(SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi='Adam Eve')
where musteri_isim='Ali Bak'

-- Urunler tablosunda laptop satin alan musterilerin ismini, 
--firma_ismi Apple’in irtibat_isim'i ile degistirin.
update urunler6
set musteri_isim=(select irtibat_ismi from tedarikciler5 where firma_ismi='Apple' )
where urun_isim='Laptop'




