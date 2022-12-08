--Practice 1: ***********************
--“tedarikciler” isminde bir tablo olusturun
--ve “tedarikci_id”, “tedarikci_ismi”, “tedarikci_adres” ve “ulasim_tarihi” field’lari olsun.
create table TEDARIKCILERyeni
(
yeni_tedarikci_id char(5) primary key,
yeni_tedarikci_ismi varchar(15),
yeni_tedarikci_adres varchar(50),
ulasim_tarihi varchar (20)	
);

select * from TEDARIKCILERyeni;--tablonun boş hali(field'lar)görüldü.

INSERT INTO TEDARIKCILERyeni VALUES ('12345', 'Rabia Cimen', 'Atatürk mahallesi 202/53. sokak','12.12.2022');
INSERT INTO TEDARIKCILERyeni VALUES ('12345', 'Rabia Cimen', 'Atatürk mahallesi 202/53. sokak','12.12.2022');
INSERT INTO TEDARIKCILERyeni VALUES ('22345', 'Elif Cimen', 'Osmangazi mahallesi 287/53. sokak','11.12.2022');
INSERT INTO TEDARIKCILERyeni VALUES ('32345', 'Hayri Cimen', 'Manavkuyu mahallesi 278/53. sokak','12.3.2023');
INSERT INTO TEDARIKCILERyeni VALUES ('42345', 'Feyyaz Cimen', 'Kuyualan mahallesi 12345/53. sokak','22.05.2022');
INSERT INTO TEDARIKCILERyeni VALUES ('52345', 'Muaz Cimen', 'Ergenekon mahallesi 78990/53. sokak','22.10.2022');



--“tedarikçi_ziyaret” isminde bir tabloyu “tedarikciler” tablosundan olusturun.********************
--Icinde “tedarikci_ismi”, “ulasim_tarihi” field’lari olsun
CREATE TABLE tedarikçi_ziyaret
AS SELECT yeni_tedarikci_ismi ulasim_tarihi 
FROM TEDARIKCILERyeni;

select*from tedarikçi_ziyaret--tablonun field'ları oluşturuldu.
 *********************** *********************** *********************** *********************** ***********************
--Practice 2: ***********************
/*
“ ogretmenler” isminde tablo olusturun. Icinde “kimlik_no”, “isim”, “brans” ve “cinsiyet”
field’lari olsun.
“ogretmenler” tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
Kimlik_no: 234431223, isim: Ayse Guler, brans : Matematik, cinsiyet: kadin.
Ekleme :
“ogretmenler” tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
Kimlik_no: 567597624, isim: Ali Veli
*/

create table ogretmenler_yeni
(
kimlik_no char(11) PRIMARY KEY,	
isim varchar(15),
brans varchar(15),	
cinsiyet varchar(10)	
);

INSERT INTO ogretmenler_yeni VALUES ('12345678912','Ayse Guler','matematik','kadin');
INSERT INTO ogretmenler_yeni VALUES ('56759762491','Ali Veli');
select * from  ogretmenler_yeni

 *********************** *********************** *********************** *********************** ***********************
--Practice 3: ***********************
/*
“sehirler” isimli bir Table olusturun. 
Tabloda “alan_kodu”, “isim”, “nufus” 
field’lari olsun. Isim field’i bos
birakilamasin.
1.Yontemi kullanarak “alan_kodu”
field’ini “Primary Key” yapin
*/
create table sehirler
(
alan_kodu char(6) Primary Key,
isim varchar(15) NOT NULL,
nufus int
);
*********************** *********************** *********************** *********************** ***********************
--Practice 4: ***********************
/*
“tedarikciler1” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, 
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler1” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

create table tedarikciler1 
(
tedarikci_id char(5)primary key,
tedarikci_ismi varchar(15),
iletisim_isim varchar(15)
);
select * from tedarikciler1
create table urunler1 
(
tedarikci_id char(5),
urun_id char(3),
CONSTRAINT urunler1_fk FOREIGN KEY(tedarikci_id) REFERENCES tedarikciler1 (tedarikci_id)
);
select * from urunler1

*********************** *********************** *********************** *********************** ***********************
--Practice 5: ***********************
/*
“calisanlar3” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”
, 
“ise_baslama” field’lari 
olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler3” isminde baska bir tablo olusturun.Icinde “adres_id”
,
“sokak”
, 
“cadde” ve “sehir”
fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun
*/
create table calisanlar3
(
id char(8) primary key,
isim varchar(15) unique,
maas int not null,
ise_baslama date
);

select * from calisanlar3


create table adres3
(
adres_id char(8),
sokak varchar(5),
cadde varchar(10),
sehir varchar(10),
CONSTRAINT foreıgnkey_fk FOREIGN KEY (adres_id) REFERENCES calisanlar3(id)
);
select * from adres3

INSERT INTO calisanlar3 VALUES('10002222', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar3 VALUES('10008888', null, 5000, '2018-04-14');
--INSERT INTO calisanlar3 VALUES('10010000', 'Mehmet Yılmaz', 5000, '2018-04-14'); aynı isimden 2 tane kabul etmez.
INSERT INTO calisanlar3 VALUES('10004444', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar3 VALUES('10005555', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar3 VALUES('10006666', 'Canan Yaş', NULL, '2019-04-12'); maas null olamaz
INSERT INTO calisanlar3 VALUES('10003333', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar3 VALUES('10007777', 'CAN', 5000, '2018-04-14'); isim unique olmalı
--INSERT INTO calisanlar3 VALUES('10009999', 'cem', '', '2018-04-14'); maas girilmeden çalışmaz
--INSERT INTO calisanlar3 VALUES('', 'osman', 2000, '2018-04-14');		pk boş olamaz
--INSERT INTO calisanlar3 VALUES('', 'osman can', 2000, '2018-04-14');	 pk boş olamaz
--INSERT INTO calisanlar3 VALUES( '10002222', 'ayse Yılmaz' ,12000, '2018-04-14'); id unique olmalı
--INSERT INTO calisanlar3 VALUES( null, 'filiz ' ,12000, '2018-04-14'); pk null olamaz

INSERT INTO adres3 VALUES('10003333','Mutlu', '40.Cad.','IST');
INSERT INTO adres3 VALUES('10003333','Can', '50.Cad.','Ankara');
INSERT INTO adres3 VALUES('10002222','Ağa', '30.Cad.','Antep');
--10002222 numaralı id 'ye ait iki adres var----------------!!!!!!!!
select * from calisanlar3
select * from adres3

*********************** *********************** *********************** *********************** ***********************
--Practice 7: ***********************



CREATE TABLE ogrenciler66
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int 
);

INSERT INTO ogrenciler66 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler66 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler66 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler66 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler66 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler66 VALUES(127, 'Mustafa Bak',  'Ali', 99);

select * from ogrenciler66


--idsi124 olan öğrenciyi silniz
delete from ogrenciler66 where id=124

-- İsmi Ali Can ve id'si 123 olan kaydı siliniz.
delete from ogrenciler66 where isim='Ali Can' and id=123

-- id 'si 126'dan büyük olan kayıtları silelim.
delete from ogrenciler66 where id>126

-- id'si 123, 125 veya 126 olanları silelim.

delete from ogrenciler66 where id=125 or id=126
--********************************************************************

CREATE TABLE talebeler4
(
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar4( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar4_fk FOREIGN KEY (talebe_id) 
REFERENCES talebeler4(id)
on delete cascade
);
INSERT INTO talebeler4 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler4 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler4 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler4 VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler4 VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar4 VALUES ('123','kimya',75);
INSERT INTO notlar4 VALUES ('124', 'fizik',65);
INSERT INTO notlar4 VALUES ('125', 'tarih',90);
INSERT INTO notlar4 VALUES ('126', 'Matematik',90);

select * from talebeler4
select * from notlar4

delete from talebeler4-- verileri siler
drop table talebeler4 cascade ---talebeler tablosunu verileriyle birlikte siler

--******************************************************************

CREATE TABLE musteriler3 
(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler3 VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler3 VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler3 VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler3 VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler3 VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler3 VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler3 VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler3 VALUES (20, 'Eddie', 'Apple');

select * from musteriler3
select * from musteriler3 where urun_isim IN('Orange','Apple','Appricot')

--1) Urun_id 20 ile 40 arasinda olan urunlerin tum bilgilerini listeleyiniz
select * from musteriler3 where urun_id between 20 and 40
select * from musteriler3 where urun_id>=20 and urun_id<=40

--2) Urun_id 20 ile 40 arasinda olmayan urunlerin tum bilgilerini listeleyiniz
select * from musteriler3 where urun_id not between 20 and 40
select * from musteriler3 where urun_id<20 or urun_id>40

*********************** *********************** *********************** *********************** ***********************
--Practice 6: ***********************

CREATE table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

select * from personel


--id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
select * from personel where id between  '1003' and '1005'
select * from personel where id>='1003 'and id<='1005'


-- D ile Y arasındaki personel bilgilerini listeleyiniz
select * from personel where isim between 'D%' and 'Y%'  ----------------------------!!!!!--------------------
select * from personel where isim  >'D%' and isim<'Y%'
select * from personel WHERE isim  ~ '^[D-Y](.*)';

-- D ile Y arasında olmayan personel bilgilerini listeleyiniz     
select * from personel where isim<'D%' or isim>'Y%'

-- Maaşı 70000 ve ismi Sena olan personeli listeleyiniz
select * from personel where isim ='Sena Beyaz'or maas=7000 ;      ----------------------------sor--------------------



--******************************************************************
CREATE TABLE calisanlar22 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar22 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar22 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar22 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar22 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar22 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar22 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar22 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar22
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar22 VALUES(100, 'Vakko', 12000);
INSERT INTO markalar22 VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar22 VALUES(102, 'Adidas', 10000);
INSERT INTO markalar22 VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar22
select * from markalar22

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve 
--maaşlarini listeleyin
SELECT isim, maas, isyeri from calisanlar22
where isyeri in (select marka_isim from markalar22 where calisan_sayisi>15000);


-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz
select isim,maas,sehir  from calisanlar22 where isyeri in( select marka_isim from markalar where marka_id>101); ------???????????????????


-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select marka_id, calisan_sayisi from markalar22  where isyeri in (select sehir='Ankara' from calisanlar22); ---hata


-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
SELECT marka_id, marka_isim, 
(SELECT count(sehir) FROM calisanlar where marka_isim=isyeri) as sehir_sayisi
FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_isim, calisan_sayisi, 
(SELECT sum(maas) FROM calisanlar WHERE marka_isim = isyeri) as toplam_maas FROM markalar;


-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen 
bir Sorgu yaziniz.
SELECT marka_isim, calisan_sayisi, (SELECT max(maas) FROM calisanlar WHERE marka_isim = isyeri) as max_maas,
(SELECT min(maas) FROM calisanlar WHERE marka_isim = isyeri) as min_maas
FROM markalar

-----EXISTS
CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
select urun_id,musteri_isim from mart where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id );


--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim, musteri_isim from nisan where exists (select urun_isim from mart where mart.urun_isim=nisan.urun_isim);

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan where not exists(select urun_isim from mart where mart.urun_isim=nisan.urun_isim);

---UPDATE SET

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) 
REFERENCES tedarikciler(vergi_no)
on delete cascade
);

INSERT INTO urunler VALUES(101, 1001, 'Laptop', 'Ayşe Can'); ---eklenmedi
INSERT INTO urunler VALUES(102, 1002, 'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from urunler;
select * from tedarikciler;
-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz

---- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

---- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz

---- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın

-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz

--* urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi 
--'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz

--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin


*********************** *********************** *********************** *********************** ***********************
--Practice 8: ***********************
CREATE TABLE calisanlar44 
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) );

INSERT INTO calisanlar44 VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO calisanlar44 VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO calisanlar44 VALUES(345678901, 'Mine Bulut', 'Izmir');

select calisan_id as ID, calisan_isim as ISIM, calisan_dogdugu_sehir as DOGUM_YERİ from calisanlar44

create table personelim
(
ID char(9),
	ISIM varchar(20),
	SOYISIM varchar(20),
	e_mail varchar(30),
	ise_baslama_tarihi date,
	ıs_unvanı varchar(20),
	maas int
);

INSERT INTO personelim VALUES (123456789, 'Ali','Can','alican@gmail.com','10-APR-10','isci',5000);
INSERT INTO personelim VALUES (123456788, 'Veli','Cem','velicen@gmail.com','10-JAN-12','isci',5500);
INSERT INTO personelim VALUES (123456787, 'Ayse','Gül','aysegul@gmail.com','01-MAY-14','muhasebeci',4500);
INSERT INTO personelim VALUES (123456789, 'Fatma','Yasa','fatmayasa@gmail.com','10-APR-09','muhendis',7500);

--tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin
select * from personelim where maas<5000 or ıs_unvanı='isci'

-- Iscilerin tum bilgilerini listeleyin
select * from personelim where ıs_unvanı='isci'

--Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
select ıs_unvanı,maas from personelim where SOYISIM IN('Can','Cem','Gül')

--Maasi 5000’den cok olanlarin emailve is baslama tarihlerini listeleyin
select e_mail,ise_baslama_tarihi from personelim where maas>5000

--Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerini listeleyin,
select * from personelim where maas>5000 or maas>7000


---IS NULL
CREATE TABLE insanlar3
(
ssn char(9),
isim varchar(50), 
adres varchar(50)
);

INSERT INTO insanlar3 VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO insanlar3 VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO insanlar3 VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar3 (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar3(ssn, adres) VALUES(567890123, 'Denizli');

SELECT *FROM insanlar3 WHERE isim IS NULL;
SELECT *FROM insanlar3 WHERE isim IS Not NULL;
UPDATE insanlar3 SET isim = 'Isim Girilmemis' WHERE isim IS NULL;


-----ORDER BY CLAUSE
CREATE TABLE insanlar4
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
);

INSERT INTO insanlar4 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar4 VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO insanlar4 VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insanlar4 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar4 VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insanlar4 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insanlar4 ORDER BY isim ASC,soyisim DESC;

--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
select * from insanlar4 where soyisim='Bulut' order by 2;

--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select isim,soyisim from insanlar4 order by length(soyisim);

--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select concat(isim,' ',soyisim)  as isim_soyisim from insanlar4 order by length(isim)+length(soyisim);




-----GROUP BY CLAUSE

CREATE TABLE manav1
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
);

INSERT INTO manav1 VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav1 VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav1 VALUES( 'Veli', 'Elma', 2); 
INSERT INTO manav1 VALUES( 'Hasan', 'Uzum', 4); 
INSERT INTO manav1 VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav1 VALUES( 'Ayse', 'Elma', 3); 
INSERT INTO manav1 VALUES( 'Veli', 'Uzum', 5); 
INSERT INTO manav1 VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav1 VALUES( 'Veli', 'Elma', 3); 
INSERT INTO manav1 VALUES( 'Ayse', 'Uzum', 2);

-- Isme gore alinan toplam urunleri bulun

--
--
--
--
--
--



-----HAVING CLAUSE

--
--
--
--
--
--


-------UNION
--
--
--
--
--
CREATE TABLE personel14
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
	CONSTRAINT personel14_pk PRIMARY KEY(id)
);

INSERT INTO personel14 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel14 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel14 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel14 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel14 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel14 VALUES(456789014, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel14 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

	
CREATE TABLE personel_bilgi14  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi14_fk FOREIGN KEY (id) REFERENCES personel14(id)
);
INSERT INTO personel_bilgi14 VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi14 VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi14 VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi14 VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi14 VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi14 VALUES(456789014, '5524578574', 2);
INSERT INTO personel_bilgi14 VALUES(123456710, '5537488585', 1);


select * from personel14

select * from personel_bilgi14


--id’si 12345678 olan personelin Personel tablosundan sehir ve maasini, personel_bilgi 
--tablosundan da tel ve cocuk sayisini yazdirin
select sehir as sehir_veya_tel,maas  as cocuk_sayisi_veya_maas from personel14 where id='123456789'
union
select tel,cocuk_sayisi from personel_bilgi14  where id='123456789'

--1) Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz

select isim, maas from personel14 where maas<5000


select isim,maas from personel14 where maas<5000
union
select isim,maas from personel14 where maas<5000

--2) Ayni sorguyu UNION ile iki kere yazarak calistirin
select sehir,maas from personel14 where maas<5000
union
select sehir,maas from personel14 where maas<5000


-- Ayni sorguyu UNION ALL ile iki kere yazarak calistirin
SELECT sehir,maas FROM personel WHERE maas<5000;
UNION ALL
SELECT sehir,maas FROM personel WHERE maas<5000;


--1) Tabloda personel maasi 4000’den cok olan tum sehirleri ve maaslari yazdirin
select sehir,maas from personel14 where maas>4000

--2) Tabloda personel maasi 5000’den az olan tum isimleri ve maaslari yazdirin
select isim,maas from personel14 where maas<5000

--3) Iki sorguyu UNION ve UNION ALL ile birlestirin
select sehir as sehir_isim,maas  from personel14 where maas>4000
union 
select isim,maas from personel14 where maas<5000



-------------INTERSECT

--1) Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
select id from personel14 where sehir in ('Istanbul','Ankara')

--2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel_bilgi14 where cocuk_sayisi in(2,3)

--3) Iki sorguyu INTERSECT ile birlestirin
select id from personel14 where sehir in ('Istanbul','Ankara')
intersect
select id from personel_bilgi14 where cocuk_sayisi in(2,3)

--1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
select id from personel14 where maas not between 4800 and 5000
intersect
select id from personel_bilgi14 where cocuk_sayisi in (2,3) ----2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin


--3) Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
select isim from personel14 where sirket='Honda'
intersect
select isim from personel14 where sirket='Ford'
intersect
select isim from personel14 where sirket='Tofas'


----------EXCEPT

--1) 5000’den az maas alip Honda’da calismayanlari yazdirin
select isim from personel14 where maas<5000
except
select isim from personel14 where sirket='Honda'

--2) Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve sehirlerini listeleyin
select isim,sehir from personel14 where isim='Mehmet Ozturk'
except
select isim,sehir from personel14 where sehir='Istanbul'



--------JOINS

CREATE TABLE sirketler12 
(
sirket_id int, 
sirket_isim varchar(20)
);

INSERT INTO sirketler12 VALUES(100, 'Toyota'); 
INSERT INTO sirketler12 VALUES(101, 'Honda'); 
INSERT INTO sirketler12 VALUES(102, 'Ford'); 
INSERT INTO sirketler12 VALUES(103, 'Hyundai');

CREATE TABLE siparisler12 
(
siparis_id int, 
sirket_id int, 
siparis_tarihi date
);

INSERT INTO siparisler12 VALUES(11, 101,'17-Apr-2020');
INSERT INTO siparisler12 VALUES(22, 102,'18-Apr-2020');
INSERT INTO siparisler12 VALUES(33, 103,'19-Apr-2020');
INSERT INTO siparisler12 VALUES(44, 104,'20-Apr-2020');
INSERT INTO siparisler12 VALUES(55, 105,'21-Apr-2020');

--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun
select sirketler12.sirket_isim,siparisler12.siparis_id,siparisler12.siparis_tarihi 
from sirketler12 inner join siparisler12 on sirketler12.sirket_id=siparisler12.sirket_id

select * from sirketler12
select *  from siparisler12

select sirketler12.sirket_isim,siparisler12.siparis_id,siparisler12.siparis_tarihi 
from sirketler12 left join siparisler12 on sirketler12.sirket_id=siparisler12.sirket_id


select sirketler12.sirket_isim,siparisler12.siparis_id,siparisler12.siparis_tarihi 
from sirketler12 right join siparisler12 on sirketler12.sirket_id=siparisler12.sirket_id

select sirketler12.sirket_isim,siparisler12.siparis_id,siparisler12.siparis_tarihi 
from sirketler12 full join siparisler12 on sirketler12.sirket_id=siparisler12.sirket_id


-------SELF JOIN
CREATE TABLE personel22 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);


INSERT INTO personel22 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel22 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel22 VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel22 VALUES(4, 'Fatma Can', 'CEO', 5);


--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
select p1.isim as personel_isim,p2.isim as yönetici_isim from personel22 p1 inner join personel22 p2 on p1.yonetici_id =p2.id








