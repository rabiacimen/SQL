-- DATABASE(VeriTabanı) Oluşturma
Create dataBase rabia;

create database nalan;

-- DDL - DATA DEFINITION LANG.
-- CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--Ondalıklı sayilar kullanılır(Double gibi)
kayit_tarih date
);

--VAROLAN TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE ogrenci_notlari
AS --Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için,
--normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız.
SELECT isim,soyisim,Not_ort FROM ogrenciler;

-- DML - DATA MANUPALATION LANG.
-- INSERT (Database'e veri ekleme)

INSERT INTO ogrenciler VALUES ('1234567', 'Said','Ilhan',85.5,now());
INSERT INTO ogrenciler VALUES ('1234567', 'Said','Ilhan',85.5,'2022-12-2');

-- BIR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK
INSERT INTO ogrenciler (isim,soyisim) VALUES ('Erol','Evren');



-- DQL - DATA QUERY LANG.
-- SELECT


select * FROM ogrenciler; -- Buradaki * sembolü herşeyi anlamındadır..





