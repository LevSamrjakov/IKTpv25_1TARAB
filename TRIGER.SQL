--SQL Triger
--Loome andmebaasi
CREATE DATABASE TrigeridSamrjakov;
USE TrigeridSamrjakov;

--Loome kaks tabelit
--1. Tabel - kuhu kasutaja sisestab andmeid (linnad)
CREATE TABLE Linnad(
LinnID INT PRIMARY KEY IDENTITY(1,1),
LinnaNimi VARCHAR(50) UNIQUE,
RahvaArv INT NOT NULL);

SELECT * FROM Linnad;

--2. Tabel - logi, kus triger lisab jälgitud andmeid.
CREATE TABLE Logi(
ID INT PRIMARY KEY IDENTITY(1,1),
Kuupaev DATETIME,
Andmed TEXT);

SELECT * FROM Logi;

--Trigeri loomine
--INSERT TRIGGER, mis jälgib andmete lisamine tabelisse linnad.
CREATE TRIGGER LinnaLisamine
ON Linnad
FOR INSERT
AS
INSERT INTO Logi(Kuupaev, Andmed)
SELECT 
GETDATE(), inserted.LinnaNimi
FROM inserted;

--Kontrollimiseks tuleb lisada uus linn tabelisse linnad
INSERT INTO Linnad(LinnaNimi, RahvaArv)
VALUES ('Tallinn', 600000);

SELECT * FROM Linnad;
SELECT * FROM Logi;

--Kustutame triger
DROP TRIGGER LinnaLisamine;

--Täiendatud triger
CREATE TRIGGER LinnaLisamine
ON Linnad
FOR INSERT
AS
INSERT INTO Logi(Kuupaev, Andmed)
SELECT 
GETDATE(),
CONCAT('Lisatud linn: ',inserted.LinnaNimi,
' | Rahvaarv: ', inserted.RahvaArv, ' | ID: ', inserted.LinnID)
FROM inserted;

--Kontrollimiseks tuleb lisada uus linn tabelisse linnad
INSERT INTO Linnad(LinnaNimi, RahvaArv)
VALUES ('Tartu', 96000);

INSERT INTO Linnad(LinnaNimi, RahvaArv)
VALUES ('Kuressaare', 12500);

--DELETE TRIGGER
CREATE TRIGGER LinnaKustutamine
ON Linnad
FOR DELETE
AS
INSERT INTO Logi(Kuupaev, Andmed)
SELECT
GETDATE(),
CONCAT('Kustutatud linn: ', deleted.LinnaNimi,
' | Rahvaarv: ', deleted.RahvaArv, ' | ID: ', deleted.LinnID)
FROM deleted;

DELETE FROM Linnad WHERE LinnID = 1;
SELECT * FROM Linnad;
SELECT * FROM Logi;

--UPDATE TRIGGER
CREATE TRIGGER LinnaUuendamine
ON Linnad
FOR UPDATE
AS INSERT INTO Logi(Kuupaev, Andmed)
SELECT
GETDATE(),
CONCAT('Vana linna andmed: ', d.LinnaNimi,
' | Rahvaarv: ', d.RahvaArv, ' | ID: ', d.LinnID,
' | Uued linna andmed: ', I.LinnaNimi,
' | Rahvaarv: ', I.RahvaArv, ' | ID: ', I.LinnID)
FROM deleted D INNER JOIN inserted I
ON D.LinnID = I.LinnID;

--Kontrollimiseks uuendame linna andmed
UPDATE Linnad SET LinnaNimi = 'Tallinn', RahvaArv = 600000
WHERE LinnID = 3;

SELECT * FROM Linnad;
SELECT * FROM Logi;

--Lisame KasutajaNimi logi tabelisse
ALTER TABLE Logi ADD KasutajaNimi varchar(40);
SELECT * FROM Logi;

INSERT INTO Linnad(LinnaNimi, RahvaArv)
VALUES ('Narva', 52500);

DELETE FROM Linnad WHERE LinnID = 3;

UPDATE Linnad SET LinnaNimi = 'Viljandi', RahvaArv = 16800
WHERE LinnId = 2;

SELECT * FROM Linnad;
SELECT * FROM Logi;
