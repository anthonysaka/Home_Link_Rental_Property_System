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
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_publication`),
  KEY `id_property` (`id_property`),
  KEY `id_imagen_preview` (`id_imagen_preview`),
  KEY `t_publication_ibfk_3_idx` (`id_usuario`),
  CONSTRAINT `t_publication_ibfk_1` FOREIGN KEY (`id_property`) REFERENCES `t_property` (`id_property`),
  CONSTRAINT `t_publication_ibfk_2` FOREIGN KEY (`id_imagen_preview`) REFERENCES `t_imagenes` (`id_image`),
  CONSTRAINT `t_publication_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_publication`
--

LOCK TABLES `t_publication` WRITE;
/*!40000 ALTER TABLE `t_publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_publication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-08 20:53:24
