-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Märts 26, 2026 kell 02:36 PL
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
-- Andmebaas: `praktikabaassamrjakov`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `firma`
--

CREATE TABLE `firma` (
  `firmaID` int(11) NOT NULL,
  `firmanimi` varchar(20) DEFAULT NULL,
  `aadress` varchar(20) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `EPost` varchar(50) DEFAULT NULL,
  `Test` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `firma`
--

INSERT INTO `firma` (`firmaID`, `firmanimi`, `aadress`, `telefon`, `EPost`, `Test`) VALUES
(1, 'Nordic Tech', 'Väike-Karja 12', '+3726123456', NULL, NULL),
(2, 'Baltic Logist', 'Sadama 45', '+3726237890', NULL, NULL),
(3, 'Green Energy', 'Tartu mnt 8', '+3726341122', NULL, NULL),
(4, 'Skyline Const', 'Pärnu mnt 27', '+3726453344', NULL, NULL),
(5, 'Digital Future', 'Narva mnt 19', '+3726567788', NULL, NULL),
(6, 'Uus Firma', 'Uus Aadress 1', '+3725006677', NULL, NULL);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`firmaID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `firma`
--
ALTER TABLE `firma`
  MODIFY `firmaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
