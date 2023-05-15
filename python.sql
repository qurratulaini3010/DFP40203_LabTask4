-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2023 at 04:43 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `python`
--

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `title` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  `ticket_price` int(11) NOT NULL,
  `review` varchar(255) NOT NULL,
  `production` varchar(255) NOT NULL,
  `hall` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `sysnopsis` text NOT NULL,
  `estimated_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`title`, `genre`, `duration`, `ticket_price`, `review`, `production`, `hall`, `capacity`, `sysnopsis`, `estimated_money`) VALUES
('iron man', 'action', 80, 45, 'good movie', 'old production', '5', 76, 'about marvel', 3420),
('iron man2', 'action', 150, 70, 'great movie', 'old production', '6', 600, 'continue from iron man 2', 600),
('iron', 'action', 90, 40, 'good movie', 'james pro', '3', 100, 'about marvel', 4000),
('Swan princess', 'fantasy', 100, 70, 'an oldy but goldy', 'old production', '1', 300, 'about a princess became a swan', 21000),
('sabrina', 'romance', 200, 130, 'great and graphic amazing', 'pamse', '8', 400, 'about sabrina the witches', 52000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
