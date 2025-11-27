-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 27. lis 2025, 09:17
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `plavani_vitekit3`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `disciplina`
--

CREATE TABLE `disciplina` (
  `disciplina_id` int(11) NOT NULL,
  `nazev` varchar(100) NOT NULL,
  `delka` int(11) NOT NULL,
  `styl` enum('volný způsob','prsa','motýl','znak','polohový závod') NOT NULL,
  `pohlavi` enum('M','Z') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `disciplina`
--

INSERT INTO `disciplina` (`disciplina_id`, `nazev`, `delka`, `styl`, `pohlavi`) VALUES
(1, '100 m volný způsob', 100, 'volný způsob', 'M'),
(2, '100 M Motýl', 100, 'motýl', 'M'),
(3, '100 m prsa', 100, 'prsa', 'Z'),
(4, '50 m znak', 50, 'znak', 'M'),
(5, '200 m volný způsob', 200, 'volný způsob', 'M');

-- --------------------------------------------------------

--
-- Struktura tabulky `discipliny_zavodu`
--

CREATE TABLE `discipliny_zavodu` (
  `discipliny_zavodu_id` int(11) NOT NULL,
  `disciplina_id` int(11) NOT NULL,
  `zavod_id` int(11) NOT NULL,
  `zacatek` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `discipliny_zavodu`
--

INSERT INTO `discipliny_zavodu` (`discipliny_zavodu_id`, `disciplina_id`, `zavod_id`, `zacatek`) VALUES
(4, 1, 1, '13:30:00'),
(7, 2, 2, '17:25:00'),
(8, 4, 4, '10:30:00'),
(9, 5, 5, '16:30:00'),
(10, 3, 3, '14:00:00');

-- --------------------------------------------------------

--
-- Struktura tabulky `klub`
--

CREATE TABLE `klub` (
  `klub_id` int(11) NOT NULL,
  `nazev` varchar(100) NOT NULL,
  `mesto_id` int(11) NOT NULL,
  `datum_zalozeni` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `klub`
--

INSERT INTO `klub` (`klub_id`, `nazev`, `mesto_id`, `datum_zalozeni`) VALUES
(1, 'SK Neptune Praha', 1, '1998-05-12'),
(2, 'Berlin Sharks', 3, '2001-03-10'),
(3, 'Swimming Club', 6, '2009-11-19'),
(4, 'Svišti', 5, '2015-07-15'),
(5, 'BOBER ', 4, '2007-02-14');

-- --------------------------------------------------------

--
-- Struktura tabulky `mesto`
--

CREATE TABLE `mesto` (
  `mesto_id` int(11) NOT NULL,
  `nazev` varchar(100) NOT NULL,
  `symbol` blob DEFAULT NULL,
  `stat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `mesto`
--

INSERT INTO `mesto` (`mesto_id`, `nazev`, `symbol`, `stat_id`) VALUES
(1, 'Praha', '', 1),
(3, 'Berlin', NULL, 4),
(4, 'Warsaw', NULL, 3),
(5, 'Bratislava', NULL, 2),
(6, 'Kyiv', NULL, 6);

-- --------------------------------------------------------

--
-- Struktura tabulky `plavec`
--

CREATE TABLE `plavec` (
  `plavec_id` int(11) NOT NULL,
  `jmeno` varchar(100) NOT NULL,
  `prijmeni` varchar(100) NOT NULL,
  `rocnik` year(4) NOT NULL,
  `vaha` decimal(5,2) DEFAULT NULL,
  `vyska` decimal(5,2) DEFAULT NULL,
  `pohlavi` enum('M','Z') NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `klub_id` int(11) NOT NULL,
  `stat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `plavec`
--

INSERT INTO `plavec` (`plavec_id`, `jmeno`, `prijmeni`, `rocnik`, `vaha`, `vyska`, `pohlavi`, `foto`, `klub_id`, `stat_id`) VALUES
(1, 'Jan', 'Novák', '2006', 75.20, 182.40, 'M', '', 1, 1),
(2, 'Petr', 'Svoboda', '2005', 78.00, 185.00, 'M', '', 1, 1),
(3, 'Lukáš', 'Hrbý', '2007', 70.50, 176.30, 'M', '', 4, 2),
(4, 'Bolek', 'Kowalski', '2007', 90.00, 189.00, 'M', 'foto', 0, 3),
(6, 'Jurij', 'Ševčenko', '2002', 65.00, 159.00, 'M', NULL, 3, 6);

-- --------------------------------------------------------

--
-- Struktura tabulky `stat`
--

CREATE TABLE `stat` (
  `stat_id` int(11) NOT NULL,
  `nazev` varchar(4) NOT NULL,
  `hymna` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `stat`
--

INSERT INTO `stat` (`stat_id`, `nazev`, `hymna`) VALUES
(1, 'CZE', 'Kde domov můj'),
(2, 'SVK', 'Nad Tatrou sa blýska'),
(3, 'POL', ''),
(4, 'GER', ''),
(6, 'UKR', NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `vysledek`
--

CREATE TABLE `vysledek` (
  `vysledek_id` int(11) NOT NULL,
  `zavod_id` int(11) NOT NULL,
  `plavec_id` int(11) NOT NULL,
  `disciplina_id` int(11) NOT NULL,
  `umisteni` int(11) NOT NULL,
  `body` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `vysledek`
--

INSERT INTO `vysledek` (`vysledek_id`, `zavod_id`, `plavec_id`, `disciplina_id`, `umisteni`, `body`) VALUES
(1, 5, 1, 5, 1, 750.50),
(2, 4, 2, 4, 3, 250.00),
(3, 5, 3, 5, 2, 500.00),
(4, 3, 6, 1, 5, 50.00),
(5, 5, 6, 5, 10, 0.00);

-- --------------------------------------------------------

--
-- Struktura tabulky `zavod`
--

CREATE TABLE `zavod` (
  `zavod_id` int(11) NOT NULL,
  `nazev` varchar(100) NOT NULL,
  `datum` date DEFAULT NULL,
  `cas_zahajeni` time DEFAULT NULL,
  `misto` varchar(20) NOT NULL,
  `bazen` enum('50','25') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `zavod`
--

INSERT INTO `zavod` (`zavod_id`, `nazev`, `datum`, `cas_zahajeni`, `misto`, `bazen`) VALUES
(1, 'MČR juniorů', '2025-11-18', '09:00:00', 'Havířov', '25'),
(2, 'MČR Dorost', '2025-11-12', '12:00:00', 'Opava', '25'),
(3, 'Pražské Stovky', '2025-12-17', '09:00:00', 'Praha', '25'),
(4, 'Plzeňské Padesátky', '2025-10-08', '08:20:00', 'Plzeň', '50'),
(5, 'Krnovské dlouhé tratě', '2025-05-14', '15:00:00', 'Krnov', '25');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`disciplina_id`),
  ADD UNIQUE KEY `styl` (`styl`,`pohlavi`,`delka`) USING BTREE;

--
-- Indexy pro tabulku `discipliny_zavodu`
--
ALTER TABLE `discipliny_zavodu`
  ADD PRIMARY KEY (`discipliny_zavodu_id`),
  ADD UNIQUE KEY `disciplina_id` (`disciplina_id`,`zavod_id`),
  ADD KEY `zavod_id` (`zavod_id`),
  ADD KEY `zacatek` (`zacatek`);

--
-- Indexy pro tabulku `klub`
--
ALTER TABLE `klub`
  ADD PRIMARY KEY (`klub_id`),
  ADD KEY `mesto_id` (`mesto_id`),
  ADD KEY `nazev` (`nazev`);

--
-- Indexy pro tabulku `mesto`
--
ALTER TABLE `mesto`
  ADD PRIMARY KEY (`mesto_id`),
  ADD KEY `stat_id` (`stat_id`),
  ADD KEY `nazev` (`nazev`);

--
-- Indexy pro tabulku `plavec`
--
ALTER TABLE `plavec`
  ADD PRIMARY KEY (`plavec_id`),
  ADD KEY `klub_id` (`klub_id`),
  ADD KEY `stat_id` (`stat_id`),
  ADD KEY `zavodnik` (`jmeno`,`prijmeni`,`rocnik`,`pohlavi`);

--
-- Indexy pro tabulku `stat`
--
ALTER TABLE `stat`
  ADD PRIMARY KEY (`stat_id`),
  ADD KEY `nazev` (`nazev`);

--
-- Indexy pro tabulku `vysledek`
--
ALTER TABLE `vysledek`
  ADD PRIMARY KEY (`vysledek_id`),
  ADD KEY `zavod_id` (`zavod_id`),
  ADD KEY `plavec_id` (`plavec_id`),
  ADD KEY `disciplina_id` (`disciplina_id`),
  ADD KEY `umisteni` (`umisteni`,`body`);

--
-- Indexy pro tabulku `zavod`
--
ALTER TABLE `zavod`
  ADD PRIMARY KEY (`zavod_id`),
  ADD KEY `nazev` (`nazev`,`misto`,`bazen`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `disciplina_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `discipliny_zavodu`
--
ALTER TABLE `discipliny_zavodu`
  MODIFY `discipliny_zavodu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `klub`
--
ALTER TABLE `klub`
  MODIFY `klub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `mesto`
--
ALTER TABLE `mesto`
  MODIFY `mesto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `plavec`
--
ALTER TABLE `plavec`
  MODIFY `plavec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `stat`
--
ALTER TABLE `stat`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `vysledek`
--
ALTER TABLE `vysledek`
  MODIFY `vysledek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `zavod`
--
ALTER TABLE `zavod`
  MODIFY `zavod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `discipliny_zavodu`
--
ALTER TABLE `discipliny_zavodu`
  ADD CONSTRAINT `discipliny_zavodu_ibfk_1` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`disciplina_id`),
  ADD CONSTRAINT `discipliny_zavodu_ibfk_2` FOREIGN KEY (`zavod_id`) REFERENCES `zavod` (`zavod_id`);

--
-- Omezení pro tabulku `klub`
--
ALTER TABLE `klub`
  ADD CONSTRAINT `klub_ibfk_1` FOREIGN KEY (`mesto_id`) REFERENCES `mesto` (`mesto_id`);

--
-- Omezení pro tabulku `mesto`
--
ALTER TABLE `mesto`
  ADD CONSTRAINT `mesto_ibfk_1` FOREIGN KEY (`stat_id`) REFERENCES `stat` (`stat_id`);

--
-- Omezení pro tabulku `plavec`
--
ALTER TABLE `plavec`
  ADD CONSTRAINT `plavec_ibfk_1` FOREIGN KEY (`klub_id`) REFERENCES `klub` (`klub_id`),
  ADD CONSTRAINT `plavec_ibfk_2` FOREIGN KEY (`stat_id`) REFERENCES `stat` (`stat_id`);

--
-- Omezení pro tabulku `vysledek`
--
ALTER TABLE `vysledek`
  ADD CONSTRAINT `vysledek_ibfk_1` FOREIGN KEY (`zavod_id`) REFERENCES `zavod` (`zavod_id`),
  ADD CONSTRAINT `vysledek_ibfk_2` FOREIGN KEY (`plavec_id`) REFERENCES `plavec` (`plavec_id`),
  ADD CONSTRAINT `vysledek_ibfk_3` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`disciplina_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
