--Creating database
CREATE DATABASE WebMarketSamrjakov;
USE WebMarketSamrjakov;

--Categories
CREATE TABLE Categories(
CategoryID int PRIMARY KEY identity(1,1),
CategoryName varchar(30) unique);

INSERT INTO Categories(CategoryName)
VALUES ('PCs'), --ID1
('Consoles'), --ID2
('Phones'), --ID3
('Laptops'), --ID4
('Virtual Reality'); --ID5

--Brands
CREATE TABLE Brands(
BrandID int PRIMARY KEY identity(1,1),
BrandName varchar(30) unique);

INSERT INTO Brands(BrandName)
VALUES ('Framework'), --ID1
('Apple'), --ID2
('Sony'), --ID3
('Microsoft'), --ID4
('Samsung'); --ID5

--Products
CREATE TABLE Products(
ProductID int PRIMARY KEY identity(1,1),
ProductName varchar(50) NOT NULL,
BrandID int,
FOREIGN KEY (BrandID) references Brands(BrandID),
CategoryID int,
FOREIGN KEY (CategoryID) references Categories(CategoryID),
ModelYear int,
PriceList decimal(7,2));

INSERT INTO Products(ProductName, BrandID, CategoryID, ModelYear, PriceList)
VALUES ('Framework Desktop', '1', '1', '2025', '1600'), --ID1
('Mac Studio', '2', '1', '2025', '2000'), --ID2
('PlayStation 5', '3', '2', '2020', '500' ), --ID3
('Xbox Series X', '4', '2', '2020', '650'), --ID4
('iPhone 15', '2', '3', '2023', '800'), --ID5
('Samsung Galaxy S25', '5', '3', '2025', '1200'), --ID6
('Framework Laptop 13', '1', '4', '2024', '1100'), --ID7
('MacBook Air (M3)', '2', '4', '2025', '1050'), --ID8
('PlayStation VR2', '3', '5', '2023', '550'), --ID9
('Samsung Galaxy XR', '5', '5', '2025', '1800'); --ID10

SELECT * FROM Categories;
SELECT * FROM Brands;
Select * From Products;

--Procedure which uses INSERT to add data inside a table brand.
CREATE PROCEDURE LisaBrand
@BrandName varchar(30)
as
BEGIN
INSERT INTO Brands(BrandName) VALUES (@BrandName);
SELECT * FROM Brands;
END;
--Procedure activation
EXEC LisaBrand 'Nintendo';

CREATE PROCEDURE DataDelete
@id int
as
Begin
DELETE FROM Brands WHERE BrandID = @id
End;
--Deletion
EXEC DataDelete 6;
SELECT * FROM Brands;

--First letter search
CREATE PROCEDURE FirstLetterSearch
@Taht char(1)
as
BEGIN
SELECT * FROM Brands WHERE BrandName LIKE @Taht+'%';
END

EXEC FirstLetterSearch 'A';

--Procude that updates tables
CREATE PROCEDURE NewBrand
@ID int,
@NewBrandName varchar(50)
AS
BEGIN
UPDATE Brands SET BrandName = @NewBrandName
WHERE BrandID = @ID;
END;
--Call
EXEC NewBrand 4, 'Oculus';
SELECT * FROM Brands;
