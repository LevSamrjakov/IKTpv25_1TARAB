--SELECT laused 2 tabelite põhjal
CREATE DATABASE Select2TabeliSamrjakov;
USE Select2TabeliSamrjakov;

CREATE TABLE Uudised(
UudisID int PRIMARY KEY identity(1,1),
UudisPealkiri varchar(50),
Kuupaev date,
Kirjeldus TEXT,
AjakirjanikID int);

CREATE  TABLE Ajakirjanikud(
AjakirjanikID int PRIMARY KEY identity(1,1),
Nimi varchar(50),
Telefon varchar(13));

ALTER TABLE Uudised ADD CONSTRAINT fk_ajakirjanik
FOREIGN KEY (AjakirjanikID) REFERENCES Ajakirjanikud(AjakirjanikID);

INSERT INTO Ajakirjanikud(Nimi, Telefon)
VALUES ('Lev', '56761140'),
('Konstantin', '56861239'),
('Maksim', '55589036');

SELECT * FROM Ajakirjanikud;

INSERT INTO Uudised(UudisPealkiri, Kuupaev, AjakirjanikID)
VALUES ('Homme on iseseisvuse tööpäev', '2025-03-12', 1),
('Homme on reede kolmteist', '2025-03-12', 1),
('Konstantin õpib 11. klassis', '2025-03-12', 2);

SELECT * FROM Uudised;

--alias-nimede kasutamine
SELECT u.UudisPealkiri, u.kirjeldus FROM Uudised AS U
--u - allias-nimi uudised tabelile
--2 tabeli põhilised laused
SELECT * FROM Uudised, Ajakirjanikud; --Ei ole õige päringi!
--Uudiste tabeli kirjed korrutatakse teise tabeli kirjaga.

SELECT * FROM Uudised, Ajakirjanikud
WHERE Uudised.AjakirjanikID = Ajakirjanikud.AjakirjanikID;
--sama päring alais nimedega.
SELECT * FROM Uudised as U, Ajakirjanikud as A
WHERE U.AjakirjanikID = A.AjakirjanikID;

--lihtsustame päringu
SELECT u.UudisPealkiri, a.Nimi as Autor
FROM Uudised as U, Ajakirjanikud as A
WHERE U.AjakirjanikID = A.AjakirjanikID;

--*lõikepilt tulemusest

--INNER JOIN-- (Sisemine ühendamine)
SELECT u.UudisPealkiri, a.Nimi as Autor
FROM Uudised as U INNER JOIN Ajakirjanikud as A
ON U.AjakirjanikID = A.AjakirjanikID;

--*lõikepilt tulemusest

--LEFT JOIN-- (Vasak välene ühendus)
SELECT a.Nimi as Autor, u.UudisPealkiri
FROM Ajakirjanikud as A LEFT JOIN Uudised as U
ON U.AjakirjanikID = A.AjakirjanikID;

--*lõikepilt tulemusest

--RIGHT JOIN-- (Parem väline ühendus)
SELECT a.Nimi as Autor, u.UudisPealkiri
FROM Ajakirjanikud as A RIGHT JOIN Uudised as U
ON U.AjakirjanikID = A.AjakirjanikID;

--*lõikepilt tulemusest

--CROSS JOIN-- (Korrutab kõik read 2 tabelist omavahel)
SELECT a.Nimi as Autor, u.UudisPealkiri
FROM Ajakirjanikud as A CROSS JOIN Uudised as U

--*lõikepilt tulemusest

--3. Tabel
CREATE TABLE Ajaleht(
AjalehtID INT PRIMARY KEY IDENTITY (1,1),
AjalehtNimetus varchar(50));

INSERT Ajaleht(AjalehtNimetus)
VALUES ('Postimees'),
('Delfi'),
('White Dwarf');

SELECT * FROM Ajaleht;

ALTER TABLE Uudised ADD AjalehtID int;

ALTER TABLE Uudised ADD CONSTRAINT fk_ajaleht
FOREIGN KEY (AjalehtID) REFERENCES Ajaleht(AjalehtID);

UPDATE Uudised SET AjalehtID = 3;

SELECT * FROM Ajaleht;
SELECT * FROM Uudised;

--SELECT 3 tabeli põhjal
SELECT u.UudisPealkiri, a.Nimi as Autor, Aj.AjalehtNimetus
FROM Uudised as U, Ajakirjanikud as A, Ajaleht as Aj
WHERE U.AjakirjanikID = A.AjakirjanikID
AND u.AjalehtID = Aj.AjalehtID;

--Sama INNER JOIN'iga--
SELECT u.UudisPealkiri, a.Nimi as Autor, Aj.AjalehtNimetus
FROM (Uudised as U INNER JOIN Ajakirjanikud as A
ON U.AjakirjanikID = A.AjakirjanikID)
INNER JOIN Ajaleht as Aj
ON u.AjalehtID = Aj.AjalehtID;
