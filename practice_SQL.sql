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