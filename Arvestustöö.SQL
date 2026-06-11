--Loomine uus andmebaas
CREATE DATABASE ArvestustööSamrjakov;

-- Kasutamine meie uus andmebaas
USE ArvestustööSamrjakov;

--Ülesanne 1 - Loo järgmised tabelid SQL päringute abil
--Võistlus
CREATE TABLE Võistlus(
VõistlusID INT PRIMARY KEY IDENTITY(1,1),
VõistlusNimi VARCHAR(100),
OsalejateArv INT,
TurniirID INT);

--Turniir
CREATE TABLE Turniir(
TurniirID INT PRIMARY KEY IDENTITY(1,1),
TurniirNimi VARCHAR(100));

--Osaleja
CREATE TABLE Osaleja(
OsalejaID INT PRIMARY KEY IDENTITY(1,1),
OsalejaNimi VARCHAR(50),
VõistlusID INT);

--Ülesanne 2 - Seosta tabelid omavahel võõr võtmete abil
--Võistlus seostub Turniiriga läbi TurniirID
ALTER TABLE Võistlus ADD CONSTRAINT fk_VõistlusTurniir
FOREIGN KEY (TurniirID) REFERENCES Turniir(TurniirID);

--Osaleja seostub Võistlusega läbi VõistlusID
ALTER TABLE Osaleja ADD CONSTRAINT fk_OsalejaVõistlus
FOREIGN KEY (VõistlusID) REFERENCES Võistlus(VõistlusID);

--Ülesanne 3 - Loo kasutaja nimega õpilaneNimi, kelle õigused on lisada ja vaadata andmeid
--tabelites Võistlus, Turniir ja Osaleja. Kirjuta selleks vajalikud SQL päringud.

--Uus login õpilaneNimi luuakse Security külgmenüüs (Security -> Logins -> New Login)

--Uus user õpilaneNimi luuakse see päringu külgmenüüs. (ArvestustööSamrjakov -> Security -> Users -> New User)

--Andmine ainult INSERT ja SELECT õigused õpilaneNimi kasutajate
GRANT SELECT, INSERT ON Võistlus TO õpilaneNimi;

GRANT SELECT, INSERT ON Turniir TO õpilaneNimi;

GRANT SELECT, INSERT ON Osaleja TO õpilaneNimi;

--Ülesanne 4 - Koosta tabel logi, kus jälgitakse kasutajate toiminguid
CREATE TABLE Logi(
ID INT PRIMARY KEY IDENTITY(1,1),
Kuupäev DATETIME,
Tegevus VARCHAR(50),
Andmed TEXT,
Kasutaja VARCHAR(100));

--Ülesanne 5 - Loo trigger, mis jälgib andmete kustutamist tabelis Võistlus ja logib selle tegevuse tabelisse Logi
CREATE TRIGGER VõistlusKustuta
ON Võistlus
FOR DELETE
AS
INSERT INTO Logi(Kuupäev, Tegevus, Andmed, Kasutaja)
SELECT
GETDATE(),
'DELETE',
CONCAT('VõistlusID: ', deleted.VõistlusID, ', Võistluse Nimi: ', deleted.VõistlusNimi, ', Osalejate Arv: ', deleted.OsalejateArv),
SYSTEM_USER
FROM deleted;

--Ülesanne 6 - Loo trigger, mis jälgib andmete lisamist tabelis Võistlus ja logib selle tegevuse tabelisse Logi
CREATE TRIGGER VõistlusLisa
ON Võistlus
FOR INSERT
AS
INSERT INTO Logi(Kuupäev, Tegevus, Andmed, Kasutaja)
SELECT
GETDATE(),
'INSERT',
CONCAT('VõistlusID: ', inserted.VõistlusID, ', Võistluse Nimi: ', inserted.VõistlusNimi, ', Osalejate Arv: ', inserted.OsalejateArv),
SYSTEM_USER
FROM inserted;

--Ülesanne 7 - Arvesta, et tabelis Logi salvetatakse automaatselt kasutajanimi, kuupäev, kellaaeg ja vastavad andmed tabelitest Võistlus, Turniir ja Osaleja

--Ei saanud ülesandest aru

--Ülesanne 8 - Kontrolli triggerite tööd, tehes näited andmete lisamisest ja kustutamisest tabelis Võistlus
INSERT INTO Võistlus(VõistlusNimi, OsalejateArv)
VALUES('Entente cordiale', 16),
('TORNEAZZO', 7),
('King of the Colosseum 2025', 16),
('Kadena crusade league', 32);

--Ülesanne 9 - Kontrolli et sisselogitud kasutajal ei ole õigust muuta tabelite sisu või luua uusi tabeleid väljaspool lubatud tegevusi

--Tehtud

--Ülesanne 10 - Loo protseduur, mis kuvab kõik võistlusrühmad, mis on seotud kindla turniiriga (parameetrina sisestatud turniiri nime järgi)

CREATE PROCEDURE KuvaVõistlusrühmad
@TurniirNimi VARCHAR(100)
AS
BEGIN
SELECT V.VõistlusID, V.VõistlusNimi, V.OsalejateArv, T.TurniirNimi
FROM Võistlus V INNER JOIN Turniir T
ON V.TurniirID = T.TurniirID
WHERE T.TurniirNimi = @TurniirNimi;
END;

--Kontrolli et see protseduur töötab
INSERT INTO Turniir(TurniirNimi)
VALUES('Warhammer 40k');

EXEC KuvaVõistlusrühmad 'Warhammer 40k';

--Ülesanne 13 - Lisa oma andmebaasi tegevus

--Lisame UPDATE trigger ja andmine UPDATE õigused õpilaneNimi kasutajale

--UPDATE trigger
CREATE TRIGGER VõistlusUuenda
ON Võistlus
FOR UPDATE
AS INSERT INTO Logi(Kuupäev, Tegevus, Andmed, Kasutaja)
SELECT
GETDATE(),
'UPDATE',
CONCAT('Vana andmed: ', 'VõistlusID: ', D.VõistlusID, ', Võistluse Nimi: ', D.VõistlusNimi, ', Osalejate Arv: ', D.OsalejateArv,
' | Uus andmed: ', 'VõistlusID: ', I.VõistlusID, ', Võistluse Nimi: ', I.VõistlusNimi, ', Osalejate Arv: ', I.OsalejateArv),
SYSTEM_USER
FROM deleted D INNER JOIN inserted I
ON D.VõistlusID = I.VõistlusID;

--Andmine UPDATE õigused
GRANT UPDATE ON Võistlus TO õpilaneNimi;

--Kontrolli UPDATE trigger
UPDATE Võistlus SET TurniirID = 1 WHERE VõistlusID = 12;

SELECT * FROM Logi;
