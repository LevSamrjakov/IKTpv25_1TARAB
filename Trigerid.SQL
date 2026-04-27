--SQL Triigerid
CREATE DATABASE TrigerSamrjakov;
USE TrigerSamrjakov;
--Tabel Linnad
CREATE TABLE Linnad(
LinnID INT PRIMARY KEY IDENTITY(1,1),
LinnaNimi VARCHAR(50) UNIQUE,
RahvaArv INT NOT NULL);

--Tabel Logid
CREATE TABLE Logid(
ID INT PRIMARY KEY IDENTITY(1,1),
Kuupaev DATETIME,
Andmed TEXT,
Kasutaja VARCHAR(25));

--Tabel Maakonnad
CREATE TABLE Maakonnad(
MaakondID INT PRIMARY KEY IDENTITY(1,1),
MaakondNimi VARCHAR(25) UNIQUE);

--Foreign Key Tabelis Linnad
ALTER TABLE Linnad ADD MaakondID INT;
SELECT * FROM Linnad;
ALTER TABLE Linnad ADD CONSTRAINT FK_Maakond
FOREIGN KEY (MaakondID) REFERENCES Maakonnad(MaakondID);

--Täidame Tabelid
--Maakonnad
INSERT INTO Maakonnad(MaakondNimi)
VALUES ('Harjumaa'), ('Pärnumaa'), ('Virumaa');

SELECT * FROM Maakonnad;

--Linnad
INSERT INTO Linnad(LinnaNimi, RahvaArv, MaakondID)
VALUES ('Tallinn', 600000, 1), ('Rakvere', 150000, 3);

SELECT * FROM Linnad;

SELECT * FROM Linnad, Maakonnad
WHERE Linnad.MaakondID = Maakonnad.MaakondID;

--Sama päring Inner Join'iga
SELECT * FROM Linnad INNER JOIN Maakonnad
ON Linnad.MaakondID = Maakonnad.MaakondID;

--Insert Triger
CREATE TRIGGER LinnaLisamine
ON Linnad
FOR INSERT
AS
INSERT INTO Logid(Kuupaev, Andmed, Kasutaja)
SELECT
GETDATE(),
CONCAT('Lisatud Linn: ', inserted.LinnaNimi, ', ', inserted.RahvaArv, ', ', M.MaakondNimi),
SYSTEM_USER
FROM inserted INNER JOIN Maakonnad M
ON inserted.MaakondID = M.MaakondID;

--Kontrolli
INSERT INTO Linnad(LinnaNimi, RahvaArv, MaakondID)
VALUES ('Pärnu', 100000, 2);

INSERT INTO Linnad(LinnaNimi, RahvaArv, MaakondID)
VALUES ('Viru', 150000, 3);

SELECT * FROM Logid;
SELECT * FROM Linnad;

--Delete Triger
CREATE TRIGGER LinnaKustutamine
ON Linnad
FOR DELETE
AS
INSERT INTO Logid(Kuupaev, Andmed, Kasutaja)
SELECT
GETDATE(),
CONCAT('Kustutatud Linn: ', deleted.LinnaNimi, ', ', deleted.RahvaArv, ', ', M.MaakondNimi),
SYSTEM_USER
FROM deleted INNER JOIN Maakonnad M
ON deleted.MaakondID = M.MaakondID;

--Kontrolli
DELETE FROM Linnad WHERE LinnID = 2;

SELECT * FROM Logid;
SELECT * FROM Linnad;

--Update Triger
CREATE TRIGGER LinnaUuendamine
ON Linnad
FOR UPDATE
AS INSERT INTO Logid(Kuupaev, Andmed, Kasutaja)
SELECT
GETDATE(),
CONCAT('Vana linna andmed: ', deleted.LinnaNimi,
' | Rahvaarv: ', deleted.RahvaArv, ' | ID: ', M1.MaakondNimi,
' | Uued linna andmed: ', inserted.LinnaNimi,
' | Rahvaarv: ', inserted.RahvaArv, ' | ID: ', M2.MaakondNimi),
SYSTEM_USER
FROM deleted
INNER JOIN inserted ON deleted.LinnID = inserted.LinnID
INNER JOIN Maakonnad M1 ON deleted.MaakondID = M1.MaakondID
INNER JOIN Maakonnad M2 ON deleted.MaakondID = M2.MaakondID;

--Kontrolli
SELECT * FROM Linnad;
SELECT * FROM Maakonnad;
UPDATE Linnad SET MaakondID = 1 WHERE LinnID = 4;

SELECT * FROM Logid;
UPDATE Linnad SET MaakondID = 1, LinnaNimi = 'Uus Viru' WHERE LinnID = 4;
