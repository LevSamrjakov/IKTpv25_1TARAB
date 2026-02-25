--Creating database
CREATE DATABASE Samrjakov;
use Samrjakov;

--Creating table
CREATE TABLE Kasutaja(
KasutajaID int primary key identity(1,1), --Identity(1,1) auto-fills KasutajaID
KasutajaNimi varchar(15) not null, --Not null means that KasutajaNimi must be filled.
EPost varchar(30),
Parool char(10) not null);

Select * From Kasutaja;

--Inserting values inside KasutajaNimi and Parool
Insert into Kasutaja(KasutajaNimi, Parool)
Values ('Lev', 'LevParool');

--Tabel editing and creating new column
ALTER TABLE Kasutaja ADD Elukoht varchar(20);

--Updating Elukoht
UPDATE Kasutaja SET Elukoht = 'Tallinn';

--Tabel column deleting
ALTER TABLE Kasutaja DROP COLUMN Elukoht;

Select * From Kasutaja;

--Changing a column's data type
ALTER TABLE Kasutaja ALTER COLUMN Parool varchar(50);

Insert into Kasutaja(KasutajaNimi, Parool)
Values ('Konstantin', 'KonstantinParool123456789');

--Table editing procedure (Add & Drop)
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
--Procedure call
EXEC MuudaTabeli @Tegevus='Add', @TabeliNimi='Kasutaja', @VeeruNimi='Test', @Andmetyyp=int;

Select * From Kasutaja;

--Procedure call 2 (Deletion)
EXEC MuudaTabeli @Tegevus='Drop', @TabeliNimi='Kasutaja', @VeeruNimi='Test';
