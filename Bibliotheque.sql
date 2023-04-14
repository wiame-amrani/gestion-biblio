-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2023 at 02:19 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bibliotheque`
--

-- --------------------------------------------------------

--
-- Table structure for table `authentification`
--

CREATE TABLE `authentification` (
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authentification`
--

INSERT INTO `authentification` (`email`, `password`) VALUES
('wiame@gmail.com', 'wiame'),
('zakari', 'mine'),
('zakariiiii', 'jhggdv');

-- --------------------------------------------------------

--
-- Table structure for table `emprunt`
--

CREATE TABLE `emprunt` (
  `ID` int(11) NOT NULL,
  `ExemplaireId` int(11) NOT NULL,
  `UsagerID` int(11) NOT NULL,
  `DateEmprunt` date NOT NULL,
  `DateRetourPrevu` date NOT NULL,
  `DateRetourEffective` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exemplaire`
--

CREATE TABLE `exemplaire` (
  `ID` int(11) NOT NULL,
  `OeuvreID` int(11) NOT NULL,
  `etat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oeuvre`
--

CREATE TABLE `oeuvre` (
  `ID` int(11) NOT NULL,
  `Titre` varchar(255) NOT NULL,
  `Auteur` varchar(255) NOT NULL,
  `Categorie` varchar(255) NOT NULL,
  `NbResa` int(11) NOT NULL DEFAULT 0,
  `Lending` int(11) NOT NULL,
  `TypeOeuvre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `ID` int(11) NOT NULL,
  `OeuvreID` int(11) NOT NULL,
  `UsagerID` int(11) NOT NULL,
  `dateReservation` date NOT NULL,
  `DateAnnulation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usager`
--

CREATE TABLE `usager` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `DateNais` date NOT NULL,
  `Sexe` varchar(255) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  `Tel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKEmprunt521388` (`UsagerID`),
  ADD KEY `FKEmprunt665940` (`ExemplaireId`);

--
-- Indexes for table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKExamplaire350739` (`OeuvreID`);

--
-- Indexes for table `oeuvre`
--
ALTER TABLE `oeuvre`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FKReservatio502961` (`UsagerID`),
  ADD KEY `FKReservatio107611` (`OeuvreID`);

--
-- Indexes for table `usager`
--
ALTER TABLE `usager`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `exemplaire`
--
ALTER TABLE `exemplaire`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `oeuvre`
--
ALTER TABLE `oeuvre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `usager`
--
ALTER TABLE `usager`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `FK_Emprunt_Examplaire` FOREIGN KEY (`ExemplaireId`) REFERENCES `exemplaire` (`ID`),
  ADD CONSTRAINT `FK_Emprunt_Usager` FOREIGN KEY (`UsagerID`) REFERENCES `usager` (`ID`);

--
-- Constraints for table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `FK_Examplaire_Oeuvre` FOREIGN KEY (`OeuvreID`) REFERENCES `oeuvre` (`ID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_Reservatio_Oeuvre` FOREIGN KEY (`OeuvreID`) REFERENCES `oeuvre` (`ID`),
  ADD CONSTRAINT `FK_Reservatio_Usager` FOREIGN KEY (`UsagerID`) REFERENCES `usager` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
