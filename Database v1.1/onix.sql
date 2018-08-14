-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2018 at 06:31 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onix`
--

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `a001` varchar(100) CHARACTER SET utf8 NOT NULL,
  `x312` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: barcode - BarcodeType',
  `x313` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: barcode - PositionOnProduct',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`a001`, `x312`, `x313`, `created_at`, `updated_at`) VALUES
('9780470018217', '12', '33', '2018-08-14 14:04:27', '2018-08-14 14:04:27'),
('9780470018217', '56', '26', '2018-08-14 14:04:27', '2018-08-14 14:04:27');

-- --------------------------------------------------------

--
-- Table structure for table `descriptivedetails`
--

CREATE TABLE `descriptivedetails` (
  `a001` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `x314` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b012` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b333` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b225` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b014` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b384` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x416` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b385` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x316` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x317` longtext COLLATE utf8_unicode_ci,
  `b063` longtext COLLATE utf8_unicode_ci,
  `x411` tinyint(4) DEFAULT NULL,
  `b368` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b369` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b370` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b049` longtext COLLATE utf8_unicode_ci,
  `n339` tinyint(4) DEFAULT NULL,
  `x419` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b057` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b217` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b058` longtext COLLATE utf8_unicode_ci,
  `n386` tinyint(4) DEFAULT NULL,
  `x422` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b125` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b062` longtext COLLATE utf8_unicode_ci,
  `b207` longtext COLLATE utf8_unicode_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discountcodeds`
--

CREATE TABLE `discountcodeds` (
  `id` int(11) NOT NULL,
  `j363` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productsupply>supplydetail>price>discountcoded DiscountCodeType\nv2.1: supplydetail>price>discountcoded DiscountCodeType',
  `j378` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productsupply>supplydetail>price>discountcoded DiscountCodeTypeName\nv2.1: supplydetail>price>discountcoded DiscountCodeTypeName',
  `j364` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productsupply>supplydetail>price>discountcoded DiscountCode\nv2.1: supplydetail>price>discountcoded DiscountCode',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discountcodeds`
--

INSERT INTO `discountcodeds` (`id`, `j363`, `j378`, `j364`, `created_at`, `updated_at`) VALUES
(1, '02', '', 'P', '2018-08-14 18:58:59', '2018-08-14 18:58:59'),
(2, '02', '', 'DP', '2018-08-14 18:58:59', '2018-08-14 18:58:59');

-- --------------------------------------------------------

--
-- Table structure for table `epublicenses`
--

CREATE TABLE `epublicenses` (
  `a001` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `x511` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `epubusageconstraints`
--

CREATE TABLE `epubusageconstraints` (
  `a001` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `x318` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x319` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epubusagelimit` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `epubusageconstraints`
--

INSERT INTO `epubusageconstraints` (`a001`, `x318`, `x319`, `epubusagelimit`, `created_at`, `updated_at`) VALUES
('9780470018071', '45', '67', '{\"x320\":\"ccccccc\",\"x321\":\"45\"}', '2018-08-14 16:39:22', '2018-08-14 16:39:22');

-- --------------------------------------------------------

--
-- Table structure for table `measures`
--

CREATE TABLE `measures` (
  `a001` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `x315` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->measure - MeasureType',
  `c093` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v2.1: measure - MeasureTypeCode',
  `c094` varchar(6) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->measure - Measurement\nv2.1: measure - Measurement',
  `c095` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->measure - MeasureUnitCode\nv2.1: measure - MeasureUnitCode',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measures`
--

INSERT INTO `measures` (`a001`, `x315`, `c093`, `c094`, `c095`, `created_at`, `updated_at`) VALUES
('9780470018217', '01', NULL, '235', 'mm', '2018-08-14 16:25:25', '2018-08-14 16:25:25'),
('9780470018217', '02', NULL, '160', 'mm', '2018-08-14 16:25:25', '2018-08-14 16:25:25'),
('9780470018217', '03', NULL, '20', 'mm', '2018-08-14 16:25:25', '2018-08-14 16:25:25'),
('9780470018217', '08', NULL, '20', 'oz', '2018-08-14 16:25:25', '2018-08-14 16:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `productclassifications`
--

CREATE TABLE `productclassifications` (
  `a001` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `b274` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b275` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b337` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productformfeatures`
--

CREATE TABLE `productformfeatures` (
  `id` int(11) NOT NULL,
  `b334` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b335` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b336` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productformfeatures`
--

INSERT INTO `productformfeatures` (`id`, `b334`, `b335`, `b336`, `created_at`, `updated_at`) VALUES
(1, '45', '42', '3333333333', '2018-08-14 18:27:54', '2018-08-14 18:27:54'),
(2, '25', '12', 'c', '2018-08-14 18:27:54', '2018-08-14 18:27:54'),
(3, '19', 'dgfg', '3bhgjh', '2018-08-14 18:27:55', '2018-08-14 18:27:55'),
(4, '87', 'dgfg', 'cccccc', '2018-08-14 18:27:55', '2018-08-14 18:27:55'),
(5, '45', 'rrrrrr', '', '2018-08-14 18:27:55', '2018-08-14 18:27:55'),
(6, '22', '11', 'dgfgf', '2018-08-14 18:27:55', '2018-08-14 18:27:55'),
(7, '19', '78', 'hj', '2018-08-14 18:27:55', '2018-08-14 18:27:55'),
(8, '46', '08', 'vgjgkgk', '2018-08-14 18:27:56', '2018-08-14 18:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `productidentifiers`
--

CREATE TABLE `productidentifiers` (
  `id` int(11) NOT NULL,
  `b221` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productidentifier - ProductIDType\nv2.1: productidentifier - ProductIDType',
  `b233` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b244` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: productidentifier - IDValue\nv2.1: productidentifier - IDValue',
  `b246` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v2.1: productidentifier - Barcode',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productidentifiers`
--

INSERT INTO `productidentifiers` (`id`, `b221`, `b233`, `b244`, `b246`, `created_at`, `updated_at`) VALUES
(1, '15', '', '9780470018071', NULL, '2018-08-14 18:27:29', '2018-08-14 18:27:29'),
(2, '15', '', '9780470018095', NULL, '2018-08-14 18:27:29', '2018-08-14 18:27:29'),
(3, '15', '', '9780470018132', NULL, '2018-08-14 18:27:29', '2018-08-14 18:27:29'),
(4, '15', '', '9780470018194', NULL, '2018-08-14 18:27:29', '2018-08-14 18:27:29'),
(5, '15', '', '9780470018200', NULL, '2018-08-14 18:27:29', '2018-08-14 18:27:29'),
(6, '15', '', '9780470018217', NULL, '2018-08-14 18:27:30', '2018-08-14 18:27:30'),
(7, '15', '', '9780470018224', NULL, '2018-08-14 18:27:30', '2018-08-14 18:27:30');

-- --------------------------------------------------------

--
-- Table structure for table `productparts`
--

CREATE TABLE `productparts` (
  `a001` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `x457` tinyint(4) DEFAULT NULL,
  `b012` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b333` longtext COLLATE utf8_unicode_ci,
  `b225` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b014` longtext COLLATE utf8_unicode_ci,
  `b385` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x322` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x323` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x316` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `a001` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'RecordReference',
  `a002` varchar(2) CHARACTER SET utf8 NOT NULL COMMENT 'NotificationType',
  `a199` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'v3.0: DeletionText\n',
  `a194` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'RecordSourceType',
  `a197` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: RecordSourceName',
  `b083` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail - CountryOfPublication',
  `b394` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail - PublishingStatus',
  `x512` varchar(1) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail->copyrightstatement - CopyrightType',
  `b089` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail->salesrights - SalesRightsType',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`a001`, `a002`, `a199`, `a194`, `a197`, `b083`, `b394`, `x512`, `b089`, `created_at`, `updated_at`) VALUES
('9780470018071', '03', 'eng', '', '', NULL, NULL, NULL, NULL, '2018-08-14 12:06:07', '2018-08-14 12:06:07'),
('9780470018095', '03', '', '', '', NULL, NULL, NULL, NULL, '2018-08-14 12:06:07', '2018-08-14 12:06:07'),
('9780470018132', '03', '', '', '', NULL, NULL, NULL, NULL, '2018-08-14 12:06:07', '2018-08-14 12:06:07'),
('9780470018194', '03', '', '', '', NULL, NULL, NULL, NULL, '2018-08-14 12:06:07', '2018-08-14 12:06:07'),
('9780470018200', '03', '', '', '', NULL, NULL, NULL, NULL, '2018-08-14 12:06:07', '2018-08-14 12:06:07'),
('9780470018217', '03', '', '', '', NULL, NULL, NULL, NULL, '2018-08-14 12:06:07', '2018-08-14 12:06:07'),
('9780470018224', '03', '', '', '', NULL, NULL, NULL, NULL, '2018-08-14 14:13:42', '2018-08-14 14:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `recordsourceidentifiers`
--

CREATE TABLE `recordsourceidentifiers` (
  `a001` varchar(100) CHARACTER SET utf8 NOT NULL,
  `x311` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: recordsourceidentifier - RecordSourceIDType',
  `b233` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: recordsourceidentifier - IDTypeName',
  `b244` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: recordsourceidentifier - IDValue',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recordsourceidentifiers`
--

INSERT INTO `recordsourceidentifiers` (`a001`, `x311`, `b233`, `b244`, `created_at`, `updated_at`) VALUES
('9780470018071', '12', '23w', '24e', '2018-08-14 13:47:11', '2018-08-14 13:47:11'),
('9780470018071', '13', 'z', 'c', '2018-08-14 13:47:12', '2018-08-14 13:47:12'),
('9780470018095', '45', '', 'hhc', '2018-08-14 13:47:12', '2018-08-14 13:47:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `descriptivedetails`
--
ALTER TABLE `descriptivedetails`
  ADD UNIQUE KEY `a001_UNIQUE` (`a001`);

--
-- Indexes for table `discountcodeds`
--
ALTER TABLE `discountcodeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productformfeatures`
--
ALTER TABLE `productformfeatures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productidentifiers`
--
ALTER TABLE `productidentifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`a001`),
  ADD UNIQUE KEY `a001_UNIQUE` (`a001`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discountcodeds`
--
ALTER TABLE `discountcodeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `productformfeatures`
--
ALTER TABLE `productformfeatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `productidentifiers`
--
ALTER TABLE `productidentifiers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
