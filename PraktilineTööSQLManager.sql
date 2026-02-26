CREATE DATABASE LevIKTpv25;
USE LevIKTpv25;

CREATE TABLE City(
ID int NOT NULL,
CityName varchar(30));

CREATE TABLE Country(
ID int NOT NULL PRIMARY KEY identity(1,1),
CountryName varchar(30),
Capital int);

SELECT * FROM City;

--PK lisamine
ALTER TABLE City
ADD CONSTRAINT pk_ID PRIMARY KEY(ID);

--Unique lisamine
ALTER TABLE City
ADD CONSTRAINT CityName_unique UNIQUE(CityName);

--Andmete lisamine
INSERT INTO City(ID, CityName)
VALUES (2, 'Tartu');

--FK lisamine
ALTER TABLE Country
ADD CONSTRAINT fk_City FOREIGN KEY(Capital)
REFERENCES City(ID);

INSERT INTO Country(CountryName, Capital)
VALUES ('Eesti', 1);

SELECT * FROM Country;
Select * From City;

--Näitab süsteem'me info tabelist
EXEC sp_help Country;

--Praktiline Töö
--Creating "Category" table
CREATE TABLE Category(
CategoryID int PRIMARY KEY identity(1,1),
CategoryName varchar(30));

--Inserting data into "Category" table
INSERT INTO Category(CategoryName)
VALUES ('Handguns'),
('Rifles'),
('Shotguns'),
('Machine Guns'),
('Heavy Weapons');

--Checking "Category" table
Select * From Category;

--Creating "Product" table
--Typing "Product" made it glow pink, had to use 0 instead of o.
CREATE TABLE Pr0duct(
ProductID int PRIMARY KEY identity(1,1),
ProductName varchar(30),
CategoryID int,
FOREIGN KEY (CategoryID) references Category(CategoryID), --Referencing "CategoryID" from "Category" table
Price decimal(7,2));

--Inserting data into "Pr0duct" table
INSERT INTO Pr0duct(ProductName, CategoryID, Price)
VALUES ('M1911', '1', '525'),
('Lebel M1886', '2', '850'),
('M16', '2', '1050'),
('M60', '4', '2200'),
('Browning Auto-5', '3', '1150');

Select * From Pr0duct; --Checking "Pr0duct" table

--Creating "Customer" table
CREATE TABLE Customer(
CustomerID int PRIMARY KEY identity(1,1),
CustomerName varchar(30),
Contact varchar(30));

INSERT INTO Customer(CustomerName, Contact)
VALUES ('Royal Nation', 'royal.nation@gmail.com'),
('John Rook', 'john.rook@gmail.com'),
('Golden Empire', 'golden.empire@gmail.com'),
('John Rambo', 'john.rambo@gmail.com'),
('NCR Trooper', 'ncr.trooper@gmail.com');

Select * From Customer; --Checking "Customer" table

--Creating "Sales" table
CREATE TABLE Sales(
SaleID int PRIMARY KEY identity(1,1),
ProductID int
FOREIGN KEY (ProductID) references Pr0duct(ProductID), --Referencing "ProductID" from "Pr0duct" table
CustomerID int
FOREIGN KEY (CustomerID) references Customer(CustomerID),
C0unt int, --Typing "Count" made it glow pink, had to use 0 instead of o.
DateOfSale date);

--Inserting data into "Sales" table
INSERT INTO Sales(ProductID, CustomerID, C0unt, DateOfSale)
VALUES ('2', '1', '7', '2026-02-22'),
('1', '2', '1', '2026-02-20'),
('5', '3', '2', '2026-02-17'),
('4', '4', '1', '2026-02-09'),
('3', '5', '3', '2026-02-21');

Select * From Sales;

--Checking all tables
Select * From Category;
Select * From Pr0duct;
Select * From Sales;
Select * From Customer;
