CREATE DATABASE LapsAndLoomSamrjakov;
USE LapsAndLoomSamrjakov;

--1.
CREATE TABLE Laps(
    LapsID INT NOT NULL PRIMARY KEY identity(1,1),
    Nimi VARCHAR(40) NOT NULL,
    Pikkus SMALLINT,
    Synniaasta INT NULL,
    Synnilinn VARCHAR(15)
);

INSERT INTO Laps(Nimi, Pikkus, Synniaasta, Synnilinn)
VALUES ('Lev', 178, 2008, 'Tallinn'),
('Konstantin', 170, 2008, 'Tallinn'),
('Ira', 168, 2009, 'Dublin'),
('Ina', 156, 2010, 'Kiev'),
('Horus', 162, 2011, 'Muhosransk');

SELECT * From Laps;

--2.
CREATE TABLE Loom(
    LoomID INT NOT NULL PRIMARY KEY identity(1,1),
    Nimi VARCHAR(40) NOT NULL,
    Kaal SMALLINT,
    LapsID INT,
    FOREIGN KEY (LapsID) REFERENCES Laps(LapsID)
);

INSERT INTO Loom(Nimi, Kaal, LapsID)
VALUES ('kass Milli', 4, 1),
('koer Inu', 14, 2),
('papagoi Patrick', 1, 3),
('koer Sobak', 12, 4),
('koer Hellhound', 21, 5);

SELECT * From Loom;

--View kus on ainult kassid
CREATE VIEW AinultKassid AS
SELECT Nimi FROM Loom
WHERE Nimi LIKE 'kass%'

SELECT * FROM AinultKassid;

--Lapsed kui on noorem või võrdub 18 aastat vana
CREATE VIEW LapsedAlla18 AS
SELECT Nimi, Synniaasta, (2026-Synniaasta) AS Vanus FROM Laps
WHERE Synniaasta >=2008;

SELECT * FROM LapsedAlla18;

--Keskmine loomakaal
CREATE VIEW Loomakaal AS
SELECT AVG(Kaal) AS KeskmineKaal FROM Loom;

SELECT * From Loomakaal;

--UPDATE VIEW

CREATE VIEW Loomad AS
SELECT Nimi, Kaal FROM Loom;

Select * From Loom;
SELECT * FROM Loomad;

UPDATE Loomad SET Kaal = Kaal * 1.1;
