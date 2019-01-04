-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2019 at 10:17 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testdb_yt`
--

-- --------------------------------------------------------

--
-- Table structure for table `ispit`
--

CREATE TABLE `ispit` (
  `datum` date NOT NULL,
  `vrsta_ispita` enum('p','u') NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `ispit_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ocjene`
--

CREATE TABLE `ocjene` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `dog_id` int(10) UNSIGNED NOT NULL,
  `ocijena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

CREATE TABLE `predmet` (
  `ime` varchar(50) NOT NULL,
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predmet`
--

INSERT INTO `predmet` (`ime`, `id`) VALUES
('Kemija', 1),
('Fizika', 2),
('Knjizevnost', 3),
('Trigonometrija', 4),
('Psihologija', 5),
('Geografjia', 6),
('Likovni', 7),
('Informatika', 8),
('Zdravstvena kultura', 9);

-- --------------------------------------------------------

--
-- Table structure for table `prisutnost`
--

CREATE TABLE `prisutnost` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ime_studenta` varchar(200) NOT NULL,
  `prezime_studenta` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `ulica` varchar(200) NOT NULL,
  `grad` varchar(200) NOT NULL,
  `drzava` char(2) NOT NULL DEFAULT 'ST',
  `p_broj` mediumint(8) UNSIGNED NOT NULL,
  `mob` varchar(50) NOT NULL,
  `datum_rod` date NOT NULL,
  `spol` enum('m','z') NOT NULL,
  `datum_upisa` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uzina` float DEFAULT NULL,
  `student_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ime_studenta`, `prezime_studenta`, `email`, `ulica`, `grad`, `drzava`, `p_broj`, `mob`, `datum_rod`, `spol`, `datum_upisa`, `uzina`, `student_id`) VALUES
('Mario', 'Jakoc', 'jako@m.com', 'ulica10', 'bgrs', 'BH', 432, '01981320', '1919-05-19', 'm', '2019-01-03 20:22:16', 8.99, 1),
('Postoo', 'Hajos', 'ghko@m.com', 'ulica10', 'bgrs', 'RS', 123, '045341320', '1991-05-19', 'm', '2019-01-03 20:22:16', 8.99, 2),
('Terpo', 'Zepro', 'uiko@m.com', 'ulica30', 'ns', 'SL', 863, '16534620', '1951-05-19', 'm', '2019-01-03 20:22:16', 8.99, 3),
('Makedonce', 'Serpoce', 'mk@macedonia.com', 'ulica50', 't', 'MK', 765, '00534620', '1961-05-19', 'm', '2019-01-03 20:22:16', 8.99, 4),
('Georte', 'Tvro', 'crnogorce@mail.com', 'crnogorska43', 'z', 'CG', 435, '095090500', '1985-01-10', 'm', '2019-01-03 20:22:16', 8.99, 5),
('Xavmo', 'Nevmo', 'sipal@mail.com', 'alban4', 'h', 'AL', 585, '095090500', '1985-11-10', 'm', '2019-01-03 20:22:16', 8.99, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ispit`
--
ALTER TABLE `ispit`
  ADD PRIMARY KEY (`ispit_id`);

--
-- Indexes for table `ocjene`
--
ALTER TABLE `ocjene`
  ADD PRIMARY KEY (`dog_id`,`student_id`);

--
-- Indexes for table `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prisutnost`
--
ALTER TABLE `prisutnost`
  ADD PRIMARY KEY (`student_id`,`datum`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ispit`
--
ALTER TABLE `ispit`
  MODIFY `ispit_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `predmet`
--
ALTER TABLE `predmet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
