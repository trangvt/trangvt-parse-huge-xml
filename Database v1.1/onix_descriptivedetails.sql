-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: onix
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `descriptivedetails`
--

DROP TABLE IF EXISTS `descriptivedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `created_at` datetime DEFAULT NULL,
  UNIQUE KEY `a001_UNIQUE` (`a001`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptivedetails`
--

LOCK TABLES `descriptivedetails` WRITE;
/*!40000 ALTER TABLE `descriptivedetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `descriptivedetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-15 19:15:37
