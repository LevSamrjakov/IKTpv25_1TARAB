CREATE DATABASE SamrjakovTAR1;
use SamrjakovTAR1;

--Tabeli loomine
CREATE TABLE Tootaja(
TootajaID int PRIMARY KEY identity(1,1),
Eesnimi varchar(30),
Perenimi varchar(30),
Synniaeg date,
Koormus decimal(5,2),
Elukoht TEXT,
Abielus bit
);
--Tabeli kustutamine
drop table Tootaja;
--Taveli kuvamine
select * from Tootaja;

--Andmete lisamine tabelisse

INSERT INTO Tootaja(Eesnimi, Perenimi, Synniaeg)
VALUES ('Konstantin', 'Faronov', '2008-06-29'),
('Mark', 'Mubarakshen', '2008-11-20'),
('Aleksei', 'Udalov', '2007-02-13');
