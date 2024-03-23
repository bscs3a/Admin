-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2024 at 07:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `po`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `Category_ID` int(11) NOT NULL,
  `Category_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Category_ID`, `Category_Name`) VALUES
(1, 'Boom'),
(2, 'Bing'),
(3, 'Boom');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Order_ID` int(11) NOT NULL,
  `Date_Ordered` date DEFAULT current_timestamp(),
  `Time_Ordered` time DEFAULT current_timestamp(),
  `Order_Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Product_ID` int(250) NOT NULL,
  `Product_Image` varchar(250) NOT NULL,
  `Product_Name` varchar(50) DEFAULT NULL,
  `Product_Weight` int(50) DEFAULT NULL,
  `Product_Price` int(50) DEFAULT NULL,
  `Product_Description` text DEFAULT NULL,
  `p_supplier` varchar(50) NOT NULL,
  `p_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Product_ID`, `Product_Image`, `Product_Name`, `Product_Weight`, `Product_Price`, `Product_Description`, `p_supplier`, `p_category`) VALUES
(123, '12312', '123', 123, 123, '', '', ''),
(213, '123', '123', 123, 123213, '', '', ''),
(4131, '', '1tezst', 0, 0, 'adada', 'xd', 'Bang'),
(12312, '0', 'awdwad', 0, 0, 'dawdawd', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `Request_ID` int(11) NOT NULL,
  `Product_Quantity` int(11) DEFAULT NULL,
  `Product_Total_Price` int(11) DEFAULT NULL,
  `Items_Subtotal` int(11) DEFAULT NULL,
  `Total_Amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `Supplier_ID` int(11) NOT NULL,
  `Supplier_Name` varchar(50) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `Contact_Number` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`Supplier_ID`, `Supplier_Name`, `Location`, `Contact_Number`) VALUES
(1, 'xd', 'xd', 23),
(2, 'test', 'xd', 123);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `Transaction_ID` int(11) NOT NULL,
  `Date_Delivered` date DEFAULT current_timestamp(),
  `Time_Delivered` time DEFAULT current_timestamp(),
  `Order_Status` varchar(50) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Feedback` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Order_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`Request_ID`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`Transaction_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `Request_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `Supplier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;