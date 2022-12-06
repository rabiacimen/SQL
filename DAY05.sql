CREATE TABLE personel1
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);
INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel1 VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--isme göre toplam masşları bulun.
select isim,sum(maas) from personel1 
group by isim;

--personel tablosundaki isimleri gruplayınız.
select isim from personel1 group by isim;

select isim,count(sehir) from personel1 --kaç şehirde olduklarını bulduk
group by isim;

--şehre göre personel sayısını bulunuz.
select sehir, count(isim) as calisan_sayisi from personel1
group by sehir;


-- 									HAVING CLAUSE
-- HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.

--where dersek gruplamadan önce bir şart koymuş oluruz. o nedenle burada having kullanırız.
--Gruplamadan once bir sart varsa 'where',gruplamadan sonra sart varsa 'having' kullaniyoruz.
--Having komutu yalnizca GROUP BY komutu ile kullanilir
	--Eger gruplamadan sonra bir sart varsa HAVING komutu kullanilir

---1) Her sirketin MIN maaslarini eger 4000’den buyukse goster

select sirket, min(maas) as en_dusuk_maas from personel1 group by sirket having min (maas)>4000;


-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz
select isim, sum(maas) as toplam_maas from personel1 group by isim having sum(maas)>10000;

--3) Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz

select sehir, count(isim) as toplam_personel_sayisi from personel1 group by sehir having count(isim)>1;

-- Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yazini

select sehir, max(maas) as en_yuksek_maas from personel1 group by sehir having max(maas)<5000;

--						UNION OPERATOR
-- Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i
-- ayni olmalidir.

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz				--sorguları birleştiriyor--


select isim as isci_veya_sehir_ismi, maas from personel1 where maas>4000
UNION
select sehir as isci_veya_sehir_ismi, maas from personel1 where maas>5000

--2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
--bir tabloda gosteren sorgu yaziniz
select isim as isim_veya_sehir_ismi,maas from personel1 where isim='Mehmet Ozturk'
UNION
select sehir  as isim_veya_sehir_ismi,maas from personel1 where sehir='Istanbul'
ORDER BY maas DESC ---Maasa göre tersten sıraladık

--NOT : 2.sorgunun sonuna ORDER BY komutunu kullanirsaniz tum tabloyu istediginiz 
--siralamaya gore siralar


			---ODEV----
--3)Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az
--olanlari bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz



--drop table personel if exists // istersek önce tabloyu silip aynı isimde oluşturabilriiz.

CREATE TABLE personel2
(
id int PRIMARY KEY,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20)
);
	
INSERT INTO personel2 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel2 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel2 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel2 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel2 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel2 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel2 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
	
	CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel2(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel2
select * from personel_bilgi

-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin

select sehir as sehir_ve_tel, maas as maas_ve_cocuk_sayisi from personel2 where id=123456789
UNION
select tel,cocuk_sayisi from personel_bilgi where id=123456789;

--/UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir, 
--Ayni kayit birden fazla olursa, sadece bir tanesini alir. 
--UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.*/

--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
select isim,maas from personel2 where maas<5000
union all -- hepsini çalıştırdı. ilk sorgu ve ikinci sorgu altalta geldi
select isim,maas from personel2 where maas<5000; --union yaptık ..tekrarlı olanları teke düşürdü



		---INTERSECT--- //kesişim kümesi

-- Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
select id from personel2 where sehir in('Istanbul','Ankara')
INTERSECT
-- Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel_bilgi where cocuk_sayisi in(2,3);



--1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
select id from personel2 where maas<4800 or maas>5000
INTERSECT
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel_bilgi where cocuk_sayisi in(2,3);

--3) Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
SELECT isim FROM personel2 WHERE sirket=‘Honda’
INTERSECT
SELECT isim FROM personel2 WHERE sirket=‘Ford’
INTERSECT
SELECT isim FROM personel2 WHERE sirket=‘Tofas’;


				---EXCEPT----//fark kümesi gibi
				
/*
iki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanilir
*/
 
--1) 5000’den az maas alip Honda’da calismayanlari yazdirin
select isim,sirket from personel2 where maas<5000
EXCEPT
select isim,sirket from personel2 where sirket='Honda';

--2) Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve sehirlerini listeleyin
select isim,sehir from personel2 where isim='Mehmet Ozturk'
EXCEPT
select isim,sirket from personel2 where sehir='Istanbul';
				

