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
-- Table structure for table `t_card`
--

DROP TABLE IF EXISTS `t_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_card` (
  `id_card` int NOT NULL AUTO_INCREMENT,
  `num_card` varchar(16) NOT NULL,
  `user_owner` varchar(15) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `cvv` int NOT NULL,
  PRIMARY KEY (`id_card`),
  KEY `user_owner` (`user_owner`),
  CONSTRAINT `t_card_ibfk_1` FOREIGN KEY (`user_owner`) REFERENCES `t_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_card`
--

LOCK TABLES `t_card` WRITE;
/*!40000 ALTER TABLE `t_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_country`
--

DROP TABLE IF EXISTS `t_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_country` varchar(30) DEFAULT NULL,
  `continent` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_country`
--

LOCK TABLES `t_country` WRITE;
/*!40000 ALTER TABLE `t_country` DISABLE KEYS */;
INSERT INTO `t_country` VALUES (1,'Peru','America');
/*!40000 ALTER TABLE `t_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_imagenes`
--

DROP TABLE IF EXISTS `t_imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_imagenes` (
  `id_image` int NOT NULL AUTO_INCREMENT,
  `image` longblob NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_imagenes`
--

LOCK TABLES `t_imagenes` WRITE;
/*!40000 ALTER TABLE `t_imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_property`
--

DROP TABLE IF EXISTS `t_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_property` (
  `id_property` int NOT NULL AUTO_INCREMENT,
  `type_property` varchar(30) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `status_property` varchar(15) NOT NULL,
  `feedbacks` varchar(100) DEFAULT NULL,
  `characteristic` varchar(100) NOT NULL,
  `id_user_property` int NOT NULL,
  PRIMARY KEY (`id_property`),
  KEY `id_user_property` (`id_user_property`),
  CONSTRAINT `t_property_ibfk_1` FOREIGN KEY (`id_user_property`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_property`
--

LOCK TABLES `t_property` WRITE;
/*!40000 ALTER TABLE `t_property` DISABLE KEYS */;
INSERT INTO `t_property` VALUES (1,'Casa','Punta Cana, RD','Disponible','4','Comodo y amplio espacio',1),(2,'Villa','Samaná, RD','Disponible','5','Comodo y amplio espacio',1),(3,'Entire Apartment','Atsugi, JP','Disponible','5','Lo mejor que pueda existir',2),(4,'Casa','Samaná, RD','Disponible','4.5','Casa con todo incluido',2),(5,'Luxury Villa','Punta Cana, RD','Disponible','4.7','Tendra todo lo que traigas',2),(6,'Apartamento','ajksjdkasfasf','Inactiva',NULL,'asfasfasf',2);
/*!40000 ALTER TABLE `t_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_publication`
--

DROP TABLE IF EXISTS `t_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_publication` (
  `id_publication` int NOT NULL AUTO_INCREMENT,
  `titulo_publicacion` varchar(50) NOT NULL,
  `publication_date` datetime NOT NULL DEFAULT (curdate()),
  `status_publication` varchar(15) NOT NULL,
  `id_user_adm` int NOT NULL,
  `id_property` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `id_imagen_preview` int NOT NULL,
  PRIMARY KEY (`id_publication`),
  KEY `id_property` (`id_property`),
  KEY `id_imagen_preview` (`id_imagen_preview`),
  CONSTRAINT `t_publication_ibfk_1` FOREIGN KEY (`id_property`) REFERENCES `t_property` (`id_property`),
  CONSTRAINT `t_publication_ibfk_2` FOREIGN KEY (`id_imagen_preview`) REFERENCES `t_imagenes` (`id_image`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_publication`
--

LOCK TABLES `t_publication` WRITE;
/*!40000 ALTER TABLE `t_publication` DISABLE KEYS */;
INSERT INTO `t_publication` VALUES (1,'LA MELMA SAMANA','2020-04-05 00:00:00','Disponible',1,2,55.00,5),(2,'VALHALLA JAPON','2020-04-05 00:00:00','Disponible',2,3,420.00,2),(3,'Hermosa Casa Samana','2020-04-05 00:00:00','Disponible',2,4,69.00,1),(4,'Punta en la cana','2020-04-05 00:00:00','Disponible',2,1,75.00,3),(5,'La villa de los parties','2020-04-05 00:00:00','Disponible',2,5,120.00,4);
/*!40000 ALTER TABLE `t_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_reservation`
--

DROP TABLE IF EXISTS `t_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_reservation` (
  `num_reservation` int NOT NULL AUTO_INCREMENT,
  `children_guest` int DEFAULT NULL,
  `adult_guest` int NOT NULL,
  `start_date` datetime NOT NULL DEFAULT (curdate()),
  `end_date` datetime NOT NULL,
  `id_user` int NOT NULL,
  `id_property` int NOT NULL,
  `id_card` int NOT NULL,
  PRIMARY KEY (`num_reservation`),
  KEY `id_user` (`id_user`),
  KEY `id_property` (`id_property`),
  KEY `id_card` (`id_card`),
  CONSTRAINT `t_reservation_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_reservation_ibfk_2` FOREIGN KEY (`id_property`) REFERENCES `t_property` (`id_property`),
  CONSTRAINT `t_reservation_ibfk_3` FOREIGN KEY (`id_card`) REFERENCES `t_card` (`id_card`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_reservation`
--

LOCK TABLES `t_reservation` WRITE;
/*!40000 ALTER TABLE `t_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `name` varchar(20) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `country_location_id` int DEFAULT NULL,
  `telephone_number` varchar(20) DEFAULT NULL,
  `type` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT (1),
  `created_date` datetime NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `country_location_id` (`country_location_id`),
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`country_location_id`) REFERENCES `t_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'Juanjo','juan1@gmail.com','123','Juan','Rodriguez','Masculino',1,'809-912-6262','Persona','1','2020-04-01 00:00:00'),(2,'anthonysaka','anthonysk@gmail.com','145678','Anthony','Sakamoto','Masculino',1,'8299859919','Persona','1','2020-04-05 00:00:00');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-05  4:24:41