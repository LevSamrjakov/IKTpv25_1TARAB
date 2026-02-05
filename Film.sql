CREATE DATABASE FilmSamrjakov;
use FilmSamrjakov;

--Tabeli rezisoor loomine
CREATE TABLE Rezisoor(
RezisoorID int PRIMARY KEY identity(1,1),
Eesnimi varchar(20),
Perenimi varchar(20) UNIQUE,
Synniaasta int);
SELECT * FROM Rezisoor;
--Tabeli täitmine
INSERT INTO Rezisoor(Eesnimi, Perenimi, Synniaasta)
VALUES ('Michael', 'Madsen', 1971),
('James', 'Cameron', 1954),
('Lev', 'Atamanov', 1905),
('Peter', 'Jackson', 1961),
('Leo', 'Karpin', 1946)

--tabeli Filmi loomine
CREATE TABLE Film(
FilmID int PRIMARY KEY identity(1,1),
FilmNimetus varchar(20),
Pikkus int,
RezisoorID int,
FOREIGN KEY (RezisoorID) REFERENCES Rezisoor(RezisoorID),
v_aasta int CHECK(v_aasta<2027)
);
SELECT * FROM Film;
Select * FROM Rezisoor;
DROP TABLE Rezisoor;

INSERT INTO Film(FilmNimetus, RezisoorID, Pikkus, v_aasta)
VALUES('Into Eternity', 1, 75, 2010),
('Xenogenesis', 2, 12, 1978),
('The Scarlet Flower', 3, 42, 1952),
('The Frighteners', 4, 110, 1996),
('Teisikud', 5, 80, 1982)

DROP TABLE Film;
