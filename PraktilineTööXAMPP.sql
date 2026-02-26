-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 26, 2026 kell 03:37 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `samrjakovpraktilinetöö`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Handguns'),
(2, 'Rifles'),
(3, 'Shotguns'),
(4, 'Machine Guns'),
(5, 'Heavy Weapons');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(30) DEFAULT NULL,
  `Contact` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `Contact`) VALUES
(1, 'Royal Nation', 'royal.nation@gmail.com'),
(2, 'John Rook', 'john.rook@gmail.com'),
(3, 'Golden Empire', 'golden.empire@gmail.com'),
(4, 'John Rambo', 'john.rambo@gmail.com'),
(5, 'NCR Trooper', 'ncr.trooper@gmail.com');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pr0duct`
--

CREATE TABLE `pr0duct` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(30) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Price` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `pr0duct`
--

INSERT INTO `pr0duct` (`ProductID`, `ProductName`, `CategoryID`, `Price`) VALUES
(1, 'M1911', 1, 525.00),
(2, 'Lebel M1886', 2, 850.00),
(3, 'M16', 2, 1050.00),
(4, 'M60', 4, 2200.00),
(5, 'Browning Auto-5', 3, 1150.00);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `sales`
--

CREATE TABLE `sales` (
  `SaleID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `C0unt` int(11) DEFAULT NULL,
  `DateOfSale` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `sales`
--

INSERT INTO `sales` (`SaleID`, `ProductID`, `CustomerID`, `C0unt`, `DateOfSale`) VALUES
(1, 2, 1, 7, '2026-02-22'),
(2, 1, 2, 1, '2026-02-20'),
(3, 5, 3, 2, '2026-02-17'),
(4, 4, 4, 1, '2026-02-09'),
(5, 3, 5, 3, '2026-02-21');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indeksid tabelile `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indeksid tabelile `pr0duct`
--
ALTER TABLE `pr0duct`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indeksid tabelile `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SaleID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `fk_customer` (`CustomerID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `pr0duct`
--
ALTER TABLE `pr0duct`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `sales`
--
ALTER TABLE `sales`
  MODIFY `SaleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `pr0duct`
--
ALTER TABLE `pr0duct`
  ADD CONSTRAINT `pr0duct_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`);

--
-- Piirangud tabelile `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `pr0duct` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
