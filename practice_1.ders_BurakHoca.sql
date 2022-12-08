create table ogrenciler1
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);
--- INSERT:Veritabanına yeni veri ekler.
insert into ogrenciler1 values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler1 values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler1 values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler1 values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler1 values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler1 values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler1 values(126, 'Harun Reşit', 'Isparta', 100);
select * from ogrenciler1;


select * from ogrenciler1;
--SORU: ogrenciler1 tablosundaki 
--id ve isim sutununu getiriniz.
select id, isim from ogrenciler1;

--SORU: Sınav notu 80'den büyük olan 
--öğrencilerin tüm bilgilerini listele
select * from ogrenciler1 where(sinav_notu>80);

--SORU: Adresi Ankara olan ögrencilerin 
--tüm bilgilerini listele
select * from ogrenciler1 where(adres='Ankara');

--SORU: Sınav notu 85 ve adresi 
--Ankara olan öğrenci ismini listele
select isim from ogrenciler1 where (sinav_notu=85 and adres='Ankara');

--SORU: .Sınav notu 65 veya 85 olan 
--ogrencilerin tüm bilgilerini listele
select * from ogrenciler1 where(sinav_notu=65 or sinav_notu=85);
--2. yol
select * from ogrenciler1 where sinav_notu in (65,85);

--SORU: .Sınav notu 65 ve 85 arasında olan ogrencilerin 
--tüm bilgilerini listele
select * from ogrenciler1 where sinav_notu between 65 and 85;

--SORU: .id'si 122 ve 125 arasında olmayan ögrencilerin 
--isim ve sınav notu listele
select isim, sinav_notu from ogrenciler1 where id not between 122 and 125;

--SORU: sinav_notu 75 olan satırı siliniz.(tablonun içinden veri silcez)
delete from ogrenciler1 where sinav_notu=75;

--SORU: adres'i Trabzon olan satırı siliniz
delete from ogrenciler1 where adres='Trabzon';

--SORU: ismi Derya Soylu veya Yavuz Bal olan satırları siliniz
delete from ogrenciler1 where isim='Derya Soylu' or isim='Yavuz Bal';
--2.yol 
delete  from ogrenciler1 where isim in('Derya Soylu','Yavuz Bal');

--SORU: sınav notu 100 den küçük olan satırları siliniz
delete from ogrenciler1 where sinav_notu<100;

--SORU: Tablodaki tüm satırları siliniz
delete from ogrenciler1;

/*
SORU: memurlar isminde bir tablo oluşturunuz. 
id, isim, maas sutunları olsun.
id sutununun data tipi int olsun. PRİMARY KRY kısıtlaması olsun.
isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data tipi int olsun. maas 5000 buyuk olsun. 
NOT NULL kısıtlaması olsun.
*/-- KISITLAMANIN İSMİNİ BİZ BELİRLEMEDİK!
create table memurlar(
id int PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>5000) NOT NULL
);
/*
SORU: insanlar isminde bir tablo oluşturunuz. isim, soyisim sutunları olsun.
isim sutununun data tipi int olsun. PRİMARY KEY kısıtlaması olsun. Kısıtlamanın ismi pr_ks olsun
soyisim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun
*/
create table insanlar(
isim int ,
soyisim varchar(30) ,
CONSTRAINT pr_ks PRIMARY KEY(isim),
CONSTRAINT uni_ks UNIQUE(soyisim) 
)
------------------------------2.DERS-----------------------------
/*
1.Data Query Language (Veri Sorgulama Dili - DQL)
SELECT: veritabanındaki verileri alır.

2.Data Manipulation Language (Veri Kullanma Dili - DML)
INSERT:Veritabanına yeni veri ekler.
DELETE:Veritabanındaki verileri siler
UPDATE:Veritabanındaki verileri günceller.

3.Data Definition Language (Veri Tanimlama Dili - DDL)
DROP: Bir veritabanını veya veritabanı içindeki tabloyu siler.
ALTER: Bir veritabanı veya veritabanı içindeki tabloyu günceller.
CREATE:Bir veritabanı veya veritabanı içinde tablo oluşturur.
*/

CREATE TABLE parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO parent VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO parent VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO parent VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO parent VALUES (104, 'Apple', 'Adam Eve');

select * from parent;

CREATE TABLE child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent(vergi_no)
);
INSERT INTO child VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO child VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO child VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO child VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO child VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO child VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO child VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from child;

--SORU 1: child tablosuna ted_verginosu 101 olan veri girişi yapınız
--parent da 101 nolu ıd olduğu için child tabloya veri girişi yapabiliriz.
insert into child values(101,2000,'Araba','Burak');

--SORU 2: .child tablosuna ted_verginosu 105 olan veri girişi yapınız.
--parent tablosunda 105 olmadığı için child a eklenemez
insert into child values(105,3000,'Motor','Haşim');
select * from parent;

--SORU 3: child tablosuna ted_vergino null olan veri girişi yapınız
insert into child values(null,4000,'bisikler','Nuri');
--, parent tabloda olmasa da child a null girişi yapabliriz.....istisna

 
--SORU 4: .parent tablosundaki vergi_no 101 olan veriyi siliniz.
--silemeyiz. önce child tablodan silmemeiz gerekir.
delete from parent where vergi_no=101; ---eror

--SORU 5: child tablosundaki ted_vergino 101 olan verileri siliniz
delete from child where ted_vergino=101;

--SORU 6: .parent tablosundaki vergi_no 101 olan veriyi siliniz
delete from parent where vergi_no=101;
--child tablodan 101 i sildiğimiz için artık parent tablodadan da silebildik.

--SORU 7: .parent tablosunu siliniz.
--child tablo silinmeden parent tablo silinemez.

--SORU 8: child tablosunu siliniz
drop table child;

--SORU 9: .parent tablosunu siliniz
drop table parent;
---------------------------------------




CREATE TABLE parent2
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO parent2 VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent2 VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent2 VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent2 VALUES (104, 'Apple', 'Mick Jackson');

select * from parent2;

CREATE TABLE child2
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent2(vergi_no)
ON DELETE CASCADE --child tablo silinmeden parent tabloyu silebileceğiz... 
	--tabi bağlantılı olan veriler childtan da silinmiş olcak.
);

INSERT INTO child2 VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child2 VALUES(102, 1002,'Kamera', 'Zehra Oz');
INSERT INTO child2 VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child2 VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child2 VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child2 VALUES(104, 1006,'Saat', 'Behlül Dana');
INSERT INTO child2 VALUES(104, 1007,'Kamera', 'Eymen Ozden');

select * from child2;

--SORU1: parent2 tablosundaki tüm verileri siliniz
delete from  parent2;--child tablodaki veriyi silmeden parentdakini  silebildik.--on delete cascade
select * from parent2;

--SORU2: parent2 tablosunu siliniz
--ON DELETE CASCADE sayesinde child tablo silinmeden parent tablo silindi.
drop table parent2 cascade; -- cascade yazmazsak silemeyiz!!!!!!!!!!!!!!!!!!!!

--SORU3: child2 tablosunu siliniz;
drop table child2;


-----------------------





-------------------------3.DERS-------------------------
/*
* *  CHİLD TABLODA ON DELETE CASCADE KOMUTU YAZILMAZSA  * *
	
1 - Child tablo silinmeden Parent tablo silinmeye calisilirsa PgAdmin Error verir.
yani Child tablo silinmeden Parent tablo silinemez.
2 - Child tablodaki veri silinmeden Parent tabloda ki veri silinmeye calisilirsa
PgAdmin Error verir. Child tablodaki silindikten sonra Parent tablodaki veri silinebilir.
	* *  CHİLD TABLODA ON DELETE CASCADE KOMUTU YAZILIRSA  * *
	
1 - Child tablo silinmeden Parent tablo silinebilir. PgAdmin buna Error vermez.
2 - Child tablodaki veri silinmeden Parent tablodaki veri silinebilir.PgAdmin buna Error vermez.
Parent tablodaki veriyi siler fakat bu durumda Child tablodaki veri de silinir.

*/

CREATE TABLE toptancilar        --> parent
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');

select * from toptancilar;

CREATE TABLE malzemeler     --> child
(
ted_vergino int,
malzeme_id int,
malzeme_isim VARCHAR(20),
musteri_isim VARCHAR(25),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES toptancilar(vergi_no)
on delete cascade
);

INSERT INTO malzemeler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO malzemeler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO malzemeler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO malzemeler VALUES(204, 1006,'TV', 'Ali Can');
INSERT INTO malzemeler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');

SELECT * FROM malzemeler;

-- SORU1: vergi_no’su 202 olan toptancinin sirket_ismi'ni 'VivoBook' olarak güncelleyeniz.
update toptancilar set sirket_ismi='Vivobook' where vergi_no=202;

--  SORU2: toptancilar tablosundaki tüm sirket isimlerini 'NOKIA' olarak güncelleyeniz.
update toptancilar set sirket_ismi='Nokia';

-- SORU3: vergi_no’su 201 olan toptancinin
--sirket_ismi'ni 'nokia' ve irtibat_ismi’ni 'Canan Can' olarak güncelleyiniz.
update toptancilar set sirket_ismi='nokia',irtibat_ismi='Canan Can' where vergi_no=201;

-- SORU4: sirket_ismi nokia olan toptancinin
--irtibat_ismi'ni 'Bilal Han' olarak güncelleyiniz.
update toptancilar set irtibat_ismi='Bilal Han' where sirket_ismi='nokia';

-- SORU5: malzemeler tablosundaki 'Telefon' değerlerini 'Phone' olarak güncelleyiniz.
update malzemeler set malzeme_isim='Phone' where malzeme_isim='Telefon';

-- SORU6: malzemeler tablosundaki malzeme_id değeri 1004'ten büyük olanların
 --malzeme_id'lerini 1 artırarak güncelleyiniz.
 update malzemeler set malzeme_id=malzeme_id+1 where malzeme_id>1004;

-- SORU7: malzemeler tablosundaki tüm malzemelerin malzeme_id değerini ted_vergino ile toplayarak güncelleyiniz.
update malzemeler set malzeme_id=malzeme_id+ted_vergino ;


-- SORU8: Malzemeler tablosundaki musteri_isim'i Ali Can olan malzeme_isim'ini,
--toptancılar  tablosunda irtibat_ismi 'Adem Coş' olan sirket_ismi ile güncelleyiniz.
update malzemeler set malzeme_isim= (select sirket_ismi from toptancilar where irtibat_ismi='Adem Coş' ) where musteri_isim='Ali Can';

-- SORU9: malzeme_ismi Laptop olan musteri_isim'ini,
 --sirket_ismi Apple’in irtibat_isim'i ile güncelleyiniz.
 update malzemeler set musteri_isim=(select irtibat_ismi from toptancilar where sirket_ismi='Apple') where malzeme_isim='Laptop';

--------------4.DERS---------------

create table arac(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
)
insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );


select*from arac

--SORU: arac tablosundaki en yüksek fiyat'ı listele
select max(fiyat) from arac;

--SORU2: arac tablosundaki fiyatların toplamını listele
select sum(fiyat)from arac;

--SORU3: arac tablosundaki fiyat ortalamalarını listele
select round(avg(fiyat)) from arac; -- roun koyunca kussuratlı gelmez
select round(avg(fiyat),2) from arac; --virgüldem sonra 2 sayı getirir

--SORU4: arac tablosunda kaç tane araç oldugunu listele
select count(id) from arac;

-----------
CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50),
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);
	
INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Can', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');

-- SORU1: meslekler tablosunu isim'e göre sıralayarak sorgulayınız.
select * from meslekler order by isim;

-- SORU2: meslekler tablosunda maas'i buyukten kucuge siralayiniz
select * from meslekler order by maas desc;

-- SORU3: meslekler tablosunda isim'i 'Ali' olanları,
-- maas'a göre büyükten küçüge sıralayarak sorgulayınız
select * from meslekler where isim='Ali' order by maas desc;

-- SORU4: meslekler tablosunda soyisim 'i 'Bulut' olanları,
-- maas sıralı olarak sorgulayınız.
select * from meslekler where soyisim='Bulut' order by maas desc;

-- SORU5: meslekler tablosunda id degeri 5 den büyük olan,
-- ilk 2 veriyi listeleyiniz
select * from meslekler where id>5 limit 2;

-- SORU6: meslekler tablosunda maası en yüksek 3 kişinin bilgilerini listeleyiniz
select *from meslekler order by maas desc limit 3;

-- SORU7: meslekler tablosunda ilk 2 veriden sonra 5 veriyi getirin
select * from meslekler offset 2 limit 3;

-- SORU8: meslekler tablosunda en yüksek maaşı alan 4. 5. 6. kişilerin bilgilerini listele
select *from meslekler order by maas desc offset 3 limit 3;



-----JOIN
create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);
insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu');
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');

create table aktorler
(id int,
actor_name varchar(30),
film_id int
);
insert into aktorler values (1, 'Ata Demirer', 1);
insert into aktorler values (2, 'Necati Sasmaz', 2);
insert into aktorler values (3, 'Gupse Ozay', 3);
insert into aktorler values (4, 'Engin Gunaydin', 4);
insert into aktorler values (5, 'Cem Yilmaz', 5);

-- SORU1: Tüm film_name'leri, category'lerini ve filimlerde oynayan actor_name'leri listeleyiniz.
select film_name,category,actor_name from filmler  left join aktorler  on filmler.film_id=aktorler.film_id;

-- SORU2: Tüm actor_name'leri ve film_name'lerini listeleyiniz.
--select actor_name, film_name from aktorler full join filmler on filmler.film_id=aktorler.film_id;--yanlış cevap null değeri geliyor

select actor_name, film_name from aktorler left join filmler on filmler.film_id=aktorler.film_id;--esas tablo aktorler tablosudur. onu referans alır.

select actor_name, film_name from filmler right join aktorler on filmler.film_id=aktorler.film_id;--2.yol


-----------
create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);
insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);

create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);
insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);

select * from qa_dersler

select * from developer_dersler

--SORU4: join kullanarak qa_dersleri ve developer_dersleri benzersiz sorgula

select A.ders_id, A.ders_ismi,A.ders_saati from qa_dersler as A
left join developer_dersler as B
on A.ders_ismi=B.ders_ismi
union
select B.ders_id, B.ders_ismi,B.ders_saati from qa_dersler as A
right join developer_dersler as B
on A.ders_ismi=B.ders_ismi;

--ortak olmayan dersleri listele
select qa_dersler.ders_ismi as A, developer_dersler.ders_ismi as B from qa_dersler full join developer_dersler on qa_dersler.ders_id=developer_dersler.ders_id
EXCEPT
select qa_dersler.ders_ismi as A, developer_dersler.ders_ismi as B from qa_dersler inner join developer_dersler on qa_dersler.ders_id=developer_dersler.ders_id