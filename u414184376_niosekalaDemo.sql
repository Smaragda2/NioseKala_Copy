-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1:3306
-- Χρόνος δημιουργίας: 06 Απρ 2023 στις 17:26:13
-- Έκδοση διακομιστή: 10.5.18-MariaDB-cll-lve
-- Έκδοση PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `u414184376_niosekalaDemo`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `Admin`
--

CREATE TABLE `Admin` (
  `username` varchar(15) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `Admin`
--

INSERT INTO `Admin` (`username`, `pass`) VALUES
('adecco', 'adecco'),
('admin', 'Sm@ragda2');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `Booked`
--

CREATE TABLE `Booked` (
  `onDate` date NOT NULL,
  `atTime` time NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `Booked`
--

INSERT INTO `Booked` (`onDate`, `atTime`, `createdAt`) VALUES
('2022-10-11', '10:00:00', '2022-10-10 21:48:22'),
('2022-10-13', '14:00:00', '2022-10-10 18:24:38'),
('2022-10-13', '15:00:00', '2022-10-10 18:36:32'),
('2022-10-13', '16:00:00', '2022-10-10 21:39:39'),
('2023-04-08', '10:00:00', '2023-04-06 20:21:42');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `paymentInfo`
--

CREATE TABLE `paymentInfo` (
  `orderUniqueID` varchar(255) NOT NULL,
  `paymentToken` varchar(255) DEFAULT NULL,
  `transactionID` varchar(255) DEFAULT NULL,
  `paymentStatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `paymentInfo`
--

INSERT INTO `paymentInfo` (`orderUniqueID`, `paymentToken`, `transactionID`, `paymentStatus`) VALUES
('9200663984972608', 'be27997640a5be2802ff4bde64efee29d59d34d7', '18c9920a-13ad-4b99-a80d-b5b9ac961e11', 'Success'),
('1236690832572601', '6068d7f42f90630de8a6fa8e12d848a574058aee', 'ce4741c7-2d4e-4e0e-8244-6c9ccdca661f', 'Success'),
('1479861484572601', 'b1a809f0943205495d5a109cf91ded003f480d47', 'f8d86bfd-27f7-4a86-93c4-c097ab25a6d0', 'Success'),
('1602310979272600', '3cfda3db8a84875bcd582e865ded7be9bf35a03d', 'de221775-06aa-4dc8-8f6c-971b6a12bdb7', 'Success'),
('7603010880672600', '072514091b5738888da112074668256951cbe9f9', 'f60dca88-c8f8-4325-b991-40c9d001ea58', 'Success');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `Product`
--

CREATE TABLE `Product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `canBeAnonymous` tinyint(1) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `Product`
--

INSERT INTO `Product` (`id`, `name`, `price`, `duration`, `description`, `canBeAnonymous`, `isDeleted`) VALUES
(1, 'Demo', 0.8, '45 Λεπτά', '   Testing ', 0, 0),
(2, 'Demo Anonymous', 0.5, '45 Λεπτά', 'Testing Anonumous  ', 1, 0);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `Request`
--

CREATE TABLE `Request` (
  `name` varchar(255) NOT NULL,
  `onDate` date NOT NULL,
  `atTime` time NOT NULL,
  `email` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tel` varchar(10) DEFAULT NULL,
  `whereTo` varchar(10) NOT NULL,
  `skypeName` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `isCompleted` tinyint(1) DEFAULT NULL,
  `isCancelled` tinyint(1) DEFAULT NULL,
  `isConfirmed` tinyint(1) DEFAULT NULL,
  `isPaid` tinyint(1) DEFAULT NULL,
  `selectedProductID` int(11) NOT NULL,
  `paymentToken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `Request`
--

INSERT INTO `Request` (`name`, `onDate`, `atTime`, `email`, `createdAt`, `tel`, `whereTo`, `skypeName`, `notes`, `isCompleted`, `isCancelled`, `isConfirmed`, `isPaid`, `selectedProductID`, `paymentToken`) VALUES
('Smaragda Prasianaki', '2022-10-13', '15:00:00', 'smaragda2@hotmail.com', '2022-10-10 18:36:32', '6974977789', 'Skype', 'ghbtr', '  gbdft', 0, 0, 1, 1, 1, '6068d7f42f90630de8a6fa8e12d848a574058aee'),
('Smaragda Prasianaki', '2022-10-13', '16:00:00', 'smaragda2@hotmail.com', '2022-10-10 18:42:48', '6974977789', 'Skype', 'smaragda', '  test', 0, 0, 1, 1, 1, 'b1a809f0943205495d5a109cf91ded003f480d47'),
('Smaragda Prasianaki', '2022-10-11', '10:00:00', 'smaragda2@hotmail.com', '2022-10-10 18:50:17', '6974977789', 'tel', NULL, 'fgrs  ', 0, 0, 0, 1, 1, '3cfda3db8a84875bcd582e865ded7be9bf35a03d'),
('Smaragda Prasianaki', '2022-10-13', '14:00:00', 'smaragda2@hotmail.com', '2022-10-10 18:52:05', '6974977789', 'viber', NULL, '  ', 1, 0, 1, 1, 1, 'be27997640a5be2802ff4bde64efee29d59d34d7'),
('Σμαράγδα Πρασιανάκη', '2023-04-08', '10:00:00', 'smaragda2@hotmail.com', '2023-04-06 17:22:42', '6974977789', 'Skype', 'Smaragda2', '  ', 0, 0, 0, 1, 1, '072514091b5738888da112074668256951cbe9f9');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `RequestAnonymous`
--

CREATE TABLE `RequestAnonymous` (
  `tel` varchar(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(255) NOT NULL,
  `hours` varchar(255) NOT NULL,
  `selectedProductID` int(11) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `isFree` tinyint(1) DEFAULT NULL,
  `isCompleted` tinyint(1) DEFAULT NULL,
  `isCancelled` tinyint(1) DEFAULT NULL,
  `isConfirmed` tinyint(1) DEFAULT NULL,
  `isPaid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `Times`
--

CREATE TABLE `Times` (
  `id` int(11) NOT NULL,
  `minDays` int(11) NOT NULL,
  `maxDays` int(11) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `onMonday` tinyint(1) DEFAULT NULL,
  `onTuesday` tinyint(1) DEFAULT NULL,
  `onWednsday` tinyint(1) DEFAULT NULL,
  `onThursday` tinyint(1) DEFAULT NULL,
  `onFriday` tinyint(1) DEFAULT NULL,
  `onSaturday` tinyint(1) DEFAULT NULL,
  `onSunday` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Άδειασμα δεδομένων του πίνακα `Times`
--

INSERT INTO `Times` (`id`, `minDays`, `maxDays`, `startTime`, `endTime`, `onMonday`, `onTuesday`, `onWednsday`, `onThursday`, `onFriday`, `onSaturday`, `onSunday`) VALUES
(1, 1, 5, '10:00:00', '20:00:00', 1, 1, 0, 1, 0, 1, 1);

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`username`);

--
-- Ευρετήρια για πίνακα `Booked`
--
ALTER TABLE `Booked`
  ADD PRIMARY KEY (`onDate`,`atTime`);

--
-- Ευρετήρια για πίνακα `paymentInfo`
--
ALTER TABLE `paymentInfo`
  ADD UNIQUE KEY `transactionID` (`transactionID`);

--
-- Ευρετήρια για πίνακα `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Ευρετήρια για πίνακα `Request`
--
ALTER TABLE `Request`
  ADD PRIMARY KEY (`email`,`createdAt`),
  ADD UNIQUE KEY `paymentToken` (`paymentToken`),
  ADD KEY `selectedProductID` (`selectedProductID`);

--
-- Ευρετήρια για πίνακα `RequestAnonymous`
--
ALTER TABLE `RequestAnonymous`
  ADD PRIMARY KEY (`tel`,`createdAt`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `selectedProductID` (`selectedProductID`);

--
-- Ευρετήρια για πίνακα `Times`
--
ALTER TABLE `Times`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT για πίνακα `Times`
--
ALTER TABLE `Times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `Request`
--
ALTER TABLE `Request`
  ADD CONSTRAINT `Request_ibfk_1` FOREIGN KEY (`selectedProductID`) REFERENCES `Product` (`id`);

--
-- Περιορισμοί για πίνακα `RequestAnonymous`
--
ALTER TABLE `RequestAnonymous`
  ADD CONSTRAINT `RequestAnonymous_ibfk_1` FOREIGN KEY (`selectedProductID`) REFERENCES `Product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
