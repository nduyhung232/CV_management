-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: CV_management
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phoneNumber` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idDonVi` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  KEY `fk_Account_1_idx` (`idDonVi`),
  CONSTRAINT `fk_Account_1` FOREIGN KEY (`idDonVi`) REFERENCES `donvi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,'admin','1','admin','01244049604',6,1),(2,'duyhung','hung','Nguyễn Duy Hưng','0978144871',7,1);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv`
--

DROP TABLE IF EXISTS `cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idDiaDiem` int(11) DEFAULT NULL,
  `idDonViUp` int(11) DEFAULT NULL,
  `ngayTao` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soDT` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idNguoiThayDoi` int(11) DEFAULT NULL,
  `fileCV` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cv_1_idx` (`idDiaDiem`),
  KEY `fk_cv_3_idx` (`idDonViUp`),
  KEY `fk_cv_36_idx` (`idDonViUp`),
  KEY `fk_cv_2_idx` (`idNguoiThayDoi`),
  CONSTRAINT `fk_cv_1` FOREIGN KEY (`idDiaDiem`) REFERENCES `diadiem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cv_2` FOREIGN KEY (`idNguoiThayDoi`) REFERENCES `Account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cv_36` FOREIGN KEY (`idDonViUp`) REFERENCES `donvi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv`
--

LOCK TABLES `cv` WRITE;
/*!40000 ALTER TABLE `cv` DISABLE KEYS */;
INSERT INTO `cv` VALUES (14,'Nguyễn Duy Hưng',4,6,'01/04/2019','0978144871',2,'../file_cv/DuyHung-CV.pdf'),(16,'Tống Đình Thành',6,7,'10/04/2019','0123456789',1,'../file_cv/ab503993-461a-4d93-9389-adca0db2c814.pdf'),(85,'Đàm Vĩnh Hưng',4,7,'04/04/2019','0941535795',2,NULL),(86,'Tuấn Hưng',4,7,'10/04/2019','0941535745',1,NULL),(87,'Trấn Thành',4,7,'04/04/2019','0941534527',1,NULL),(92,'Đoàn Văn Hậu',4,7,'11/04/2019','0982455618',1,'../file_cv/f521392e-78c8-4476-af40-ab18c6523ef1.pdf');
/*!40000 ALTER TABLE `cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_vitri`
--

DROP TABLE IF EXISTS `cv_vitri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_vitri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcv` int(11) DEFAULT NULL,
  `idVitri` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cv_vitri_1_idx` (`idcv`),
  KEY `fk_cv_vitri_2_idx` (`idVitri`),
  CONSTRAINT `fk_cv_vitri_1` FOREIGN KEY (`idcv`) REFERENCES `cv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cv_vitri_2` FOREIGN KEY (`idVitri`) REFERENCES `vitri` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_vitri`
--

LOCK TABLES `cv_vitri` WRITE;
/*!40000 ALTER TABLE `cv_vitri` DISABLE KEYS */;
INSERT INTO `cv_vitri` VALUES (1,14,4),(2,14,5),(3,14,6),(12,85,5),(13,85,7),(15,87,3),(16,87,4),(17,87,5),(41,86,7),(42,16,5),(43,92,4),(44,92,5);
/*!40000 ALTER TABLE `cv_vitri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diadiem`
--

DROP TABLE IF EXISTS `diadiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diadiem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diadiem` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diadiem`
--

LOCK TABLES `diadiem` WRITE;
/*!40000 ALTER TABLE `diadiem` DISABLE KEYS */;
INSERT INTO `diadiem` VALUES (4,'HaNoi'),(5,'HCM'),(6,'DaNang');
/*!40000 ALTER TABLE `diadiem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donvi`
--

DROP TABLE IF EXISTS `donvi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donvi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `donvi` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donvi`
--

LOCK TABLES `donvi` WRITE;
/*!40000 ALTER TABLE `donvi` DISABLE KEYS */;
INSERT INTO `donvi` VALUES (6,'VTP'),(7,'Viettel'),(8,'Tong Cty'),(11,'VTP');
/*!40000 ALTER TABLE `donvi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitri`
--

DROP TABLE IF EXISTS `vitri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vitri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vitri` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitri`
--

LOCK TABLES `vitri` WRITE;
/*!40000 ALTER TABLE `vitri` DISABLE KEYS */;
INSERT INTO `vitri` VALUES (3,'Java'),(4,'PHP'),(5,'Ruby'),(6,'NodeJS'),(7,'Angular');
/*!40000 ALTER TABLE `vitri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-16 22:39:06
