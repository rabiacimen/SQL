CREATE TABLE ogrenciler5
(
ogrenci_no char(7), --Uzunluğunu bildiğimiz stringler için char kullanırız.
isim varchar(20),--Uzunluğunu bilmediğimiz stringlerde varchar kullanırız
soyisim varchar(25),
not_ort real,--Ondalıklı sayilar kullanılır(Double gibi)
kayit_tarih date
);

--VAROLAN TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler5;

select* from notlar; --notlar tablosundan herşeyi getir dedik

--TABLO İÇİNE VERİ EKLEME
INSERT INTO notlar VALUES('Muaz',85);
INSERT INTO notlar VALUES('Fatma',100);
INSERT INTO notlar VALUES('Said',80);
INSERT INTO notlar VALUES('Feyyyaz',85.5);--silip değerleri değiştirip de oluşturabiliriz.
select* from notlar;

Create table talebeler
(
isim varchar(10),
	notlar real
);

INSERT INTO talebeler VALUES('Muaz',85);
INSERT INTO talebeler VALUES('Fatma',100);
INSERT INTO talebeler VALUES('Said',80);
INSERT INTO talebeler VALUES('Feyyyaz',85.5);

--CONSTRAINT
--UNIQEU

CREATE TABLE ogrenciler6
(
ogrenci_no char(7) UNIQUE,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,
kayit_tarih date
);

select * from ogrenciler6;

CREATE TABLE ogrenciler7
(
ogrenci_no char(7) UNIQUE,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,
kayit_tarih date
);

select * from ogrenciler7;

INSERT INTO ogrenciler7 VALUES ('1234567','Osman','Cınar',95.5,now());
INSERT INTO ogrenciler7 VALUES ('1234568','Ali','Cımen',95.5,now());
INSERT INTO ogrenciler7 (ogrenci_no,soyisim,not_ort)VALUES ('1234569','Ayse',95.5);--not null hatası aldık. isim datası null kabul etmez.




--PRIMARY KEY ataması

CREATE TABLE ogrenciler8
(
ogrenci_no char(7)primary key, --primary key yazınca bu data primary key oldu.
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date
);

--PRIMARY KEY ataması 2. yol

CREATE TABLE ogrenciler9
(
ogrenci_no char(7), 
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date,
	
	CONSTRAINT ogr PRIMARY KEY(ogrenci_no) 
);

--3.secenek
CREATE TABLE ogrenciler10
(
ogrenci_no char(7), 
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date,
	
 PRIMARY KEY(ogrenci_no) 
);


--FOREIGN KEY
/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.*/

CREATE TABLE tedarikciler3

(
tedarikci_ID char(5) primary key,
	tedarikci_ismi varchar(20),
	iletisim_isim varchar(20)
);

CREATE TABLE urunler
(
tedarikci_ID char(5),
	urun_ID char(5),
FOREIGN KEY(tedarikci_ID ) REFERENCES tedarikciler3(tedarikci_ID)
);




CREATE TABLE urunler --ismi kendimi< vermek istersek....
(
tedarikci_ID char(5),
	urun_ID char(5),
CONSTRAINT urn_fk FOREIGN KEY(tedarikci_ID ) REFERENCES tedarikciler3(tedarikci_ID)
);

select*from tedarikciler3;
select*from urunler;



/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar
(
id char(5) PRİMARY KEY,
	isim varchar(20) UNIQUE,
	maas int NOT NULL,
	ise_baslama date
);

CREATE TABLE adresler
(
adres_ID char(5),
	sokak varchar(15),
	cadde varchar(15),
	sehir varchar(15),
	FOREIGN KEY(adres_ID) REFERENCES calisanlar(id)
);


/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve
“sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.
*/



CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);




INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); --UNIQUE CONS. oldugu icin kabul etmedi
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL CONS. oldugu icin kabul etmedi.
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE CONS. oldugu icin kabul etmedi
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--int girmem gereken yere string girmeye calısmısım
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');--primary key ilk hicliği kabul etti.
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--unıque old icin ikinci hicliği kabul etmedi.
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--aynı primary key kabul etmedi
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key null kabul etmedi

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

SELECT*FROM calisanlar;
SELECT*FROM adresler;


CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK(maas>10000) NOT NULL,
ise_baslama date
);

INSERT INTO calisanlar1 VALUES('10004', 'Mehmet Yılmaz' ,9000, '2018-04-14');--maas 10000 den az olamaz.


--DQL--WHERE KULLANIMI
SELECT * FROM calisanlar;--calisanlar tablosunu getir
SELECT isim FROM calisanlar;--calısanlar tablosundaki isimleri getir

--CALİSANLAR tablosundan maası 5000 den buyuk olaN İSİMLERİ listeleyiniz.

SELECT isim,maas FROM calisanlar WHERE(maas>5000);

--Calisanlar tablsoundan ismi Veli Han olan TÜM veriyi listeleyiniz.

SELECT * FROM calisanlar WHERE isim= 'Veli Han';--calisanlar tablosundan ismi veli han olanların tüm verileri..

--CALİSANLAR tablosundan maası 5000 olaN tüm verileri listeleyiniz.

SELECT * FROM calisanlar WHERE maas=5000;


--DML-- DELETE
DELETE FROM calisanlar;-- eger parent tablo baska bir child tablo ile iliskili ise önce child table silinmelidir.
DELETE FROM adresler;--adresler tablosuun içindeki VERİLERİ siler.

--Adresler tablsoundan şehri antep olan verileri silelim
DELETE FROM adresler WHERE sehir='Antep';
SELECT*FROM adresler;


CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

---- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
DELETE FROM ogrenciler3 WHERE isim ='Nesibe Yılmaz' or isim='Mustafa Bak';
SELECT*FROM ogrenciler3;

-- İsmi Ali Can ve id'si 123 olan kaydı siliniz.
DELETE FROM ogrenciler3 WHERE isim='Ali Can' and id=123;-----------------------------KONTROL ET
SELECT*FROM ogrenciler3;

-- id 'si 126'dan büyük olan kayıtları silelim.
DELETE FROM ogrenciler3 WHERE (id>126);
SELECT id FROM ogrenciler3;

-- id'si 123, 125 veya 126 olanları silelim.
DELETE FROM ogrenciler3 WHERE id=123 and id=125 and id=126;-----------------------------SOR
SELECT id FROM ogrenciler3;







