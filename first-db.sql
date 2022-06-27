-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 27, 2022 at 02:12 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `first-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `Section_ID` int(11) NOT NULL,
  `Section_Name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`Section_ID`, `Section_Name`) VALUES
(1, 'Nepal'),
(10, 'China'),
(11, 'Lainchour'),
(12, 'Prabin'),
(13, 'Bangladash'),
(14, 'Beijing'),
(15, 'Mankjasnak'),
(16, 'Harry'),
(17, 'Yugesh'),
(18, 'jfhgsjhf'),
(19, 'harry'),
(20, 'Harr'),
(21, 'Lamjung'),
(22, 'Lamjung'),
(23, 'Pravin'),
(24, 'Ram'),
(25, 'Suyashaa'),
(26, 'Subin'),
(27, 'Ram'),
(28, ''),
(29, 'Archalbot'),
(30, 'Lamjung'),
(46, 'Langtang'),
(48, 'Chitwaan'),
(49, 'Ram'),
(50, 'Harry'),
(53, 'ghffc'),
(55, 'bxbdndndh'),
(56, 'jsjjdjdn'),
(57, 'ndjjdjd'),
(58, 'jsjsjnd'),
(59, ''),
(60, ''),
(61, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`Section_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `Section_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
