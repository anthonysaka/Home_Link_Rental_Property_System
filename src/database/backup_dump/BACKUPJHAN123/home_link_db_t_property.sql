-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: home_link_db
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_property`
--

DROP TABLE IF EXISTS `t_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_property` (
  `id_property` int NOT NULL AUTO_INCREMENT,
  `type_property` varchar(15) NOT NULL,
  `address` varchar(30) NOT NULL,
  `status_property` varchar(15) NOT NULL,
  `feedbacks` varchar(100) DEFAULT NULL,
  `characteristic` varchar(100) NOT NULL,
  `id_user_property` int NOT NULL,
  PRIMARY KEY (`id_property`),
  KEY `id_user_property` (`id_user_property`),
  CONSTRAINT `t_property_ibfk_1` FOREIGN KEY (`id_user_property`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_property`
--

LOCK TABLES `t_property` WRITE;
/*!40000 ALTER TABLE `t_property` DISABLE KEYS */;
INSERT INTO `t_property` VALUES (1,'Casa','Puerto plata, RD','Disponible','Wifi gratis, vista al mar','Comodo y amplio espacio',1),(2,'Villa','Samaná, RD','Disponible','Wifi gratis, vista al mar, desayuno incluido','Comodo y amplio espacio',1);
/*!40000 ALTER TABLE `t_property` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-03  1:14:07
