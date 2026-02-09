CREATE DATABASE WebMarketSamrjakov;
USE WebMarketSamrjakov;

--Categories Table
CREATE TABLE Categories(
CategoryID int PRIMARY KEY identity(1,1),
CategoryName varchar(30) unique);

INSERT INTO Categories(CategoryName)
VALUES ('Consoles'),
('Phones'),
('Laptops'),
('Virtual Reality'),
('PCs');
--DROP TABLE Categories;
SELECT * FROM Categories;

--Products Table
CREATE TABLE Products(
ProductID int PRIMARY KEY identity(1,1),
ProductName varchar(50) NOT NULL,
BrandID int,
CategoryID int,
FOREIGN KEY (CategoryID) references Categories(CategoryID),
ModelYear int,
PriceList decimal(7,2));
SELECT * FROM Products;
--DROP TABLE Products;
INSERT INTO Products(ProductName, BrandID, CategoryID, ModelYear, PriceList)
VALUES ('Xbox Series X', '1', '1', '2020', '500'),
('Xbox Series S', '1', '1', '2020', '400'),
('Nintendo Switch', '2', '2', '2017', '300'),
('Nintendo Switch 2', '2', '2', '2025', '450'),
('Steam Deck', '4', '2', '2022', '450'),
('Meta Quest 3', '1', '4', '2023', '300'),
('Meta Quest 3S', '1', '4', '2024', '450'),
('Lenovo Legion Y520', '1', '2', '2017', '1100')
--Brands Table
CREATE TABLE Brands(
BrandID int PRIMARY KEY identity (1,1),
BrandName varchar(30) unique);

INSERT INTO Brands(BrandName)
VALUES ('Xbox'), ('Nintendo'), ('Sony'),
('Valve'), ('Android'), ('Iphone'),
('Lenovo'), ('Meta Quest'), ('Oculus');


ALTER TABLE Products ADD CONSTRAINT fk_Brand
FOREIGN KEY (BrandID) references Brands(BrandID);
SELECT * FROM Brands;
--DROP TABLE Brands;

--Stocks Table -- Two Primary Keys
CREATE TABLE Stocks(
StoreID int,
ProductID int,
Quantity int,
PRIMARY KEY (StoreID, ProductID),
FOREIGN KEY (ProductID) references Products(ProductID)
);
SELECT * FROM Stocks;
--DROP TABLE Stocks;

SELECT * FROM Products;
SELECT * FROM Stocks;

--ItemOrders Table
CREATE TABLE ItemOrders(
ItemID int Primary Key identity(1,1),
OrderID int FOREIGN KEY
