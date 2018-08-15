-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2018 at 07:54 PM
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
('9780470018217', '56', '26', '2018-08-14 14:04:27', '2018-08-14 14:04:27'),
('123', '03', '01', '2018-08-15 10:10:18', '2018-08-15 10:10:18'),
('123', '13', '11', '2018-08-15 10:10:18', '2018-08-15 10:10:18'),
('', '03', '01', '2018-08-15 17:56:11', '2018-08-15 17:56:11'),
('', '13', '11', '2018-08-15 17:56:12', '2018-08-15 17:56:12');

-- --------------------------------------------------------

--
-- Table structure for table `collectionidentifiers`
--

CREATE TABLE `collectionidentifiers` (
  `id` int(10) NOT NULL,
  `x344` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b233` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b244` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `collectionidentifiers`
--

INSERT INTO `collectionidentifiers` (`id`, `x344`, `b233`, `b244`, `created_at`, `updated_at`) VALUES
(1, '23', 'collection', 'collection-b244', '2018-08-15 17:43:30', '2018-08-15 17:43:30'),
(2, '71', NULL, 'collection71-b244', '2018-08-15 17:43:30', '2018-08-15 17:43:30'),
(3, '71', NULL, 'collection71 - 1 -b244', '2018-08-15 17:43:30', '2018-08-15 17:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `collectionsequences`
--

CREATE TABLE `collectionsequences` (
  `id` int(11) NOT NULL,
  `x479` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x480` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x481` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `collectionsequences`
--

INSERT INTO `collectionsequences` (`id`, `x479`, `x480`, `x481`, `created_at`, `updated_at`) VALUES
(1, '12', '12 CollectionSequenceTypeName', '12 CollectionSequenceNumber', '2018-08-15 17:52:03', '2018-08-15 17:52:03'),
(2, '13', '12 2 CollectionSequenceTypeName', '12 2 CollectionSequenceNumber', '2018-08-15 17:52:03', '2018-08-15 17:52:03'),
(3, '24', '24 CollectionSequenceTypeName', '24 CollectionSequenceNumber', '2018-08-15 17:52:03', '2018-08-15 17:52:03'),
(4, '25', NULL, '24 CollectionSequenceNumber', '2018-08-15 17:52:34', '2018-08-15 17:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `containeditem`
--

CREATE TABLE `containeditem` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contributordates`
--

CREATE TABLE `contributordates` (
  `id` int(11) NOT NULL,
  `x417` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b306` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contributordates`
--

INSERT INTO `contributordates` (`id`, `x417`, `b306`, `created_at`, `updated_at`) VALUES
(1, '12', '20181010', '2018-08-15 18:37:55', '2018-08-15 18:37:55');

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
(2, '02', '', 'DP', '2018-08-14 18:58:59', '2018-08-14 18:58:59'),
(3, '02', '', 'R', '2018-08-15 09:23:23', '2018-08-15 09:23:23');

-- --------------------------------------------------------

--
-- Table structure for table `epublicenseexpressions`
--

CREATE TABLE `epublicenseexpressions` (
  `id` int(11) NOT NULL,
  `x508` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x509` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x510` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `epublicenseexpressions`
--

INSERT INTO `epublicenseexpressions` (`id`, `x508`, `x509`, `x510`, `created_at`, `updated_at`) VALUES
(1, '01', '', 'http://www.mypublisher.com/licenses/EULA_v3.pdf', '2018-08-15 11:02:50', '2018-08-15 11:02:50'),
(2, '23', '', 'cf', '2018-08-15 11:02:50', '2018-08-15 11:02:50'),
(3, '34', '', 'AAA', '2018-08-15 15:21:59', '2018-08-15 15:21:59');

-- --------------------------------------------------------

--
-- Table structure for table `epublicenses`
--

CREATE TABLE `epublicenses` (
  `id` int(11) NOT NULL,
  `x511` longtext CHARACTER SET utf8,
  `language` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epublicenseexpression_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `epublicenses`
--

INSERT INTO `epublicenses` (`id`, `x511`, `language`, `epublicenseexpression_id`, `created_at`, `updated_at`) VALUES
(1, 'mypublisher', '', NULL, '2018-08-15 15:47:23', '2018-08-15 15:47:23'),
(2, 'Tieng Viet', 'vie', 1, '2018-08-15 15:47:23', '2018-08-15 15:47:23'),
(3, 'Tieng Viet', 'vie', 2, '2018-08-15 15:47:23', '2018-08-15 15:47:23'),
(4, 'Tieng Anh', 'eng', 1, '2018-08-15 15:47:23', '2018-08-15 15:47:23'),
(5, 'Tieng Anh', 'eng', 2, '2018-08-15 15:47:23', '2018-08-15 15:47:23');

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
('9780470018071', '45', '67', '{\"x320\":\"ccccccc\",\"x321\":\"45\"}', '2018-08-14 16:39:22', '2018-08-14 16:39:22'),
('123', '11', '22', '{\"x320\":\"vvvvvvvv\",\"x321\":\"56\"}', '2018-08-15 10:15:37', '2018-08-15 10:15:37'),
('9780470018224', '05', '01', '{}', '2018-08-15 10:21:56', '2018-08-15 10:21:56'),
('9780470018224', '03', '02', '{\"x320\":\"10\",\"x321\":\"05\"}', '2018-08-15 10:21:56', '2018-08-15 10:21:56'),
('9780470018224', '06', '02', '{\"x320\":\"1\",\"x321\":\"10\"}', '2018-08-15 10:21:56', '2018-08-15 10:21:56'),
('', '11', '22', '{\"x320\":\"vvvvvvvv\",\"x321\":\"56\"}', '2018-08-15 17:56:12', '2018-08-15 17:56:12');

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
('21', NULL, '01', '9.25', 'in', '2018-08-15 19:21:41', '2018-08-15 19:21:41'),
('21', NULL, '02', '6.25', 'in', '2018-08-15 19:21:42', '2018-08-15 19:21:42'),
('21', NULL, '03', '1.2', 'in', '2018-08-15 19:21:42', '2018-08-15 19:21:42'),
('9780470018071', NULL, '01', '251.70', 'mm', '2018-08-15 19:21:42', '2018-08-15 19:21:42'),
('9780470018071', NULL, '02', '174.0', 'mm', '2018-08-15 19:21:42', '2018-08-15 19:21:42'),
('9780470018071', NULL, '03', '22.9', 'mm', '2018-08-15 19:21:42', '2018-08-15 19:21:42'),
('9780470018071', NULL, '08', '24.96', 'oz', '2018-08-15 19:21:42', '2018-08-15 19:21:42'),
('9780470018095', NULL, '01', '289.6', 'mm', '2018-08-15 19:21:43', '2018-08-15 19:21:43'),
('9780470018095', NULL, '02', '226.1', 'mm', '2018-08-15 19:21:43', '2018-08-15 19:21:43'),
('9780470018095', NULL, '03', '21.8', 'mm', '2018-08-15 19:21:43', '2018-08-15 19:21:43'),
('9780470018095', NULL, '08', '41.76', 'oz', '2018-08-15 19:21:43', '2018-08-15 19:21:43'),
('9780470018224', NULL, '01', '252.7', 'mm', '2018-08-15 19:21:44', '2018-08-15 19:21:44'),
('9780470018224', NULL, '02', '176.5', 'mm', '2018-08-15 19:21:44', '2018-08-15 19:21:44'),
('9780470018224', NULL, '03', '38.1', 'mm', '2018-08-15 19:21:44', '2018-08-15 19:21:44'),
('9780470018224', NULL, '08', '41.12', 'oz', '2018-08-15 19:21:44', '2018-08-15 19:21:44');

-- --------------------------------------------------------

--
-- Table structure for table `nameidentifiers`
--

CREATE TABLE `nameidentifiers` (
  `id` int(11) NOT NULL,
  `x415` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b233` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b244` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nameidentifiers`
--

INSERT INTO `nameidentifiers` (`id`, `x415`, `b233`, `b244`, `created_at`, `updated_at`) VALUES
(1, '24', '24 1 nameidentifier', '22', '2018-08-15 18:29:22', '2018-08-15 18:29:22'),
(2, '02', NULL, '03', '2018-08-15 18:29:22', '2018-08-15 18:29:22'),
(3, '', NULL, '', '2018-08-15 18:37:23', '2018-08-15 18:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `prizes`
--

CREATE TABLE `prizes` (
  `id` int(11) NOT NULL,
  `g126` longtext COLLATE utf8_unicode_ci,
  `g127` year(4) DEFAULT NULL,
  `g128` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `g129` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x503` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `g343` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, '12', 'descriptivedetail - productformfeature', NULL, '2018-08-15 18:33:13', '2018-08-15 18:33:13'),
(2, '23', 'productpart', NULL, '2018-08-15 18:33:13', '2018-08-15 18:33:13'),
(3, '21', 'descriptivedetail - productformfeature', NULL, '2018-08-15 18:33:13', '2018-08-15 18:33:13'),
(4, '71', 'descriptivedetail', NULL, '2018-08-15 18:33:14', '2018-08-15 18:33:14');

-- --------------------------------------------------------

--
-- Table structure for table `productforms`
--

CREATE TABLE `productforms` (
  `a001` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `b012` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b233` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productforms`
--

INSERT INTO `productforms` (`a001`, `b012`, `b233`, `created_at`, `updated_at`) VALUES
('123', NULL, NULL, '2018-08-15 19:48:59', '2018-08-15 19:48:59'),
('21', 'BB', NULL, '2018-08-15 19:49:00', '2018-08-15 19:49:00'),
('9780470018071', 'BB', NULL, '2018-08-15 19:49:02', '2018-08-15 19:49:02'),
('9780470018095', 'BB', NULL, '2018-08-15 19:49:05', '2018-08-15 19:49:05'),
('9780470018224', 'BB', NULL, '2018-08-15 19:49:08', '2018-08-15 19:49:08');

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
(1, '22', NULL, 'productidentifier - b244', NULL, '2018-08-15 17:13:06', '2018-08-15 17:13:06'),
(2, '44', 'This is first b233 in product part', 'x', NULL, '2018-08-15 17:13:06', '2018-08-15 17:13:06'),
(3, '89', 'This is second b233 in product part', 't', NULL, '2018-08-15 17:13:06', '2018-08-15 17:13:06'),
(4, '15', NULL, '9780470018071', NULL, '2018-08-15 17:13:06', '2018-08-15 17:13:06'),
(5, '15', NULL, '9780470028667', NULL, '2018-08-15 17:13:06', '2018-08-15 17:13:06'),
(6, '15', NULL, '9780470028650', NULL, '2018-08-15 17:13:06', '2018-08-15 17:13:06'),
(7, '15', NULL, '9780470018095', NULL, '2018-08-15 17:13:06', '2018-08-15 17:13:06'),
(8, '15', NULL, '9780470018101', NULL, '2018-08-15 17:13:06', '2018-08-15 17:13:06'),
(9, '15', NULL, '9780470018224', NULL, '2018-08-15 17:13:06', '2018-08-15 17:13:06'),
(10, '02', NULL, '0816016356', NULL, '2018-08-15 17:58:01', '2018-08-15 17:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `productparts`
--

CREATE TABLE `productparts` (
  `id` int(11) NOT NULL,
  `a001` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x457` tinyint(4) DEFAULT NULL,
  `b012` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b333` longtext COLLATE utf8_unicode_ci,
  `b225` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b014` longtext COLLATE utf8_unicode_ci,
  `b385` longtext CHARACTER SET utf8,
  `x322` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x323` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x316` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productparts`
--

INSERT INTO `productparts` (`id`, `a001`, `x457`, `b012`, `b333`, `b225`, `b014`, `b385`, `x322`, `x323`, `x316`, `created_at`, `updated_at`) VALUES
(1, '123', 0, 'BB', '{}', '', '{}', '{}', '3', '', '', '2018-08-15 16:32:51', '2018-08-15 16:32:51'),
(2, '123', 0, 'BB', '{}', '', '{}', '{}', '3', '', '', '2018-08-15 16:52:02', '2018-08-15 16:52:02'),
(3, '123', 0, 'BB', '{}', '', '{}', '{}', '3', '', '', '2018-08-15 16:52:02', '2018-08-15 16:52:02'),
(4, '123', 0, 'BB', '{}', '', '{}', '{}', '3', '', '', '2018-08-15 16:53:31', '2018-08-15 16:53:31'),
(5, '123', 0, 'BB', '{}', '', '{}', '{}', '3', '', '', '2018-08-15 16:53:31', '2018-08-15 16:53:31'),
(6, '', 0, 'BB', '{}', '', '{}', '{}', '3', '', '', '2018-08-15 17:56:13', '2018-08-15 17:56:13');

-- --------------------------------------------------------

--
-- Table structure for table `productpart_productformfeature`
--

CREATE TABLE `productpart_productformfeature` (
  `productpart_id` int(11) NOT NULL,
  `productformfeature_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productpart_productformfeature`
--

INSERT INTO `productpart_productformfeature` (`productpart_id`, `productformfeature_id`) VALUES
(1, 2),
(6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `productpart_productidentifier`
--

CREATE TABLE `productpart_productidentifier` (
  `productpart_id` int(11) NOT NULL,
  `productidentifier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `productpart_productidentifier`
--

INSERT INTO `productpart_productidentifier` (`productpart_id`, `productidentifier_id`) VALUES
(1, 9),
(1, 10),
(1, 2),
(1, 3),
(6, 2),
(6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `a001` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'RecordReference',
  `a002` varchar(2) CHARACTER SET utf8 NOT NULL COMMENT 'NotificationType',
  `a194` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'RecordSourceType',
  `a195` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a196` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a197` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: RecordSourceName',
  `a198` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a199` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'v3.0: DeletionText\n',
  `b083` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail - CountryOfPublication',
  `b394` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail - PublishingStatus',
  `x512` varchar(1) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail->copyrightstatement - CopyrightType',
  `b089` varchar(2) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: publishingdetail->salesrights - SalesRightsType',
  `b246` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b225` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b014` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b210` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b384` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b385` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`a001`, `a002`, `a194`, `a195`, `a196`, `a197`, `a198`, `a199`, `b083`, `b394`, `x512`, `b089`, `b246`, `b225`, `b014`, `b210`, `b384`, `b385`, `created_at`, `updated_at`) VALUES
('123', '03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 18:32:27', '2018-08-15 18:32:27'),
('21', '03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 18:32:27', '2018-08-15 18:32:27'),
('9780470018071', '03', NULL, NULL, NULL, NULL, NULL, 'eng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 18:32:28', '2018-08-15 18:32:28'),
('9780470018095', '03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 18:32:28', '2018-08-15 18:32:28'),
('9780470018224', '03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 18:32:29', '2018-08-15 18:32:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_productformfeature`
--

CREATE TABLE `product_productformfeature` (
  `a001` int(11) NOT NULL,
  `productformfeature_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE `product_supplier` (
  `a001` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `supplieridentifiers`
--

CREATE TABLE `supplieridentifiers` (
  `id` int(11) NOT NULL,
  `j345` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b233` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b244` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplieridentifiers`
--

INSERT INTO `supplieridentifiers` (`id`, `j345`, `b233`, `b244`, `created_at`, `updated_at`) VALUES
(1, '12', '123 supplieridentifier b233', '12b244', '2018-08-15 18:56:51', '2018-08-15 18:56:51'),
(2, '12', '123 supplieridentifier second b233', '12b244', '2018-08-15 18:56:51', '2018-08-15 18:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `j292` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `j137` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_supplieridentifier`
--

CREATE TABLE `supplier_supplieridentifier` (
  `supplier_id` int(11) NOT NULL,
  `supplieridentifier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titleelements`
--

CREATE TABLE `titleelements` (
  `id` int(11) NOT NULL,
  `b034` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x409` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x410` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b020` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b203` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b030` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x501` tinyint(4) DEFAULT NULL,
  `b031` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b029` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `titleelements`
--

INSERT INTO `titleelements` (`id`, `b034`, `x409`, `x410`, `b020`, `b203`, `b030`, `x501`, `b031`, `b029`, `created_at`, `updated_at`) VALUES
(1, NULL, '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-15 18:29:22', '2018-08-15 18:29:22'),
(2, '123', '12', '12 titleelement 410', '1991', '12 titledetail titleelement 203', '12 titleelement 30', 1, '12 TitleWithoutPrefix', '12 Subtitle', '2018-08-15 18:29:22', '2018-08-15 18:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `websites`
--

CREATE TABLE `websites` (
  `id` int(11) NOT NULL,
  `b367` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b294` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `b295` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `websites`
--

INSERT INTO `websites` (`id`, `b367`, `b294`, `b295`, `created_at`, `updated_at`) VALUES
(1, '12', '12 supplydetail website', '12 295 supplydetail website', '2018-08-15 19:09:21', '2018-08-15 19:09:21'),
(2, NULL, NULL, '12 295 supplydetail website', '2018-08-15 19:09:21', '2018-08-15 19:09:21'),
(3, '18', NULL, 'http://www.wiley.com', '2018-08-15 19:09:21', '2018-08-15 19:09:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collectionidentifiers`
--
ALTER TABLE `collectionidentifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collectionsequences`
--
ALTER TABLE `collectionsequences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `containeditem`
--
ALTER TABLE `containeditem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contributordates`
--
ALTER TABLE `contributordates`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `epublicenseexpressions`
--
ALTER TABLE `epublicenseexpressions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `epublicenses`
--
ALTER TABLE `epublicenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nameidentifiers`
--
ALTER TABLE `nameidentifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prizes`
--
ALTER TABLE `prizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productformfeatures`
--
ALTER TABLE `productformfeatures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productforms`
--
ALTER TABLE `productforms`
  ADD PRIMARY KEY (`a001`),
  ADD UNIQUE KEY `a001` (`a001`);

--
-- Indexes for table `productidentifiers`
--
ALTER TABLE `productidentifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productparts`
--
ALTER TABLE `productparts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`a001`),
  ADD UNIQUE KEY `a001_UNIQUE` (`a001`);

--
-- Indexes for table `supplieridentifiers`
--
ALTER TABLE `supplieridentifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `titleelements`
--
ALTER TABLE `titleelements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `websites`
--
ALTER TABLE `websites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `collectionsequences`
--
ALTER TABLE `collectionsequences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `containeditem`
--
ALTER TABLE `containeditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contributordates`
--
ALTER TABLE `contributordates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `discountcodeds`
--
ALTER TABLE `discountcodeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `epublicenseexpressions`
--
ALTER TABLE `epublicenseexpressions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `epublicenses`
--
ALTER TABLE `epublicenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `nameidentifiers`
--
ALTER TABLE `nameidentifiers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `prizes`
--
ALTER TABLE `prizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `productformfeatures`
--
ALTER TABLE `productformfeatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `productidentifiers`
--
ALTER TABLE `productidentifiers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `productparts`
--
ALTER TABLE `productparts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `supplieridentifiers`
--
ALTER TABLE `supplieridentifiers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `titleelements`
--
ALTER TABLE `titleelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `websites`
--
ALTER TABLE `websites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
