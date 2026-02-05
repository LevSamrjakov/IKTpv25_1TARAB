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

--Tabel Zanr
CREATE TABLE Zanr(
ZanrID int PRIMARY KEY identity(1,1),
ZanrNimetus varchar(50) UNIQUE,
Kirjeldus TEXT)

INSERT INTO Zanr(ZanrNimetus, Kirjeldus)
VALUES ('Documentary Film', 'Stories about future tech, science, or imagined worlds.'),
('Science Fiction', 'True stories about real people or events.'),
('Animated Film', 'Films created using animation techniques.'),
('Supernatural Comedy Horror', 'Ghosts and scares played for laughs.'),
('Komöödia', 'Films made to entertain through humor.')

--tabeli struktuuri muutmine
ALTER TABLE Film ADD ZanrID int;
SELECT * FROM Film;
Select * From Zanr;
--FK lisamine
ALTER TABLE Film ADD CONSTRAINT fk_Zanr FOREIGN KEY (ZanrID) REFERENCES Zanr(ZanrID);
--tabeli uuendamine
UPDATE Film SET ZanrID=1 WHERE FilmID=1;
UPDATE Film SET ZanrID=2 WHERE FilmID=2;
UPDATE Film SET ZanrID=3 WHERE FilmID=3;
UPDATE Film SET ZanrID=4 WHERE FilmID=4;
UPDATE Film SET ZanrID=5 WHERE FilmID=5;

CREATE TABLE Tootja(
TootjaID int PRIMARY KEY identity(1,1),
TootjaNimi varchar(50) UNIQUE,
Asukoht varchar(30)
)
INSERT INTO Tootja(TootjaNimi, Asukoht)
VALUES ('Lise Lense-Møller', 'Denmark'),
('James Cameron', 'United States'),
('Soyuzmultfilm', 'Soviet Union'),
('Peter Jackson', 'United States'),
('Eesti Telefilm', 'Eesti')
Select * From Tootja;


CREATE TABLE TootjaFilm(
TootjaFilm int PRIMARY KEY identity(1,1),
TootjaID int,
FilmID int,
FOREIGN KEY (TootjaID) REFERENCES Tootja(TootjaID),
FOREIGN KEY (FilmID) REFERENCES Film(FilmID),
);
INSERT INTO TootjaFilm(TootjaID, FilmID)
VALUES ('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5')

Select * From Film;
Select * From Tootja;
Select * From TootjaFilm;
