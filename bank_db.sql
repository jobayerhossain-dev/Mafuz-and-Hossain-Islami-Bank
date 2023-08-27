-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 27, 2023 at 04:38 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_account`
--

CREATE TABLE `bank_account` (
  `acc_no` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `city` char(20) DEFAULT NULL,
  `mobile_no` char(11) DEFAULT NULL,
  `balance` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_account`
--

INSERT INTO `bank_account` (`acc_no`, `name`, `gender`, `city`, `mobile_no`, `balance`) VALUES
(1, 'Anika', 'female', 'Dhaka', '01423156478', 25000),
(2, 'Sajid Hasan', 'male', 'Dhaka', '01912546321', 100000),
(3, 'Shabnam Ali', 'female', 'Barisal', '01453967854', 2700000),
(4, 'Riazul Khan', 'male', 'Barisal', '01453967612', 40000),
(5, 'Farzana Akter', 'female', 'Khulna', '01754896214', 580000),
(6, 'Iqbal Khan', 'male', 'Dhaka', '01754898456', 65000),
(7, 'Farida Akhtar', 'female', 'Dhaka', '01915746321', 23000),
(8, 'Tahmina Begum', 'female', 'Rangpur', '01854712647', 123000),
(9, 'Shahnaz Chowdhury', 'female', 'Rangpur', '01815247854', 15000),
(10, 'Fatima Khanam', 'female', 'Mymensingh', '01645217836', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `acc_no` int(11) DEFAULT NULL,
  `amount` int(8) DEFAULT NULL,
  `ttype` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`acc_no`, `amount`, `ttype`) VALUES
(1, 20000, 'd'),
(1, 5000, 'w'),
(2, 100000, 'd'),
(2, 20000, 'w'),
(3, 3000000, 'd'),
(4, 50000, 'd'),
(4, 10000, 'w'),
(5, 600000, 'd'),
(7, 30000, 'd'),
(8, 83000, 'd'),
(9, 15000, 'd'),
(10, 25000, 'd'),
(6, 65000, 'd'),
(8, 40000, 'd'),
(3, 100000, 'w'),
(3, 500000, 'w'),
(3, 200000, 'd'),
(5, 20000, 'w'),
(10, 5000, 'w'),
(3, 100000, 'd'),
(2, 20000, 'd'),
(1, 10000, 'd'),
(7, 7000, 'w');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_account`
--
ALTER TABLE `bank_account`
  ADD PRIMARY KEY (`acc_no`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD KEY `acc_no` (`acc_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_account`
--
ALTER TABLE `bank_account`
  MODIFY `acc_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`acc_no`) REFERENCES `bank_account` (`acc_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
