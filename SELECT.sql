CREATE DATABASE SelectLevSamrjakov;
USE SelectLevSamrjakov;

create table Telefon(
TelefonID INT PRIMARY KEY,
Tootja VARCHAR(50) NOT NULL,
TelefonMudel VARCHAR(50),
Hind money,
v_aasta int,
OSysteem VARCHAR(10));

Select * From Telefon;

ALTER TABLE Telefon ALTER COLUMN OSysteem varchar(50);

insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (1, 'HTC', 'HTC J', 129.99, 2012, 'Android 4.0.4, Sense UI 4');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (2, 'Spice', 'Spice Mi-506 Stellar Mettle Icon', 5.99, 2014, 'Android 4.2');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (3, 'Wiko', 'Wiko Rainbow Jam 4G', 1.49, 2015, 'Android 5.1');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (4, 'Dell', 'Dell Mini 3i', 22.99, 2009, 'OPhone OS');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (5, 'Archos', 'Archos 50d Helium 4G', 54.99, 2015, 'Android 5.1');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (6, 'BlackBerry', 'BlackBerry Curve 9350', 4.99, 2011, 'BlackBerry OS 7.0');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (7, 'Samsung', 'Samsung X480', 4.99, 2005, 'Feature phone');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (8, 'Nokia', 'Nokia 5', 29.99, 2017, 'Android 7.1.1, up to Android 9.0');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (9, 'LG', 'LG G4c', 15.99, 2015, 'Android 5.0.2, up to 6.0, LG Optimus UX UI 4');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (10, 'Lava', 'Lava A72', 79.99, 2016, 'Android 5.1, up to 6.0');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (11, 'ZTE', 'ZTE Warp Sequent', 34.99, 2012, 'Android 4.0.4');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (12, 'Oppo', 'Oppo Neo 5', 15.99, 2014, 'Android 4.3, ColorOS 1.4');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (13, 'NEC', 'NEC e101', 4.29, 2004, 'Feature phone');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (14, 'alcatel', 'alcatel Idol 3 (5.5)', 19.99, 2015, 'Android 5.0.2, up to 6.0.1');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (15, 'Yezz', 'Yezz Andy C5V', 49.99, 2014, 'Android 4.4.2');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (16, 'Samsung', 'Samsung S5500 Eco', 5.49, 2010, 'Feature phone');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (17, 'Yezz', 'Yezz Andy 5.5EI', 34.99, 2014, 'Android 4.2.2');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (18, 'Sony', 'Sony Xperia miro', 3.99, 2012, 'Android 4.0');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (19, 'Huawei', 'Huawei Mate RS Porsche Design', 45, 2018, 'Android 8.1, EMUI 9.1');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (20, 'Samsung', 'Samsung A110', 2.49, 2000, 'Feature phone');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (21, 'Motorola', 'Motorola Moto Z3', 89.99, 2018, 'Android 8.1, up to Android 9.0');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (22, 'OnePlus', 'OnePlus 5T', 8.49, 2017, 'Android 7.1.1, up to 10, OxygenOS 10.0.0');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (23, 'Infinix', 'Infinix Hot 10 Lite', 2.99, 2020, 'Android 10');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (24, 'Amoi', 'Amoi CS6', 8.49, 2004, 'Feature phone');
insert into Telefon (TelefonID, Tootja, TelefonMudel, Hind, v_aasta, OSysteem) values (25, 'Lenovo', 'Lenovo A916', 25.99, 2014, 'Android 4.4.2');

--Select kuvab ainult 2 veergu tabelist
SELECT Tootja, TelefonMudel FROM Telefon;
SELECT Tootja, TelefonMudel AS Mudel FROM Telefon;

--Sorteerimine

--ASC kasvavas järjekorras
SELECT Tootja, TelefonMudel AS Mudel, Hind
FROM Telefon
ORDER BY Hind; --ORDER BY Hind ASC;

--DESC kahanevas järjekorras
SELECT Tootja, TelefonMudel AS Mudel, Hind
FROM Telefon
ORDER BY Hind DESC;

--Võrdlemine >, <, =, >=, <= (Works with numbers - INT, money, etc.)
SELECT TelefonMudel, Hind
FROM Telefon
WHERE Hind > 35; --Leiab mudelid hinnaga suurem kui 35

SELECT TelefonMudel, Hind
FROM Telefon
WHERE Hind > 35
ORDER BY Hind; --ORDER BY is always last.

--Leia mudelid vahemikus 10 - 15 euro
SELECT TelefonMudel, Hind
FROM Telefon
WHERE Hind BETWEEN 5 and 25
ORDER BY Hind;

--Sama päring ilma BETWEEN
SELECT TelefonMudel, Hind
FROM Telefon
WHERE Hind >=5 and Hind <=25
ORDER BY Hind;

--Distinct ?! näitab ainult üks kordus
SELECT DISTINCT OSysteem FROM Telefon;

--Võrdlemine tekstiga LIKE
SELECT Tootja, TelefonMudel
FROM Telefon
WHERE Tootja LIKE 'Samsung';

--IN kuvab vastavus loetelus - соответствие перечислению
SELECT Tootja, TelefonMudel
FROM Telefon
WHERE Tootja IN ('Samsung',  'Lenovo',  'Sony');

--Sama päring ilma IN
SELECT Tootja, TelefonMudel
FROM Telefon
WHERE Tootja LIKE 'Samsung' OR Tootja LIKE 'Lenovo' OR Tootja LIKE 'Sony';

--Leia mudelid mis algavad S tähega
SELECT Tootja, TelefonMudel
FROM Telefon
WHERE TelefonMudel LIKE 'S%'; --% tähendab üks kõik palju sümboolit

--Sisaldab S täht '%S%'
--Lõppetab S Täht '%S'

--Agregaat funktsioonid: AVG, MAX, MIN, SUM, COUNT

--Keskmine väljastamise aasta (AVG)
SELECT AVG(v_aasta) AS KeskmineAasta
FROM Telefon;

--Telefonide üldkogus
SELECT COUNT(*) AS 'Üldkogus'
FROM Telefon;

--Keeruline variant funktsiooniga
--Telefonide üldkogus iga tootja kohta
SELECT Tootja, Count(*) AS 'Üldkogus'
FROM Telefon
GROUP BY Tootja;

--Top 6
SELECT TOP 6 Tootja, Hind
FROM Telefon
ORDER BY Tootja DESC;
