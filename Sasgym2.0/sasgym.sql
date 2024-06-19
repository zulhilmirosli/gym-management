-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2023 at 04:24 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sasgym`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_subs`
--

CREATE TABLE `client_subs` (
  `subsNo` int(6) NOT NULL,
  `id` int(6) DEFAULT NULL,
  `packageID` varchar(20) DEFAULT NULL,
  `bookingDate` date DEFAULT NULL,
  `packageDesc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_subs`
--

INSERT INTO `client_subs` (`subsNo`, `id`, `packageID`, `bookingDate`, `packageDesc`) VALUES
(1, 1001, 'PACK03', '2023-06-20', 'Premium Package'),
(2, 1003, 'PACK01', '2023-07-06', 'Basic Package'),
(3, 1006, 'PACK03', '2023-07-12', 'Premium Package'),
(4, 1010, 'PACK02', '2023-07-19', 'Group Package');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `packageID` varchar(20) NOT NULL,
  `packageDesc` varchar(100) DEFAULT NULL,
  `price` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`packageID`, `packageDesc`, `price`) VALUES
('PACK01', 'Basic Package', 100),
('PACK02', 'Group Package', 125),
('PACK03', 'Premium Package', 175),
('PACK04', 'Luxury', 444);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `subsNo` int(11) DEFAULT NULL,
  `cardNumber` varchar(100) DEFAULT NULL,
  `expiry` varchar(10) NOT NULL,
  `cvv_cvc` varchar(10) NOT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `subsNo`, `cardNumber`, `expiry`, `cvv_cvc`, `amount`) VALUES
(100, 2, '123456789', '02/2024', '456', 175),
(101, 2, '1234567', '04/2023', '123', 175),
(102, 4, '123456789', '06/23', '123', 125);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `username` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phoneNo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`username`, `name`, `password`, `phoneNo`) VALUES
('ariq', 'Ariq Iskandar', 'ariq', '011-6282-5356'),
('atif', 'Atif Afifi', 'atif', '019-796-5630'),
('syahmi', 'syahmi yaacob', 'syahmi', '014-320-5678'),
('zul', 'Muhammad Zulhilmi Bin Rosli', 'zul123', '017-502-1437');

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` int(11) NOT NULL,
  `Name` varchar(60) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(40) DEFAULT NULL,
  `Course` varchar(300) DEFAULT NULL,
  `Shift` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainers`
--

INSERT INTO `trainers` (`id`, `Name`, `Email`, `Phone`, `Course`, `Shift`) VALUES
(1001, 'Zamiri Bin Muhamad Haeris', 'zamiri@gmail.com', '0156980789', 'Weight Lifting', '10.00am-12.00pm'),
(1002, 'Hong Wan ', 'hong@gmail.com', '0156780979', 'Calisthenic', '10.00am-12.00pm'),
(1003, 'Farouk Abu Bakar Bin Haris', 'farouk@gmail.com', '0123450986', 'Fat Lost', '01.30pm-03.30pm'),
(1004, 'Alif Hafiz Bin Asman', 'alif@gmail.com', '0187549843', 'Weight Lifting', '01.30pm-03.30pm'),
(1005, 'Zulhilmi Rosli  Bin Azim', 'zulhilmi@gmail.com', '0143295667', 'Resistance Training', '03.30pm-05.30pm'),
(1006, 'A\'tif Afifi Bin Che Bakar', 'atif@gmail.com', '01234569876', ' Body Transformation', '03.30pm-05.30pm'),
(1007, 'Lucy Maya Luna', 'lucylurve@gmail.com', '0145346798', 'Fat Lost', '05.30pm-07.30pm'),
(1008, 'Rajesh A/L Rajasundra', 'rajesh@gmail.com', '0122345698', 'Weight Lifting', '05.30pm-07.30pm'),
(1009, 'Ahmad Naufal Bin Ahmad Rashidi', 'nopal@gmail.com', '012679854', ' Body Transformation', '08.30pm-10.30pm'),
(1010, 'Sarah Zafura Binti Rashid', 'saraxa@gmail.com', '0198709679', 'Fat Lost', '08.30pm-10.30pm'),
(1012, 'Athilah Syafiqah Nazri', 's62575@ocean.umt.edu.my', '0166124961', 'Weight Lifting', '08.30pm-10.30pm'),
(1013, 'Muhammad Zulhilmi Bin Rosli', 'zulhilmi0220@gmail.com', '0175021437', 'Body Transformation', '10.00am-12.00pm');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(70) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `phoneNo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `age`, `gender`, `phoneNo`) VALUES
(1001, 'Abdul', 'Abdul', 'Abdul Ghazali Bin Abdul Ghafur', '25', 'Male', '0143295658'),
(1002, 'Zulhilmi', 'Zulhilmi', 'Zulhilmi Bin Zulfakhri', '21', 'Male', '0195687654'),
(1003, 'zul', '123', 'Zulfakhri', '21', 'Male', '0111561504'),
(1004, 'Syukur', '123', 'Abdul Syukur', '12', 'Male', '11111'),
(1005, 'ahmad', 'ahmad', 'Ahmad Rashid', '25', 'Male', '0166124961'),
(1006, 'bakar', 'bakar', 'Abu Bakar As Siddiq', '30', 'Male', '0166124961'),
(1007, 'syam', 'syam', 'Syamsul Akmal', '32', 'Male', '0175021437'),
(1008, 'mimi', 'mimi', 'Syamimi Farzana Sofea', '25', 'Female', '0166124961'),
(1010, 'muhd', 'muhd', 'Muhd', '25', 'Male', '0166124961');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_subs`
--
ALTER TABLE `client_subs`
  ADD PRIMARY KEY (`subsNo`),
  ADD KEY `id` (`id`),
  ADD KEY `packageID` (`packageID`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`packageID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `subsNo` (`subsNo`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_subs`
--
ALTER TABLE `client_subs`
  MODIFY `subsNo` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1015;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_subs`
--
ALTER TABLE `client_subs`
  ADD CONSTRAINT `client_subs_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `client_subs_ibfk_2` FOREIGN KEY (`packageID`) REFERENCES `package` (`packageID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`subsNo`) REFERENCES `client_subs` (`subsNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
