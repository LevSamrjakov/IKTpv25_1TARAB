--Creating database
CREATE DATABASE PraktikabaasSamrjakov;
--Using database
USE PraktikabaasSamrjakov;


--Creating 3 tables
--Table Firma
CREATE TABLE Firma(
    FirmaID INT NOT NULL PRIMARY KEY identity(1,1),
    FirmaNimi VARCHAR(20),
    Aadress VARCHAR(20),
    Telefon VARCHAR(20)
);

--Inserting data into table Firma
INSERT INTO Firma(FirmaNimi, Aadress, Telefon)
VALUES ('Nordic Tech', 'Väike-Karja 12', '+3726123456'),
('Baltic Logist', 'Sadama 45', '+3726237890'),
('Green Energy', 'Tartu mnt 8', '+3726341122'),
('Skyline Const', 'Pärnu mnt 27', '+3726453344'),
('Digital Future', 'Narva mnt 19', '+3726567788');

--Checking table Firma
SELECT * FROM Firma;

--Table PraktikaJuhendaja
CREATE TABLE PraktikaJuhendaja(
	PraktikaJuhendajaID INT NOT NULL PRIMARY KEY identity(1,1),
	Eesnimi VARCHAR(20),
	PerekonnaNimi VARCHAR(30),
	Synniaeg DATE,
	Telefon VARCHAR(20)
);

--Inserting data into table PraktikaJuhendaja
INSERT INTO PraktikaJuhendaja(Eesnimi, PerekonnaNimi, Synniaeg, Telefon)
VALUES ('Karl', 'Tamm', '1985-04-12', '+3725001122'),
('Mari', 'Kask', '1990-09-23', '+3725002233'),
('Jaan', 'Saar', '1978-01-30', '+3725003344'),
('Liis', 'Mets', '1995-07-15', '+3725004455'),
('Toomas', 'Põld', '1982-11-05', '+3725005566');

--Checking table PraktikaJuhendaja
SELECT * FROM PraktikaJuhendaja;

--Table Praktikabaas
CREATE TABLE Praktikabaas(
    PraktikabaasID INT NOT NULL PRIMARY KEY identity(1,1),
    FirmaID INT,
    Praktikatingimused VARCHAR(20),
    Arvutiprogramm VARCHAR(20),
    JuhendajaID INT,
    FOREIGN KEY (FirmaID) REFERENCES Firma(FirmaID),
    FOREIGN KEY (JuhendajaID) REFERENCES PraktikaJuhendaja(PraktikaJuhendajaID)
);

--Inserting data into table Praktikabaas
INSERT INTO Praktikabaas(FirmaID, Praktikatingimused, Arvutiprogramm, JuhendajaID)
VALUES (1, 'Kontoritöö', 'MS Excel', 1),
(2, 'Paindlik graafik', 'AutoCAD', 2),
(3, 'Kaugtöö', 'Python', 3),
(4, 'Täistööaeg', 'Java', 4),
(5, 'Osaline aeg', 'Photoshop', 5);

--Checking table Praktikabaas
SELECT * FROM Praktikabaas;

--Checking all tables at once
SELECT * FROM Firma;
SELECT * FROM PraktikaJuhendaja;
SELECT * FROM Praktikabaas;

--SELECT Tasks
--Task 1
SELECT * FROM Firma
WHERE FirmaNimi LIKE '%a%';

--Task 2
SELECT * FROM Praktikabaas, Firma
WHERE Firma.FirmaID = Praktikabaas.FirmaID
ORDER BY FirmaNimi;

--Task 3
SELECT FirmaNimi, COUNT(PraktikabaasID) AS Kogus
FROM Praktikabaas, Firma
WHERE Firma.FirmaID = Praktikabaas.FirmaID
GROUP BY FirmaNimi;

--Task 4
--Variant 1:
SELECT * FROM PraktikaJuhendaja
WHERE MONTH(Synniaeg) = 9 
   OR MONTH(Synniaeg) = 10 
   OR MONTH(Synniaeg) = 11;

--Variant 2:
SELECT * FROM PraktikaJuhendaja
WHERE MONTH(Synniaeg) IN (9, 10, 11);

--5.
--Task 1
SELECT Eesnimi, COUNT(PraktikabaasID) AS Kogus
FROM Praktikabaas, PraktikaJuhendaja
WHERE PraktikaJuhendaja.PraktikaJuhendajaID = Praktikabaas.FirmaID
GROUP BY Eesnimi;

--Task 2
ALTER TABLE PraktikaJuhendaja ADD Palk DECIMAL(7,2);

--Checking if new column was added
SELECT * FROM PraktikaJuhendaja;

--Updating data / inserting values into column Palk
UPDATE PraktikaJuhendaja SET Palk = 1800.00 WHERE PraktikaJuhendajaID = 1;
UPDATE PraktikaJuhendaja SET Palk = 2000.00 WHERE PraktikaJuhendajaID = 2;
UPDATE PraktikaJuhendaja SET Palk = 1700.00 WHERE PraktikaJuhendajaID = 3;
UPDATE PraktikaJuhendaja SET Palk = 2100.00 WHERE PraktikaJuhendajaID = 4;
UPDATE PraktikaJuhendaja SET Palk = 1900.00 WHERE PraktikaJuhendajaID = 5;

--Checking table PraktikaJuhendaja again
SELECT * FROM PraktikaJuhendaja;

--Task 3
--Finding the average salary
SELECT AVG(Palk) AS KeskminePalk FROM PraktikaJuhendaja;

--Finding the total salary
SELECT SUM(Palk) AS KoguPalk FROM PraktikaJuhendaja;

--Task 4
--Finding people with Palk 2000 or higher
SELECT Eesnimi, Palk FROM PraktikaJuhendaja
WHERE Palk >= 2000;

--6.
--Creating VIEW for Task 3 from SELECT Tasks
CREATE VIEW FirmaPraktikad AS
SELECT FirmaNimi, COUNT(PraktikabaasID) AS Kogus
FROM Praktikabaas
JOIN Firma ON Firma.FirmaID = Praktikabaas.FirmaID
GROUP BY FirmaNimi;

--Checking this VIEW
SELECT * FROM FirmaPraktikad;

--Creating VIEW for Task 4 from SELECT Tasks
CREATE VIEW SugiselSundinud AS
SELECT *
FROM PraktikaJuhendaja
WHERE MONTH(Synniaeg) IN (9, 10, 11);
--Checking this VIEW
SELECT * FROM SugiselSundinud;

--Creating a Procedure
CREATE PROCEDURE UusFirma
AS
BEGIN
    --Adding a new record to Firma
    INSERT INTO Firma (FirmaNimi, Aadress, Telefon)
    VALUES ('Uus Firma', 'Uus Aadress 1', '+3725006677');
END;
--Calling the procedure
EXEC UusFirma;

CREATE PROCEDURE UusVeeru
AS
BEGIN
	ALTER TABLE Firma
    ADD EPost VARCHAR(50);
END;

EXEC UusVeeru;

CREATE PROCEDURE KeskminePalk
AS
BEGIN
    --Calculating the average salary of PraktikaJuhendaja
    SELECT AVG(Palk) AS KeskminePalk
    FROM PraktikaJuhendaja;
END;

EXEC KeskminePalk;

--Checking table Firma
SELECT * FROM Firma;

--8.
create function fnComputeAge(@DOB datetime)
returns nvarchar(50)
as begin
    declare @tempdate datetime, @years int, @months int, @days int
        select @tempdate = @DOB
 
        select @years = datediff(year, @tempdate, getdate()) - case when (month(@DOB) > month(GETDATE())) or (MONTH(@DOB)
        = month (getdate()) and day(@DOB) > DAY(getdate())) then 1 else 0 end
        select @tempdate = dateadd(year, @years, @tempdate)
 
        select @months = datediff(month, @tempdate, getdate()) - case when day(@DOB) > day(getdate()) then 1 else 0 end
        select @tempdate = dateadd(MONTH, @months, @tempdate)
 
        select @days = datediff(day, @tempdate, getdate())
 
    declare @Age nvarchar(50)
        set @Age = cast(@years as nvarchar(4)) + ' Years ' + cast(@months as nvarchar(2)) + 
        ' Months ' + cast(@days as nvarchar(2)) + ' Days old'
    return @Age
end

create function dbo.CalculateAge(@DOB date)
returns int
as begin
declare @Age int
 
set @Age = DATEDIFF(YEAR, @DOB, GETDATE()) -
    case
        when (MONTH(@DOB) > MONTH(getdate())) or
             (MONTH(@DOB) > MONTH(GETDATE()) and DAY(@DOB) > day(GETDATE()))
        then 1
        else 0
        end
    return @Age
end

select PraktikaJuhendajaID, Eesnimi, Synniaeg, dbo.fnComputeAge(Synniaeg) 
as Vanus from PraktikaJuhendaja;

select PraktikaJuhendajaID, dbo.CalculateAge(Synniaeg) as Vanus from PraktikaJuhendaja
where dbo.CalculateAge(Synniaeg) > 40;

ALTER TABLE Firma
DROP COLUMN EPost;

SELECT * FROM Firma;

DELETE FROM Firma
WHERE FirmaID = 7;

DROP PROCEDURE ManageFirmaAndJuhendaja;

CREATE Procedure MuudaTabeli
@Tegevus varchar(15),
@TabeliNimi varchar(15),
@VeeruNimi varchar(15),
@Andmetyyp varchar(15) = null --Null = 0 if data type isn't declared
AS
Begin
	DECLARE @SQLTegevus AS varchar (max)
	SET @SQLTegevus = Case
		When @Tegevus = 'Add' then
		concat('ALTER TABLE ', @TabeliNimi, ' ADD ', @VeeruNimi, ' ', @Andmetyyp)
		When @Tegevus = 'Drop' then
		concat('ALTER TABLE ', @TabeliNimi, ' DROP COLUMN ', @VeeruNimi)
	END;

print @SQLTegevus;

Begin
EXEC(@SQLTegevus);
END;
END;

EXEC MuudaTabeli 'Add', 'Firma', 'Test', 'INT';

SELECT * FROM Firma;