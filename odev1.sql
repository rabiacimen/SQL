
--NOT:COMPOSİTE PRIMARY KEY
--eğer bir tabloda iki tane primary key yapmak istersek constarınt olarak yapmamız lazım. 
--composite... yan yana ekleyebiliriz. 
--diğer türlü yukarıda atama yapıcaksak 1 den fazla atayamayız.
CREATE TABLE ogrenciler93
(
ogrenci_no char(7),
isim varchar(20), 
soyisim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no,isim),  --COMPOSİTE PK  
unique (soyisim,not_ort)
);


-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz
Select marka_id as ankarada_calisan_id,calisan_sayisi from markalar
Where marka_isim in (Select isyeri from calisanlar2 where sehir='Ankara');
select * from markalar;
select * from calisanlar2;