-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: tpl
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
-- Table structure for table `contributors`
--

DROP TABLE IF EXISTS `contributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contributors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b034` varchar(3) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->contributor - SequenceNumber',
  `b035` varchar(3) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->contributor - ContributorRole',
  `b036` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->contributor - PersonName',
  `b037` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->contributor - PersonNameInverted',
  `b038` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->contributor - TitlesBeforeNames',
  `b039` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->contributor - NamesBeforeKey',
  `b040` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail>contributor - KeyNames',
  `b041` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'v3.0: descriptivedetail->contributor - NamesAfterKey',
  `professionalaffiliation` longtext COLLATE utf8_unicode_ci COMMENT 'v3.0: descriptivedetail>contributor - ProfessionalAffiliation\nJSON',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contributors`
--

LOCK TABLES `contributors` WRITE;
/*!40000 ALTER TABLE `contributors` DISABLE KEYS */;
INSERT INTO `contributors` VALUES (1,'1','A01','Leroy G. Wade, Jr.','Wade, Leroy G.','','Leroy G.','Wade','',NULL,'2018-08-10 18:02:35','2018-08-10 18:02:35'),(2,'1','B01','Guenter Grethe','Grethe, Guenter','','Guenter','Grethe','',NULL,'2018-08-10 18:02:35','2018-08-10 18:02:35'),(3,'1','B01','David H. Volman','Volman, David H.','','David H.','Volman','',NULL,'2018-08-10 18:02:35','2018-08-10 18:02:35');
/*!40000 ALTER TABLE `contributors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-10 19:21:39
