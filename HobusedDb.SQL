CREATE DATABASE HobusedDb;
USE HobusedDb;

--Tabel Linnad
CREATE TABLE Hobused(
ID INT PRIMARY KEY IDENTITY(1,1),
Nimi VARCHAR(50),
Vanus INT,
Kiirus DECIMAL(5,2));

--Tabel Logid
CREATE TABLE Logid(
ID INT PRIMARY KEY IDENTITY(1,1),
Kuupaev DATETIME,
Andmed TEXT,
Kasutaja VARCHAR(40));

--Tabel Ratsanik
CREATE TABLE Ratsanik(
RatsanikID INT PRIMARY KEY IDENTITY(1,1),
RatsanikNimi VARCHAR(30) UNIQUE);

--Foreign Key Tabelis Hobused
ALTER TABLE Hobused ADD RatsanikID INT;
SELECT * FROM Hobused;
ALTER TABLE Hobused ADD CONSTRAINT FK_Ratsanik
FOREIGN KEY (RatsanikID) REFERENCES Ratsanik(RatsanikID);

--Täidame Tabelid
--Ratsanik
INSERT INTO Ratsanik(RatsanikNimi)
VALUES ('Yutaka Take'), ('Yukio Okabe'), ('Ryuji Wada');

INSERT INTO Ratsanik(RatsanikNimi)
VALUES ('Yoshitomi Shibata')

SELECT * FROM Ratsanik;

--Hobused
INSERT INTO Hobused(Nimi, Vanus, Kiirus, RatsanikID)
VALUES ('Special Week', 4, 61, 1),
('El Condor Pasa', 3, 64, 5),
('Tokai Teio', 4, 64.3, 2),
('TM Opera O', 4, 60.6, 3),
('Hishi Amazon', 3, 71.6, 6);

UPDATE Hobused SET 

SELECT * FROM Hobused;

SELECT * FROM Hobused, Ratsanik
WHERE Hobused.RatsanikID = Ratsanik.RatsanikID;

--Sama päring Inner Join'iga
SELECT * FROM Hobused INNER JOIN Ratsanik
ON Hobused.RatsanikID = Ratsanik.RatsanikID;

--Insert Triger
CREATE TRIGGER HobuseLisa
ON Hobused
FOR INSERT
AS
INSERT INTO Logid(Kuupaev, Andmed, Kasutaja)
SELECT
GETDATE(),
CONCAT('Lisatud Hobune: ', inserted.Nimi, ', ', inserted.Vanus, ', ', inserted.Kiirus, ',', R.RatsanikNimi),
SYSTEM_USER
FROM inserted INNER JOIN Ratsanik R
ON inserted.RatsanikID = R.RatsanikID;

--Kontrolli
INSERT INTO Hobused(Nimi, Vanus, Kiirus, RatsanikID)
VALUES ('Matikanefukukitaru', 3, 60.9, 4);

INSERT INTO Hobused(Nimi, Vanus, Kiirus, RatsanikID)
VALUES ('Matikanetannhauser', 6, 58.7, 7);

SELECT * FROM Logid;
SELECT * FROM Hobused;

--Delete Triger
CREATE TRIGGER HobuseKustuta
ON Hobused
FOR DELETE
AS
INSERT INTO Logid(Kuupaev, Andmed, Kasutaja)
SELECT
GETDATE(),
CONCAT('Kustutatud Hobune: ', deleted.Nimi, ', ', deleted.Vanus, ', ', deleted.Kiirus, ', ', R.RatsanikNimi),
SYSTEM_USER
FROM deleted INNER JOIN Ratsanik R
ON deleted.RatsanikID = R.RatsanikID;

--Kontrolli
DELETE FROM Hobused WHERE ID = 7;

SELECT * FROM Logid;
SELECT * FROM Hobused;

--Update Triger
CREATE TRIGGER HobuseUuenda
ON Hobused
FOR UPDATE
AS INSERT INTO Logid(Kuupaev, Andmed, Kasutaja)
SELECT
GETDATE(),
CONCAT('Vana hobuse andmed: ', deleted.Nimi,
' | Vanus: ', deleted.Vanus, ' | Kiirus: ', deleted.Kiirus, ' | Ratsanik: ', R1.RatsanikNimi,
' | Uued hobuse andmed: ', inserted.Nimi,
' | Vanus: ', inserted.Vanus, ' | Kiirus: ', inserted.Kiirus, ' | Ratsanik: ', R2.RatsanikNimi),
SYSTEM_USER
FROM deleted
INNER JOIN inserted ON deleted.ID = inserted.ID
INNER JOIN Ratsanik R1 ON deleted.RatsanikID = R1.RatsanikID
INNER JOIN Ratsanik R2 ON deleted.RatsanikID = R2.RatsanikID;

--Kontrolli
SELECT * FROM Hobused;
SELECT * FROM Ratsanik;
UPDATE Hobused SET RatsanikID = 2 WHERE RatsanikID = 1;

SELECT * FROM Logid;
UPDATE Hobused SET Nimi = 'Wonder Acute' WHERE RatsanikID = 3;

GRANT 
SELECT, UPDATE, DELETE
ON Hobused 
TO HobuseDirektor;
