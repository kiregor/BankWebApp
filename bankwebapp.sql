-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2019 at 04:17 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankwebapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accno` char(5) NOT NULL,
  `name` char(30) NOT NULL,
  `address` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accno`, `name`, `address`) VALUES
('CM001', 'Daniel', 'UK'),
('admin', 'admin', 'admin'),
('SM001', 'Humza', 'UK'),
('CF002', 'Linda', 'France'),
('SX002', 'Ash', 'UK'),
('CM003', 'Nick', 'UK'),
('SM003', 'Farhan', 'UK'),
('CM004', 'Hamza', 'UK'),
('SF004', 'Sarah', 'UK'),
('SF005', 'Louise', 'US'),
('SM006', 'Paul', 'UK'),
('SM007', 'Frank', 'UK');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `accno` char(5) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`accno`, `amount`, `date`, `type`) VALUES
('CM001', 100, '2019-05-09 10:44:08', 'D'),
('CM001', 100, '2019-05-09 10:50:33', 'D'),
('CM001', 100, '2019-05-09 11:08:17', 'W'),
('CM001', 3000, '2019-05-09 11:09:35', 'D'),
('CM001', 300, '2019-05-09 11:12:45', 'D'),
('CM001', 5000, '2019-05-09 11:12:51', 'D'),
('CM001', 200, '2019-05-09 11:13:53', 'D'),
('CM001', 3000, '2019-05-09 14:12:46', 'D'),
('CM001', 5000, '2019-05-09 14:12:52', 'W'),
('SM001', 5000, '2019-05-09 14:14:06', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `accno` char(10) NOT NULL,
  `password` char(20) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`accno`, `password`, `role`, `active`) VALUES
('CM001', 'asdf', 1, 1),
('admin', 'admin', 2, 1),
('SM001', 'asdf', 1, 0),
('CF002', 'asdf', 1, 1),
('SX002', 'asdf', 1, 1),
('CM003', 'asdf', 1, 1),
('SM003', 'asdf', 1, 1),
('CM004', 'asdf', 1, 1),
('SF004', 'asdf', 1, 1),
('SF005', 'asdf', 1, 1),
('SM006', 'asdf', 1, 1),
('SM007', 'asdf', 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
