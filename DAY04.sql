--ALIASES

-- eğer calisanlar ismiyle tablo oluşturmak istersek, daha önce olduğu için silmemiz lazım.
--drop table if exists calisanlar

CREATE TABLE calisanlar4 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar4 VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO calisanlar4 VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO calisanlar4 VALUES(345678901, 'Mine Bulut', 'Izmir');
select * from calisanlar4;
select calisan_id as id, calisan_isim || calisan_dogdugu_sehir as calisan_bilgisi from calisanlar4
--Eğer iki sutunun verilerini birleştirmek istersek CONCAT sembolü (   ||    ) kullanırız.
--2.yol:
select calisan_id as id,  CONCAT (calisan_isim,calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar4


--İSİM İLE ŞEHİR ARASINA BOŞLUK KOYMAK İSTERSEK;
select calisan_id as id, calisan_isim || ' ' || calisan_dogdugu_sehir as calisan_bilgisi from calisanlar4

select calisan_id as id,  CONCAT (calisan_isim, ' ',calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar4


--IS NULL CONDITION
--veriler arasında null değer varsa ve bunları çağırmak istiyorsam kullanırız.

CREATE TABLE insanlar1
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar1 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar1 (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar1 (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar1

--name sutununda null olanlar değerleri listele.
select name from insanlar1 where name is null

--insanlar1 tablosunda sadece null olmayan değerleri listeleyiniz.
select name from insanlar1 where name is not null

--insanlar tablsounda null değer almış verileri no name olarak değiştiriniz.
update insanlar1
set name='no name' where name is null



--ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/


CREATE TABLE insanlar2
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar2 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar2 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar2 VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar2 (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar2 (ssn, adres) VALUES(567890123, 'Denizli');

--insanlar tablosundaki dataları adrese göre sıralayın.
select * from insanlar2

select * from insanlar2 order by adres

select * from insanlar2 order by name

--insanlar tablsoundaki ismi mine olanları ssn sıralı olarak listeleyin. 
--(bazı verileri yukarıdaki tabloda update etmiştik o nedenle bazı veriler uok.)

select * from insanlar2  where name='Mine Bulut' order by ssn


--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki ismi Mine Bulut olanlari isim sirali olarak listeleyin
 select * from insanlar2 where name='Mine Bulut' order by 2


--ASC natural order a göre sıralar. asc yazmak zorunda değiliz.


 --DESC kullanımı büyükten küçüğe doğru sıralar

--Insanlar2 tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

select * from insanlar2 order by ssn desc;

-- Insanlar2 tablosundaki tum kayitlari isimleri ters sirali olarak listeleyin
select * from insanlar2 order by name desc;

--select * from insanlar2 order by isim ASC, soyisim DESC
--ismi natural ordera göre soy ismi tersten sırslar. ben de sutunlar silinmiş olduğu için bu örneği yapmadım




--LENGTH kelime uzunluğuna göre sıralama yapar.

-- name değerini kelimenin uzunluklarına göre sıralayınız
select name from insanlar2 order by length(name);
select name from insanlar2 order by length(name) DESC; -- uzunluğa göre tersten sıralar

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak, her bir sütun değerini uzunluğuna göre sıralayınız.
--bunu concat ile de yapabiliriz || sembolleriylede. biz zaten öncesinde isim ve soyismi name sutununda birleştirmiştik.
SELECT isim || ' '|| soyisim AS isim_soyisim FROM insanlar2 order by length(isim||soyisim) --kodu çalıştırmadım.
SELECT isim|| ' '|| soyisim AS isim_soyisim FROM insanlar2 order by length(isim ) + length (soyisim) --2.yol 
SELECT isim || ' '|| soyisim AS isim_soyisim FROM insanlar2 order by length(isim_soyisim) -- bu şekilde olmaz. geçici isimdir
SELECT CONCAT (isim,' ',soyisim) AS isim_soyisim FROM insanlar2 order by length(isim ) + length (soyisim) --CONCAT İLE
select CONCAT isim || ' ' || soyisim as isim_soyisim from insanlar order by length (concat(isim, soyisim));


-- 									GROUP BY CLAUSE
-- Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
-- komutuyla birlikte kullanılır
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

--isme göre alınan toplam ürünleri bulunuz.
--select sum(Urun_miktar) from manav -- tek bir sonuc getririr //31

--bana ise isim isim kaç ürün aldıkları gerekiyor. isim sutunu ve toplam aldıkları miktar
--select isim, sum(urun_miktar) from manav -- hata verir.
select isim, sum(urun_miktar) as aldığı_toplam_urun from manav GROUP BY isim;

--isme göre alınan toplam ürünleri bulun ve ürünleri büyükten küçüğe listeleyiniz.
select isim, sum(urun_miktar) as aldığı_toplam_urun from manav GROUP BY isim;
ORDER BY aldığı_toplam_urun DESC


--urun ismine göre ürünü alan toplam kişi sayisi
select urun_adi, count(isim) from manav group by urun_adi;//elma 4 defa satın alındı. uzum 3 defa, armut 3 defa..

--soru ...aynı kişi 3 defa uzum aldıysa bunu1 mi sayıcak 3 mü sayıcak
select isim, count(urun_adi) as aldığı_urun_miktari from manav group by isim;

