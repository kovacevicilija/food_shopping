-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2019 at 04:37 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ins_bp`
--

-- --------------------------------------------------------

--
-- Table structure for table `ispiti`
--

CREATE TABLE `ispiti` (
  `datum` date NOT NULL,
  `vrsta_ispita` enum('p','u') NOT NULL,
  `najvisa_ocjena` int(11) NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `ispit_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ispiti`
--

INSERT INTO `ispiti` (`datum`, `vrsta_ispita`, `najvisa_ocjena`, `id`, `ispit_id`) VALUES
('2018-04-13', 'u', 6, 10, 1),
('2017-04-02', 'u', 8, 3, 2),
('2018-01-09', 'p', 10, 3, 3),
('2018-09-16', 'u', 6, 3, 4),
('2018-10-10', 'u', 7, 3, 5),
('2018-02-20', 'p', 3, 1, 6),
('2018-07-08', 'p', 8, 1, 7),
('2018-01-20', 'p', 9, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ocjene`
--

CREATE TABLE `ocjene` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `ispit_id` int(10) UNSIGNED NOT NULL,
  `ocijena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ocjene`
--

INSERT INTO `ocjene` (`student_id`, `ispit_id`, `ocijena`) VALUES
(2, 1, 9),
(1, 2, 8),
(1, 3, 9),
(2, 3, 10),
(3, 4, 8),
(3, 5, 4),
(4, 5, 10),
(2, 6, 6),
(3, 6, 10),
(1, 8, 3),
(2, 8, 8),
(3, 9, 10);

-- --------------------------------------------------------

--
-- Table structure for table `odsutnost`
--

CREATE TABLE `odsutnost` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `odsutnost`
--

INSERT INTO `odsutnost` (`student_id`, `datum`) VALUES
(2, '2018-09-16');

-- --------------------------------------------------------

--
-- Table structure for table `predmeti`
--

CREATE TABLE `predmeti` (
  `ime` varchar(50) NOT NULL,
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predmeti`
--

INSERT INTO `predmeti` (`ime`, `id`) VALUES
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
-- Table structure for table `studenti`
--

CREATE TABLE `studenti` (
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
-- Dumping data for table `studenti`
--

INSERT INTO `studenti` (`ime_studenta`, `prezime_studenta`, `email`, `ulica`, `grad`, `drzava`, `p_broj`, `mob`, `datum_rod`, `spol`, `datum_upisa`, `uzina`, `student_id`) VALUES
('Mario', 'Bosancic', 'jako@m.com', 'ulica10', 'bgrs', 'BH', 432, '01981320', '1919-05-19', 'm', '2019-01-04 11:57:21', 8.99, 1),
('Postoo', 'Hajos', 'ghko@m.com', 'ulica10', 'bgrs', 'RS', 123, '045341320', '1991-05-19', 'm', '2019-01-03 20:22:16', 8.99, 2),
('Terpo', 'Zepro', 'uiko@m.com', 'ulica30', 'ns', 'SL', 863, '16534620', '1951-05-19', 'm', '2019-01-03 20:22:16', 8.99, 3),
('Makedonce', 'Serpoce', 'mk@macedonia.com', 'ulica50', 't', 'MK', 765, '00534620', '1961-05-19', 'm', '2019-01-03 20:22:16', 8.99, 4),
('Georte', 'Tvro', 'crnogorce@mail.com', 'crnogorska43', 'z', 'CG', 435, '095090500', '1985-01-10', 'm', '2019-01-03 20:22:16', 8.99, 5),
('Xavmo', 'Nevmo', 'sipal@mail.com', 'alban4', 'h', 'AL', 585, '095090500', '1985-11-10', 'm', '2019-01-03 20:22:16', 8.99, 6),
('Tihomir', 'Crnomic', 'tcrmic@mail.com', 'Bestinska 10/9bc', 'Nin', 'HR', 492, '93845340', '1990-01-29', 'm', '2019-01-04 12:08:20', 4.5, 7),
('Ruzica', 'Pulnikovic', 'ruzinmail@hr.com', 'Poljanska 30/j4', 'Doboj', 'BH', 954, '54674567', '1999-09-06', 'z', '2019-01-04 12:10:42', 6.8, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ispiti`
--
ALTER TABLE `ispiti`
  ADD PRIMARY KEY (`ispit_id`);

--
-- Indexes for table `ocjene`
--
ALTER TABLE `ocjene`
  ADD PRIMARY KEY (`ispit_id`,`student_id`);

--
-- Indexes for table `odsutnost`
--
ALTER TABLE `odsutnost`
  ADD PRIMARY KEY (`student_id`,`datum`);

--
-- Indexes for table `predmeti`
--
ALTER TABLE `predmeti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ispiti`
--
ALTER TABLE `ispiti`
  MODIFY `ispit_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `predmeti`
--
ALTER TABLE `predmeti`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `studenti`
--
ALTER TABLE `studenti`
  MODIFY `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
