-- DISTINCT
-- DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

SELECT * FROM musteri_urun

-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz
select urun_isim from musteri_urun group by urun_isim; -- group by ile yaptık
select distinct urun_isim from musteri_urun; -- distinct ile çözdük

-- Tabloda kac farkli meyve vardir ?
select  count (distinct urun_isim ) as meyve_sayısı from musteri_urun group by urun_isim; -- tekrarlıları getirmedi.teke düşürüp sayı verdi
select urun_isim, count (urun_isim ) as meyve_sayısı from musteri_urun group by urun_isim;--hangi meyveden kaçar tane olduğunu gösterdi


-- FETCH NEXT (SAYI) ROW ONLY- OFFSET

-- 1) Tabloyu urun_id ye gore siralayiniz
-- 2) Sirali tablodan ilk 3 kaydi listeleyin
select * from musteri_urun order by urun_id fetch next(3) row only;
select * from musteri_urun order by urun_id limit 3;

--müşteri ürün tablosundan son kaydı listeleyiniz.
select * from musteri_urun order by urun_id desc limit 3;


-- 3) Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin


CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);
INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);

select * from maas

--en yüksek maas alan müşteriyi listeleyiniz.
select maas from maas order by maas desc limit 1;
select max(maas) from maas

--en yüksek 2. maas
select max(maas) from maas offset 1 limit 1;-- ---çalışmadı
select maas from maas order by maas desc offset 1 limit 1;
select * from maas order by maas desc offset 1 limit 1
select * from maas order by maas desc limit 1 offset 1
select * from maas order by maas desc offset 1 fetch next 1 row only


--maas tablosundan en  düşük 4. maası getiriniz.
select * from maas order by maas offset 3 limit 1;

---

/*
					ALTER TABLE STATEMENT
					
	ALTER TABLE statement tabloda add, Type(modify)/Set, Rename veya drop columns
	islemleri icin kullanilir.
	ALTER TABLE statement tablolari yeniden isimlendirmek icin de kullanilir.
 */
 
 
 CREATE TABLE personel44  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel44_pk PRIMARY KEY (id)
);


INSERT INTO personel44 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel44 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel44 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel44 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel44 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel44 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel44 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
 
 select * from personel44
 
--1) ADD default deger ile tabloya bir field ekleme
alter table personel44 add ulke varchar(30) 

alter table personel44 add adres varchar(50) default 'Turkiye';--DEFAULT olarak belirttiğimiz veriyi tüm satırlara girer

alter table personel44 add zipcode varchar(30) 



-----DROP=====>>>tablodan sutun silme
alter table personel44 drop column zipcode;
alter table personel44 drop adres;
alter table personel44 drop adres, drop ulke;--iki sutunu birden siler

---rename column------>>>>surtun adfı değiştirit
--sehir /il olsun

alter table personel44 rename column sehir to il;


---RENAME tablonun adını değiştirir
--personel44 ü işçiler yap
Alter table personel44 rename to işçiler;
 select * from personel44 -- bu tablonun adı değiştiği için bana veri getirmez.
 
  select * from işçiler;
  
 --TYPE/SET sutunların özelliklerini değiştirir. type data tipini değiştirir mesela.
 alter table işçiler alter column il type varchar(30), alter column maas set not null;

--Eğer numeric data tipine sahip bir sutunun data türüne string bir data türü atamak istersek;
 alter table işçiler alter column maas type varchar(30) using (maas::varchar(30))
 
 
 --TRANSACTION
 
 --transaction başlatmak için "begin" komutu kullanmamız gerekir. sonlandrımak için ise "commit" komutunu çalıştırmalıyız.
 CREATE TABLE ogrenciler222
(
id serial, --serial data türü otomatik olarak 1 den başlayarak sıralı olarak sayı ataması yapar.
			-- ınsert into ile tabloya veri eklerken serial data türünü kullandığım veri değeri yerine default yazarız.
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);

BEGIN;
INSERT INTO ogrenciler222 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler222 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler222 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler222 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler222 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler222 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;

 
 select * from ogrenciler222

 delete from ogrenciler222
 