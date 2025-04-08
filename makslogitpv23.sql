-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 08, 2025 kell 01:40 PL
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
-- Andmebaas: `makslogitpv23`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `auto`
--

CREATE TABLE `auto` (
  `autoID` int(11) NOT NULL,
  `autonr` varchar(7) DEFAULT NULL,
  `mudell` varchar(50) DEFAULT NULL,
  `mark` varchar(50) DEFAULT NULL,
  `vaast` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `auto`
--

INSERT INTO `auto` (`autoID`, `autonr`, `mudell`, `mark`, `vaast`) VALUES
(1, 'aaa111', 'corolla', 'toyota', '2008-1-1');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `elukoht`
--

CREATE TABLE `elukoht` (
  `elukohtID` int(11) NOT NULL,
  `elukoht` varchar(50) DEFAULT NULL,
  `maakond` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `elukoht`
--

INSERT INTO `elukoht` (`elukohtID`, `elukoht`, `maakond`) VALUES
(1, 'tallinn', 'harjumaa'),
(2, 'tartu', 'tartumaa'),
(3, 'parnu', 'parnumaa');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `inimene`
--

CREATE TABLE `inimene` (
  `inimeneID` int(11) NOT NULL,
  `nimi` varchar(50) DEFAULT NULL,
  `synniaeg` date DEFAULT NULL,
  `telefon` char(12) DEFAULT NULL,
  `pikkus` decimal(5,2) DEFAULT NULL,
  `opilaskodu` bit(1) DEFAULT NULL,
  `elukohtID` int(11) DEFAULT NULL,
  `autoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `inimene`
--

INSERT INTO `inimene` (`inimeneID`, `nimi`, `synniaeg`, `telefon`, `pikkus`, `opilaskodu`, `elukohtID`, `autoID`) VALUES
(1, 'amx', '2007-12-30', '09876543', 190.75, b'0', NULL, NULL),
(2, 'gosha', '1999-12-30', '1234577', 170.65, b'0', NULL, NULL),
(3, 'valera', '2009-12-30', '35487634', 555.55, b'0', NULL, NULL),
(4, 'peter', '2000-12-30', '0284645', 123.33, b'0', NULL, NULL),
(5, 'ssl', '2001-12-30', '091236543', 10.00, b'0', 1, 1);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`autoID`),
  ADD UNIQUE KEY `autonr` (`autonr`);

--
-- Indeksid tabelile `elukoht`
--
ALTER TABLE `elukoht`
  ADD PRIMARY KEY (`elukohtID`),
  ADD UNIQUE KEY `elukoht` (`elukoht`);

--
-- Indeksid tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD PRIMARY KEY (`inimeneID`),
  ADD UNIQUE KEY `nimi` (`nimi`),
  ADD KEY `fk_elukoht` (`elukohtID`),
  ADD KEY `fk_auto` (`autoID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `auto`
--
ALTER TABLE `auto`
  MODIFY `autoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `elukoht`
--
ALTER TABLE `elukoht`
  MODIFY `elukohtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT tabelile `inimene`
--
ALTER TABLE `inimene`
  MODIFY `inimeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD CONSTRAINT `fk_auto` FOREIGN KEY (`autoID`) REFERENCES `auto` (`autoID`),
  ADD CONSTRAINT `fk_elukoht` FOREIGN KEY (`elukohtID`) REFERENCES `elukoht` (`elukohtID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
