-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dwh
-- ------------------------------------------------------
-- Server version	10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_country` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_city`),
  UNIQUE KEY `name` (`name`),
  KEY `id_country` (`id_country`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Buenos Aires',1,1),(2,'Cordoba',1,1),(3,'Bogota',2,1),(4,'Cucuta',2,1),(5,'Medellin',2,1),(6,'Atacama',3,1),(7,'Santiago de Chile',3,1),(8,'Valparaiso',3,1),(9,'Canelones',4,1),(10,'Maldonado',4,1),(11,'Montevideo',4,1),(12,'Ciudad de Mexico',5,1),(13,'Tijuana',5,1),(14,'Florida',6,1),(15,'Texas',6,1),(16,'Tocumen',7,1),(17,'Tucuman',1,1),(18,'La Paz',8,1);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id_company` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `id_city` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_company`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `id_city` (`id_city`),
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `cities` (`id_city`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Dunder Mifflin','Scranton 526','dundermifflin@gmail.com','3514852374',14,1),(2,'MichaelScott Paper Company','Pensilvania 236','mspapercomp@gmail.com','03514859632',3,1),(3,'Central Perk','Nueva York 2698','centralperk@gmail.com','3516521498',8,1),(4,'455','995','555','44',17,0);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `id_company` int(11) NOT NULL,
  `id_city` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `interest` int(11) DEFAULT NULL,
  `account_phone` varchar(100) DEFAULT NULL,
  `preference_phone` int(11) NOT NULL,
  `account_whatsapp` varchar(100) DEFAULT NULL,
  `preference_whatsapp` int(11) NOT NULL,
  `account_instagram` varchar(100) DEFAULT NULL,
  `preference_instagram` int(11) NOT NULL,
  `account_facebook` varchar(100) DEFAULT NULL,
  `preference_facebook` int(11) NOT NULL,
  `account_linkedin` varchar(100) DEFAULT NULL,
  `preference_linkedin` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_contact`),
  KEY `id_company` (`id_company`),
  KEY `id_city` (`id_city`),
  KEY `contacts_ibfk_3` (`preference_phone`),
  KEY `contacts_ibfk_4` (`preference_whatsapp`),
  KEY `contacts_ibfk_5` (`preference_instagram`),
  KEY `contacts_ibfk_6` (`preference_facebook`),
  KEY `contacts_ibfk_7` (`preference_linkedin`),
  CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id_company`),
  CONSTRAINT `contacts_ibfk_2` FOREIGN KEY (`id_city`) REFERENCES `cities` (`id_city`),
  CONSTRAINT `contacts_ibfk_3` FOREIGN KEY (`preference_phone`) REFERENCES `preferences` (`id_preference`),
  CONSTRAINT `contacts_ibfk_4` FOREIGN KEY (`preference_whatsapp`) REFERENCES `preferences` (`id_preference`),
  CONSTRAINT `contacts_ibfk_5` FOREIGN KEY (`preference_instagram`) REFERENCES `preferences` (`id_preference`),
  CONSTRAINT `contacts_ibfk_6` FOREIGN KEY (`preference_facebook`) REFERENCES `preferences` (`id_preference`),
  CONSTRAINT `contacts_ibfk_7` FOREIGN KEY (`preference_linkedin`) REFERENCES `preferences` (`id_preference`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (3,'Rocio','Bodocco','Programadora','rocio.bodocco@gmail.com',1,2,'Oro 5110',75,'1569852364',1,'351-3695218',2,'@roxbf',3,'rocbf',3,'rox.bf',2,1),(4,'Stephanie','Poskib','Cloud Engineer','steph@posk.com',1,12,'San Martin 3550',75,'',1,'',1,'',1,'',1,'',1,1),(5,'Michael','Scott','Gerente','Mich@scott.com',2,14,'Av. Scran 547',100,'',1,'',1,'@Michaelscott',1,'',1,'',1,1),(7,'Dwight','Schrute','Vendedor','dwig@schr.com',2,11,'Florida 547',50,'',1,'3513332255',2,'',1,'',1,'',1,1),(10,'Rachel','Green','Camarera','Rach@green.com',3,13,'',50,'0365-5412398',1,'3516778899',1,'@rachgr',1,'rachelgreen',1,'rachel-green',1,1);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `id_region` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_country`),
  KEY `id_region` (`id_region`),
  CONSTRAINT `countries_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Argentina',1,1),(2,'Colombia',1,1),(3,'Chile',1,1),(4,'Uruguay',1,1),(5,'Mexico',2,1),(6,'Estados Unidos',2,1),(7,'Panama',3,1),(8,'Bolivia',1,1),(9,'Andorra',1,0);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferences` (
  `id_preference` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_preference`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (2,'Canal favorito'),(3,'No molestar'),(1,'Sin preferencia');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id_region` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_region`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Sudamerica',1),(2,'Norteamerica',1),(3,'Centroamerica',1);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rocio','Bodocco','rocio.bodocco@gmail.com','roxbf1234',1,1),(2,'Anonimo','Gomez','Anon@user.com','1234',0,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-28  3:37:25
