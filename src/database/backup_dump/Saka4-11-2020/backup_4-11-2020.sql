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
-- Table structure for table `t_address_property`
--

DROP TABLE IF EXISTS `t_address_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_address_property` (
  `id_address` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) NOT NULL,
  `city` varchar(70) NOT NULL,
  `street` varchar(70) NOT NULL,
  PRIMARY KEY (`id_address`),
  KEY `t_address_property_ibfk_1_idx` (`country_name`),
  CONSTRAINT `t_address_property_ibfk_1` FOREIGN KEY (`country_name`) REFERENCES `t_country` (`name`),
  CONSTRAINT `t_address_property_ibfk_2` FOREIGN KEY (`country_name`) REFERENCES `t_country` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_address_property`
--

LOCK TABLES `t_address_property` WRITE;
/*!40000 ALTER TABLE `t_address_property` DISABLE KEYS */;
INSERT INTO `t_address_property` VALUES (6,'Afghanistan','Santiago','Calle 2'),(7,'Afghanistan','Santiago','Calle Primera'),(8,'Albania','Santiago','Calle 4'),(9,'Afghanistan','Santiago','Calle 5'),(10,'Afghanistan','Santiago','Calle 5'),(11,'Afghanistan','Santiago','calle 4'),(12,'Afghanistan','Santiago','Calle 5'),(13,'Dominican Republic','Santiago de los Caballeros','Carretera Luperon');
/*!40000 ALTER TABLE `t_address_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_card`
--

DROP TABLE IF EXISTS `t_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_card` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_owner` varchar(15) NOT NULL,
  `num_card` varchar(16) NOT NULL,
  `holder_fullname` varchar(50) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `cvv` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num_card` (`num_card`),
  KEY `t_card_ibfk_1` (`user_owner`),
  CONSTRAINT `t_card_ibfk_1` FOREIGN KEY (`user_owner`) REFERENCES `t_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_card`
--

LOCK TABLES `t_card` WRITE;
/*!40000 ALTER TABLE `t_card` DISABLE KEYS */;
INSERT INTO `t_card` VALUES (1,'jhan','4987130025854568','Jhan Almonte','2023-05-00 00:00:00',258);
/*!40000 ALTER TABLE `t_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_characteristic_property`
--

DROP TABLE IF EXISTS `t_characteristic_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_characteristic_property` (
  `id_characteristic` int NOT NULL AUTO_INCREMENT,
  `capacity` int NOT NULL,
  `room` int NOT NULL,
  `bed` int NOT NULL,
  `bathroom` int NOT NULL,
  `wifi` tinyint(1) NOT NULL,
  `air_conditioner` tinyint(1) NOT NULL,
  `kitchen` tinyint(1) NOT NULL,
  `pool` tinyint(1) NOT NULL,
  `other` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_characteristic`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_characteristic_property`
--

LOCK TABLES `t_characteristic_property` WRITE;
/*!40000 ALTER TABLE `t_characteristic_property` DISABLE KEYS */;
INSERT INTO `t_characteristic_property` VALUES (6,4,1,1,2,1,1,1,1,'Hell yea'),(7,3,1,1,1,1,1,1,1,'Just 4 3'),(8,3,1,1,1,1,1,1,1,'Just 4 3'),(9,3,1,1,1,1,1,1,1,'Just 4 3o'),(10,3,1,1,1,1,1,1,1,'just 4 3o'),(11,3,1,1,1,1,1,1,1,'just 4 3o'),(12,3,1,1,1,1,1,1,1,'Just 4 3o'),(13,4,2,2,2,1,1,0,1,'The kitchen isn\'t available due to some remodelations');
/*!40000 ALTER TABLE `t_characteristic_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_country`
--

DROP TABLE IF EXISTS `t_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_country` (
  `country_abr` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_country`
--

LOCK TABLES `t_country` WRITE;
/*!40000 ALTER TABLE `t_country` DISABLE KEYS */;
INSERT INTO `t_country` VALUES ('AF','Afghanistan'),('AL','Albania'),('DZ','Algeria'),('DS','American Samoa'),('AD','Andorra'),('AO','Angola'),('AI','Anguilla'),('AQ','Antarctica'),('AG','Antigua and Barbuda'),('AR','Argentina'),('AM','Armenia'),('AW','Aruba'),('AU','Australia'),('AT','Austria'),('AZ','Azerbaijan'),('BS','Bahamas'),('BH','Bahrain'),('BD','Bangladesh'),('BB','Barbados'),('BY','Belarus'),('BE','Belgium'),('BZ','Belize'),('BJ','Benin'),('BM','Bermuda'),('BT','Bhutan'),('BO','Bolivia'),('BA','Bosnia and Herzegovina'),('BW','Botswana'),('BV','Bouvet Island'),('BR','Brazil'),('IO','British Indian Ocean Territory'),('BN','Brunei Darussalam'),('BG','Bulgaria'),('BF','Burkina Faso'),('BI','Burundi'),('KH','Cambodia'),('CM','Cameroon'),('CA','Canada'),('CV','Cape Verde'),('KY','Cayman Islands'),('CF','Central African Republic'),('TD','Chad'),('CL','Chile'),('CN','China'),('CX','Christmas Island'),('CC','Cocos (Keeling) Islands'),('CO','Colombia'),('KM','Comoros'),('CK','Cook Islands'),('CR','Costa Rica'),('HR','Croatia (Hrvatska)'),('CU','Cuba'),('CY','Cyprus'),('CZ','Czech Republic'),('CD','Democratic Republic of the Congo'),('DK','Denmark'),('DJ','Djibouti'),('DM','Dominica'),('DO','Dominican Republic'),('TP','East Timor'),('EC','Ecuador'),('EG','Egypt'),('SV','El Salvador'),('GQ','Equatorial Guinea'),('ER','Eritrea'),('EE','Estonia'),('ET','Ethiopia'),('FK','Falkland Islands (Malvinas)'),('FO','Faroe Islands'),('FJ','Fiji'),('FI','Finland'),('FR','France'),('FX','France, Metropolitan'),('GF','French Guiana'),('PF','French Polynesia'),('TF','French Southern Territories'),('GA','Gabon'),('GM','Gambia'),('GE','Georgia'),('DE','Germany'),('GH','Ghana'),('GI','Gibraltar'),('GR','Greece'),('GL','Greenland'),('GD','Grenada'),('GP','Guadeloupe'),('GU','Guam'),('GT','Guatemala'),('GK','Guernsey'),('GN','Guinea'),('GW','Guinea-Bissau'),('GY','Guyana'),('HT','Haiti'),('HM','Heard and Mc Donald Islands'),('HN','Honduras'),('HK','Hong Kong'),('HU','Hungary'),('IS','Iceland'),('IN','India'),('ID','Indonesia'),('IR','Iran (Islamic Republic of)'),('IQ','Iraq'),('IE','Ireland'),('IM','Isle of Man'),('IL','Israel'),('IT','Italy'),('CI','Ivory Coast'),('JM','Jamaica'),('JP','Japan'),('JE','Jersey'),('JO','Jordan'),('KZ','Kazakhstan'),('KE','Kenya'),('KI','Kiribati'),('KP','Korea, Democratic People\'s Republic of'),('KR','Korea, Republic of'),('XK','Kosovo'),('KW','Kuwait'),('KG','Kyrgyzstan'),('LA','Lao People\'s Democratic Republic'),('LV','Latvia'),('LB','Lebanon'),('LS','Lesotho'),('LR','Liberia'),('LY','Libyan Arab Jamahiriya'),('LI','Liechtenstein'),('LT','Lithuania'),('LU','Luxembourg'),('MO','Macau'),('MG','Madagascar'),('MW','Malawi'),('MY','Malaysia'),('MV','Maldives'),('ML','Mali'),('MT','Malta'),('MH','Marshall Islands'),('MQ','Martinique'),('MR','Mauritania'),('MU','Mauritius'),('TY','Mayotte'),('MX','Mexico'),('FM','Micronesia, Federated States of'),('MD','Moldova, Republic of'),('MC','Monaco'),('MN','Mongolia'),('ME','Montenegro'),('MS','Montserrat'),('MA','Morocco'),('MZ','Mozambique'),('MM','Myanmar'),('NA','Namibia'),('NR','Nauru'),('NP','Nepal'),('NL','Netherlands'),('AN','Netherlands Antilles'),('NC','New Caledonia'),('NZ','New Zealand'),('NI','Nicaragua'),('NE','Niger'),('NG','Nigeria'),('NU','Niue'),('NF','Norfolk Island'),('MK','North Macedonia'),('MP','Northern Mariana Islands'),('NO','Norway'),('OM','Oman'),('PK','Pakistan'),('PW','Palau'),('PS','Palestine'),('PA','Panama'),('PG','Papua New Guinea'),('PY','Paraguay'),('PE','Peru'),('PH','Philippines'),('PN','Pitcairn'),('PL','Poland'),('PT','Portugal'),('PR','Puerto Rico'),('QA','Qatar'),('CG','Republic of Congo'),('RE','Reunion'),('RO','Romania'),('RU','Russian Federation'),('RW','Rwanda'),('KN','Saint Kitts and Nevis'),('LC','Saint Lucia'),('VC','Saint Vincent and the Grenadines'),('WS','Samoa'),('SM','San Marino'),('ST','Sao Tome and Principe'),('SA','Saudi Arabia'),('SN','Senegal'),('RS','Serbia'),('SC','Seychelles'),('SL','Sierra Leone'),('SG','Singapore'),('SK','Slovakia'),('SI','Slovenia'),('SB','Solomon Islands'),('SO','Somalia'),('ZA','South Africa'),('GS','South Georgia South Sandwich Islands'),('SS','South Sudan'),('ES','Spain'),('LK','Sri Lanka'),('SH','St. Helena'),('PM','St. Pierre and Miquelon'),('SD','Sudan'),('SR','Suriname'),('SJ','Svalbard and Jan Mayen Islands'),('SZ','Swaziland'),('SE','Sweden'),('CH','Switzerland'),('SY','Syrian Arab Republic'),('TW','Taiwan'),('TJ','Tajikistan'),('TZ','Tanzania, United Republic of'),('TH','Thailand'),('TG','Togo'),('TK','Tokelau'),('TO','Tonga'),('TT','Trinidad and Tobago'),('TN','Tunisia'),('TR','Turkey'),('TM','Turkmenistan'),('TC','Turks and Caicos Islands'),('TV','Tuvalu'),('UG','Uganda'),('UA','Ukraine'),('AE','United Arab Emirates'),('GB','United Kingdom'),('US','United States'),('UM','United States minor outlying islands'),('UY','Uruguay'),('UZ','Uzbekistan'),('VU','Vanuatu'),('VA','Vatican City State'),('VE','Venezuela'),('VN','Vietnam'),('VG','Virgin Islands (British)'),('VI','Virgin Islands (U.S.)'),('WF','Wallis and Futuna Islands'),('EH','Western Sahara'),('YE','Yemen'),('ZM','Zambia'),('ZW','Zimbabwe');
/*!40000 ALTER TABLE `t_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_imagenes`
--

DROP TABLE IF EXISTS `t_imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_imagenes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longblob NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `id_publicacion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_publicacion` (`id_publicacion`),
  CONSTRAINT `t_imagenes_ibfk_1` FOREIGN KEY (`id_publicacion`) REFERENCES `t_publication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_imagenes`
--

LOCK TABLES `t_imagenes` WRITE;
/*!40000 ALTER TABLE `t_imagenes` DISABLE KEYS */;
INSERT INTO `t_imagenes` VALUES (13,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\Z\Z\Z\Z\Z( %!2!%)+...383-7(-.+\n\n\n\r-% %--------------------------------------+-----------��\0\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0P\0\0\0\0!1AQ\"a2q���#BR�\��3r��\�$CSb�����\�c��4Dst��\�Ud��\��\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\01\0\0\0\0\0\0!1�AQR\�\�aq�����\"#B2r�\�\0\0\0?\0wh�bܷ�\�\\D\�2A\�\na�9\�Ƶ\�؎sH(�\�A�\�\�\�\�_j^\�%�q\�^�\�\07++��d�X\�^���\�\�[�n�\�\� ���*cq�\Z\�\�\�fq\�^f+<�1�\r�♅}N\�F�o#nc\�*\�� \�bQ�]VH\�N�\�\ru�U2�x\�d\�\ZI�A��Zɢ\�F\n�.f\�H\ZxAf\��R@\�}����V2:\r�\�ȃ�\�G\0��\�\�`\�\�#S�\�y\�hl�+�\�S\Z\�)q��e�,�s6\� �}i�ؙM���\�1l�԰�ϣ3ˡ\�\�^��q\����x�+~��V�\�\r^O�\�\�I\�4�*T\�` jI\� ��+л	x>P�\�y�r��;��*\�ֈ�6xk˰�N�]�ލ\\LWCD��-\�\�ج�3##8,-�y���\�H\nd\�F�\�\�p��.wfse���ҹK�\�\0�\�:\�D\�-�\�\�<�\�D����*��p\�w�o/\�\�0D��^C�\�n%&f1��kMi�\�2\01%�J�Hɠ`I:\�,+S�\�Iy�!�\nP�rHo0A�\�W\�j�.\�q�ul�S�\�\0\� �\n\r\�9:s	�\�v��	͝CK\�\�K2�\�v\�\�5�5z��\�;5\�\�\�\�-�	\�\0�\�`\�\�I�s�e��	\�/����T�$�w��U�\�蒿j��n�1V������4d{]\�\�YO�I;�h`A�]\�\�\�*�G\�^,c1uԂ	\"I��\�[�\�v��b`(\�#+D\�F\�X�=\�9\�[�F\�\�b-��\�9|L�\�	\'��r�24\�QT��\�;˪\�H�\�m�~�49r��Oƕ\�\r�U[�A3�\�\�\� \�9u�o\��V\��\�d�\�H5!.l��6\�N��g�X2p�\�0{�ubAP>):\�Pft\�|鵥�\�Ա���\�P2\�\�Lh#��\��<V\�\�\�\�\\\�d鮑�Y\�<\�p�]\�%��%s?J3D�[A��F\�\0�ӹ\�\�\��\��\�vp�`�\�&qY�\��;\�^\�\�9@+��\�$X�\�:���E�rkx\�ՙ�C�T\�n����\�â�]rIq(g!^4\r\�Fފ��B\"�\"���P0�$�=*�iQ`y\�\�\�\�X�0\0h\�<�N\�{LUX�S6��\�P<�\�\�\�*-�g�|J\�\�\� 	#\�#��\�`8U��{�\�\�$�9X�S�)\�.�bd�\�i��NOC�˹?6d��}\�}�\�\�޴�n6#U�d\�@�1�L\� U>)PG$���j���j˳�¹8�\0���m#HӜ5Υs�32\�-��\�\�`g�\�j�N6@$e�\r%�e��\�\�F�o\ZP�]��J��\�Pv؝>\�\�Y��\0k2f�9\�\r�LB�\�#-�\�\�er��\�*\�\��4��_�R��\�\�!��3e��\n\�\�H�\�W�n#w\�P%�P�2�\0�\��u��e�W��3Z!�+��r�Yl�A\rrDε�\�d�\r\�\�u�\�\0�Ò\�9!�mʓ:��Ԫ\�j��\�\��?í/x\Z\�g#f,�|-\�҆vК\�vcn\��*[7-sӐ�3\ZVГ�Ih\�v�\�ۘ����̤�iʠ\�r�\�2u��\�;ٮ-k\�\�\�*̆T\r� i<��b�f�\�\�pĄ*\�;\0	>@חc,Y\�^aj\�Uuݐ|AL\�\\��\"GX΢|\�h�\�Kw-2]\�^Ӊ\Z�ǻi1 \�:f�:\n;�,%ҏu\Zݿ���\�\�*#0\�ϤU.\�\�/*5��\0�y iy\�L�W��!���qb\�,�r4�б\��\�e\�Yu\�\�\�\�\�\�U.@�P�\�F�\�\�Z@#PD�\�\Z\��7��LeE�\n\�$��bI`C�^D�ηx+*��\"���A\�\�V���u�+mK4�\�	>�7�\�&j��<7����7�eH\Z��>D4��y\'ilZ\�_8��m��Hՙ`�wY i��\�*\�s��U�\r\�\�w���ַ�\�\�Z�0\�\�\�\�Hf!��\�#(��f&4:MR\�xk\�qiF��;\�Fmm��\�\�\��I�\�h�Xá\�\�\�NPCꤐ\�hO�1c�M�0���90�劷�):�&G?*�\�pĶ�\�Rʡ·�\�S�\r����	%\�m\�	.���\�2B A�\�0�\�	&b�Ew��	�\�\�t\\�)02��;�\�}�\�Ī.�m�rt�F�\rĒyj+I�E�\�\�X�\�r�rP7\�!���4\�\�[�{��KX�\�؂\�\� hD\�I�\"Hܚ \������\�Ki�c\�\n5\�:�\�\�\�|�^��Sf��\�\r`\��yqm��-�D�\0b|`��\�XG�\�W��\�Ar\�-�p/�`h~��\0@��6�bi[Xz(؁]�\�S;iT\�U�J\�U�\"&��{�kX\�D\��*{�Cݚ\�\r�4�!��ٱ4Xwuڳ\�)R��\�-�\�dn\�\�r�\�\��>	\0O0|�l-\�SF%r4� ��1�O�]\�\�V\n\\\\�\�,�\���0Ĩ�ņ\�Tr�\�q�6wn[,5�`��6ʍG(=8\\iY�e_p\�3[R\�{,\'\�͔5\�6��.m��\�FB��\�\0ae�\�4�5�`\�\�\�\�Q1HЌ�,Þ�mZ>���r\�Rn*ړ\�Ƣ>�׬O:��E\r����B\�9\�`�\�#Qˬy\�]\�\�]\�!\0� ����w�%]��\�\0�\�i\"6\"�:\�\�y�\'\�R\�cs(^DA\0H:A\�\�\�j\�ڋ�DM���5�\�9\�\\	��\0H:�FJ\�t3\�\�\�\�mV\�,nR%A�Iӻ}h$z;���f\�`\�[wgmF�4�W[~�1<�8�\�<��\�+4�\�ORH�-�\'\�}+���.\�P\�},��\ZD�gMɫ\�=\rtUyաtAVy+*P\0Cx[+�ȟHLLf\�Z�\��b�#\0\�6t͓77�&ga$Ϙ�\�}�\�\�%\�]\�Z\�(e��d�t\��$\�:͜%É$-\�[%��\�\�6�c���	�\�|�\�h�\����B�T�\�IB21P�\n�ѴQ �\�6�I�vz\�\�ή�6i��\�R�H$zC);\�\0f�F���Y~Ky@RenO\�\�7���\0\'}��y�عm\�$���!��d곯:·f\��:څX�R\'�:ӭa�G�w�\�E\nNց̩\�LXB\�Q �A\�l:�<�b;A�[꘧�B;[p#\�4�xZ8\�@��V��ČM�ȷr�:\�9�@9��:F�\�1�\�\�>H�/[d��@F\�\����\��g8��j���v<d/\�eAo�:�#���\��\�\�5˪��bI;+\�e	#�=kqĻP0\�\�,3wBдČ�f�ٶ�d�?�@+\r\�\��Z��mZr�$�1�k\�\"mC\�{7z\�\Z\�\�Z\�e&\�ȋ�\�Y&�u\�\\>�\�U=\�gu%�s$N�F@�@\n4�\�p��w�5��V\�b!I\�Qu�\�ySbq\�Ź�-\�)0�\0ruV\0�\'R3n&�4=�\�]�\�u��+d0��2\0P|C\�m\�i\�\�ֲ\\/i�*\�\n{\�u\r �D �y	�\�J��v\���K�\�\0u�vӥb�Wږ\\\�-!K�\Z.3\r[4lA1�N�j\�&�%�-�ew,�@bĪ\�\0�\0\�F��-\�m�\�=�n!T�e#Q:�{�bv�9\�cȴ\�+\�\�Q�����#\��\�t\�+w\�n\�ټ�\�g\�v\�z��r�\�}�2�LM\�Z\�ˑB�\�\�\"��\�i4&Mh¢�e�&�3\nf��h\�\nM\�\0%��mEY\���U�\Z9�\�\�CQ*E�\�^|�:Ҩ\�t�\��`�C��fP\�c)#6\���SV\\��l2�eDf�Y@���\�\�Z�[���l\�I���t�L��\�5�j\�㔺*�3h�0@�5\Z\�*\�s4~Ϊb1s��\�2 \�� \�F�<�5���3[U\rȑ\�\��ֶ\�x�_\�\�v\��:\�\�\��N`ڗ\Zs\�\'�SvK\�|[��y��\��\�\rp\�\"|���WE��?JuA\�P�\�K$\0����2�`��w\�q�騫Af�{\"�8\�\�\n�\�\��130r\Z���\�\0�\�\�\��\�C\�Z	\�(mg\�����35��\\��ic�@������!�2#�Ų���\�:�6\�i\�P:>pm[V�|\�I10d(̻Lhv�\�8�iT�T|\�f�\����K��#k\��Sf�L9$\�\03�Q��\�`t\�]6��$�fz����8\�Ţb\�\�f\�3f,��\'\\\�t�y֋\rz\�Z��;˄#���ԓ��]\�̊\�/\�bHށ�\�\��$��Ab�)f��$��+<8\�\�?\�\'�jT\�\�\��v�ub��=\�\�h�d\�g8W�xkI+n�!��75\�H>�9\�ݛ\��.%܁fʆc9��\�t<�& ��Ua۲l�\�\�s̢��kXѶ��\�\0\�\0��\�\����uE�rx_Cj�b�QXq\�om\�붿p��9{�_�1P��O���kO\�V~Sհ̸�LC\�9,�\�	���A�6%�\�R��\�n\�\�ᔗ\��X��U�+y\�ݱ\0��IGv�՞��T�N\�X�0\�AR�ʧ~{zS�<�E/h\�\�]Pprx_C#�\�^ \�]1���\�ps\0 \�dk\�uZ\�v�\�e�\�4�\�\�y[̒�\�i�֜���X?{{2�a@�d�\��]�\�\�^���+\�\�J2rQ�1\�\�Mg\�\�]Pp\�\�}\��ى\r\�\�r<Zj&A\ZZ7\�N\�z\�g0�{�ܷt�u,	@�d-\�Y�\�哻͟1@I1De n4\�Z��zm�}\��[eKr�e 4څ��uB\�Ϲ�\��/����,��\�\0\�e2%�ᑻo�W�E�\�l�#:\�K�Lf\\\�\�\�$\�\�RMKH�\�\��-�g\�\�@\0Dm�=i\�n\�\�*��I\�@$�CMG�l~%\�\n~\�	��^$\\!�vd�h�\0\0·I�J���&\��;�\\y�H�X���% \�\Zz$N�Z\\e\�J����\�\�\�}���|\�\�.��P-,(\�E\�\� ǨB\�1x�TO\�_�`�@ �y�I�MnH��}e8�\�ٚ�\0xm���\�\�h�<M�B�\�\0@���\0ml��o�.��N\�\�\�䩭a&��\�\�?�o\���\"v���\������\��b\�\�\Z�\�\"\��\�X�\�\'���\0DTo\�\Z\�?\���y�\�׸\�w#�;\�\�V�R�\�\�e eUw\�L	��}h.�mJ\�W��\�J�\�{�S�\�Wx�]\�\\-��Sq�\Z�	3\�\�5Z��\�\�MN�\���H�\�[�$G��$~6�-`\�P`\��b r\�6\�\�γrlt\��ћ�.*\\\�X\n��`�\" � \�!4wc�%n\�����\�ʐ|�|\�팶\�(В�\0=>{\�61e�S\�W-�\�#q\�@\Z��\���8��S���^\�\�A�� \�t2z�_�f\�\�\�\�iK\�\�%�\�FU9t��\�;�7\�]\�2+0U3��$\��\�L\r\�[\�[(��F#.I�0I0F�#���j����\�X�8�\���\nW.di� 1ц����?��\r�e]T��\�:f\�Μ�F���^�2\�@X�p�\�[����$�=\�\r��\�b\�\�M-� ��\�6\Z\�E�\�3j\��F)�	\�VSR��b�`5�\�7k0��g\�0�c�!W_#��y��g�|t���\�r~\�\�[%�M\�\�\���}��\�\�O�W\�I�W�\�q��{\�\�[,Ô_K\�\Zf=(|O\0��\"\Z;�\�H�k\��!\�\�\�u�_\��2ƌ\�m�\�\���KΖ탚\".I &WM�o�v\�5?\�&�\�	�gd�\�{�\�6n\�\�jV\��\�\�W\��\�S\�\�V�E\�A\�n\���;Y�\�\Z᎖/>I\�*��\�\�a,1S&ړ�\�Sa8%���\r�\��G�?}G�\�\�ׯ�\\W��L�\�\�\����i& ں��և	�BA\�\�,��V+�\�&\�cl��\�I��|潧�a@\n\�{*�U\�s<\�ݘ.\�q�V\�x\�\�T�\0�\�H�#�\�y-\�m���\��e�\riv\�\���\�K\0\�\�\�J\�V\�\�v�RJn/�\�2����\�u�\��\0��\0uXa{M�\�1}Fh�6�G\�S\Z��T�\�+��9t���\�p�l\�g�5��\Z���ډB-��$Г��1�\�\��\0���ʓ\�\�m\��\�V��p�\"\�\�S�9\�\�r�F�C\�O��,�RW��M\�\�\\��]�W�{�OS\�q]��\�Ug\�\�\0\r�������r���}\�\�\'�[���\�X��?\�[\�W�8p\�^�ɳBXԗoyş<��YB\�\�\���6Ŏ�\�WOÇJ\Z�+��\�\�Ĳ�\�\�\03Gp�\\q��ң����=U�\�x0hNQ0�\�\r�sS\�\�\�\�p�,۴�\0\�LD�@�:Q\�\�Jn�+���U\Z\��T��W�v��Wn�P\�퐒<:����ss3�f��f�r\�w\��\�m��\�l�{��\�)���#�${��J�,�.��\�*v�f�ؑs/�9t\"\�f\�\Z:\�\�A\���\�@B_V�11m\0�����=�\�oaS��N\\�+�؟�\�\�\�\���\�\�˲_@;}��̩p�\"(e�՟\�>\�\�s$� \�_\�_N�ꦯ�wW�_�\0�\�x~\�݉�+w\�(��\����\�.ƈ��\�&\�E\Zg*�Pm\�>ꭻ�vԹ&D�i�F�W\�\�07:��\���j\��|=\�N���q{f����\0�b\�\�\��s�\�}��\�v\��!&�L��G/���?�3h�\�\�jEE\�r�\�\�e?\�\"El��;\�v��\0Y[\�~\�M��}��[G\��\0e\�\�:�:8\��S��W��\"w�\r\n�e���.̀17�\"\Z\�ߟ\�?\�R�<+�\�9���\�r1W̟\�r�\�\���G�*֙Xwy!�CHq�GC5\�ش�U��j�\�4��F�\�=\�j��\�\�m���\�E\�\�9\�\�t\�t��\�K�\�I\�M{\r�\�\�\�/�U���ue#� �Aӹ�A���\�f\�1x\��e*F�璉C\�5\�t�\�\�\�r�`J�\�\�R�\�H\�������Q�I�}�?\�\'y��\Z\�^c�47f.�\���\�\"GP*�\�4+\�K]�\0��\�\'{�iR�w):�%�G�J\�qXF\�H\�\��שXĤzK\�\��\��p�N�\�?�kj�\�wOW�/\�].\rF)�6�tڬZw+��Q�bk\���\�\�n�e:9�]i{Qp�I�~yw\���\�-�\�G��7:\�\�\��\���)�$�H e�\��Xv7�\�e���\Z�\�&g��\�a�m[q\�z\n#��\�\r�\0춹\�1T*ܕ�~Q�\�\�/\�N+\�l�7@��\�ߘ���q�!w�!D\�4\�U?�;����܇\�>T�2�K\��Q|�8p\��J\�_\�7�\�a����j�Α\�r�\�/�V3�����\������ŋG\"\���\��{�\"Q\���>�$t��C\�փĕ\0\�(�r�\Z����믕Gz\�:K��J��Z�\�*7\"w�{Ǿ�\�G\Z|5�}\�\0��`�\�ԑ\�5ku��[\�~K��yW�v\��\�=J-�f��\"G\�\�/a����~v��P\�I�i�s�\�2�\�x\Z��2O��PI|F�\0m*,Tz\�\��Ѻ�\�`�/j�Y�p:|\�\�\�\�±\0�A K�\�V~\�c�7.��\�!FRB�֎�;��q\�Ru���̢Ҿ/R\�v���\�P{]~\�z�~g�E�y|\��ɬ�\�5ջ�\�\�\�<]\�؝\�DZ\�cU8�\�b-@�dݹ݉K\'\\���}J\�O���M�\�܋\�9�\�\���)Ã\��\�\�,��~�\�}��~\�\�\�lԷ�S��\���\0tß\������?��E\'%\�z.	q?5�$rĆ�\0Mwv\"\�n�[diG�p&�\���Ѱ�S��\0�\��3��\n+*�J+x^\��\�t�\�\�\�\�\�\�z�\Z�����u�/�\�\�9ʭ\�7\�a��Ը\�1�L��\�\'\�H?\n�\'\�}\�]`�Y\�IcZ�wcKx������w�ף�lmk��9��S\��k8\'\0�\�7/eb0]�\�%ۗ3\�!\�0�x�jr�м���E˶�e�,{Ҡ�9L�_)�x7k\�\�-��\�`�\�\�\�[{U����˄\�i\�{쨣)��ip�\'j�\�*\��E��W\"#�\�$�Q#B4\�Tv�\�#�oퟺ�\�cz\�]L#�u��A �\ZEs\�c�\�\�}}M�\�\�a�\�wWG[L\"\�AF\�\�b7�\�����bP���\�\���u\0\�\Z�롁�	�\�\�Y{\��f�~P���m\�M\rs�x�\��\0ʷ�S��w}W�,S}�G\�i86��XtmM�E�P@#I\�\�Q[\�=\�(v\"\�\�\�E �W\�X����\09H���\�\"U�\�UH;T#�8��<��ns�\0ʔ3B\r\�E��	\�ST\�\�h�\�dn޻i\��h�\�\�,ĝT�\�M�nͿ�\�\�^]�\�f(�\�\�\�\�zn�>�Vg�\���\�}.���)m�oT��a\�s]\�\�\�[\n�?�\�F��k\�U\r�	�y�h#Ӻef۴���.t�\�/ew\�\\S0X`\�\�C^\�.c,\�+9OGn/��4K,4Mt/�\0�1B`\�\���>\�*��p\�\�<�\�R\�mկ4\�\�/�\�z\�q\�g��\�\�6�cH����\�c\�$l}U\�>\�U�.k̿﻿��5��uu ���w �|��r�+\�IbvP9�\�\�rv��\�xY�%^#>\�䦙�\�8�\�\\\�?u�l\�i\�ԙ\�̞����\�\�\�E�S�Al\�L��\�w���KL�\0?8����߉��h!b�\�\�m&u\�ʟ�b�L\�\�y0\r\��;N\�:\�~)(EF)���6\�7��#�\��\�?\�`~��s�a�G���W�\�;i�S\nn��\�#�H�\�΂\�v\�\�u�\�i\'}zu�KѢ5\\�\�\�\�{怶\�\�٧\�a�\�\�7Nvf�\�\�ImĒI\'\�Sb{C�����t`b:�]�N^��T9.�6\�0��D�:\n\�\�v#_UKf�:4;�\�P&u�\\����$�r�B\�i�*c=\�w�9�\�U\�\n��[E�I��2Lz�5m�a�H\�\�(�\�p\��[7���IO\"c�Ӿ¼GS\�\�*��\���s\�2��#c\��UOiG\�`�c�Ew��2\�5\�q\�R�$\�a\�\'s�<��\�\��\��p����{\��3�\���\�\�,�#@܊z	\���7\r7� \��\\M�Qr\�r:�	�\�I���\�%��I�QX\�\��\�\�$�\ZNX,O-Nլ{�*\rI\�\�|VҜ�o���>lo0:�\�\�*�g׿O?]i\�?�@}WNf�1\�<\�\�Q�V�yP\�g�\'I��\�\�_\�\�8O���T�\'?�\�g\�^�\0TU�\�\�a\�q�\�n�=�t��pd�\0��4��c�Z�\�8I�o���b\��:\0p\�$s\�\��\0 �k�t�j\�?m0M���\�h�Օ\�\�\�Z�\�\"\�I\�t�kq\�;�0��x�\0�z�U����\n�#�#m\�\�vێ\�ǖ�s\�\�u\�\�\�b.\�Sa.�\�\���\Z\�*\���z�ήoY\�\�N�\�yx�2ŸF���\�:��K�\�C0�0-k?�\��\0\�l\�\��N\�DL^�­\�t�s\r�\0��[��f\���+Ε��\��\�-c�ۉg�����MT8�0[\�\�|�\��-ZK�י�MQ\�S\�-��P�\0\�k�\�9�\0\�%�\��F��\�L(\�I�\����4\�pO�\�y��\Z~7�p�+;};�\�=x����=��︧\�\�`x�\�\���\0\�\�5�\��:9VW��\\~��}pn�a�W��E}?�\09\�4�\0y�>ڿ��A�D\�f֟ϯ�nVX\���I_\�$}����\���`s��~�\�ŭ��(\�#���^�\�\������np\�h�.\�Dq�Щ����]D�\�\�~�\���I�~j(�*\n�$!]H\�\�\�G\�5\� 맗���K\�hN䑸�\'\�J\�\03\�-�\0w�Դ&�\Z\��-\�A9uMv\�� y��t\�Q[�\�6�Ҭl\�F\0���\0o���P\'ȇW�\nTp\�y�ꟾ�U�t�=��|_HO��\�b\�aj\��\�2�L��\"1�\�d��\�U?\�.!TbN^\�W\"|$��:W�cq7��|�P�\���\�~u\�\�\��\0���.WMh{�\n\�Zݺ\�ٹl\�$�\�A!d�۝ۜpa�\�\�b�������{n�߂շ/\�s\�&4�-��nvެ8\�_\�a\�\Z\�wp\\n\\s9]9�\�\�\�\"���\�\nKS�\�X�\�\�b$ʍ�O�\�vV�ˊe9E�K�H\n�s0&\�\ru\�\�\�Y�_!�6\'\r�&�\�=\�\��m^\���\�a\�KAyw�s���$g\�k\���6h\����(��\�\�\\��\�2\\7/0uu*�+ �H#siUw�0\��\0(�qcT�\�\0rZ�0t0M�#\�Q6?\0\nsF�\�\'OX\�Û\��\0���\���_���#Q�\�}\�Uu�̓�\�Fb8����菺�ob��3������\Z\�]Q��C��\�X\�\�]\�\\̥�\\X\�L\�k\�\�z\�~Own�\���X.#��\\e`\�u%�vNi \�I~�\�\�1\�ԋ}\��!IPIܝu:\n\�\�\�\�9&߽y��އ�\�]\rc�)���,:�e\�aj\�*\0!HQ��gA\��И>\�8\�n��xG\�\�\�\�G��\��\�ո\�\�ˌq���\�[\�.{*���.\�x ��t��\�J���H��\��=Z�g~]��\0\�\�����?���X\�\�?\�\\9\��\�JRZ{\�\�o�&<)�v�Fq;9P�\�/\�\�6vh;\n6�Iz�OE�0��QD\�(��csP.u����\�\�ں�1��K�,�\��\0\�\��\r16O:��0\�\�3	P�q���맲�ߊ+{���A\Zu\��\�`����)�#MDo���ʇ�d\�$�i�i\�У�\0&\�\�5~�kҨ�G\�b\�\��^m�\�[bw�ʞ�QH\�\�ϓ��M+�B\�\0��\������dLi\�0\�P�Z�טd\�-ܸ\�>Q�[[���\\5�0�\�%\�A&9V{	�Ū���\"\�\�\\�\�oP|��ӈaW�\�l�1���\����\0b�@�\�\�\�\�ʣu]W�~\�|\�\�A��|v�&ǉ5\�/�e阃�y\�q�:�e\�*��WU ���4${jk��\��(�g���g��\�\�\�y��g���\�\�*\�\�;\�\�\�z\�|�]�[k\�\"!I$�V\�mi8�-o�W,˼1f�H�����&\�.\�9J�B\"c]��\�[dߖ�u�G=�\��\�F�rZ=٨[�=[\�\�\�V�\��0A>q\�s/�sG6e�\�6��\��o:O-y\Z�I����Y\�\�zy\�\�^��P=\� A\�o�\�V��6\�s�X+��4�]���\Zo�?U^=\�?\\z�G��\�C��if@\0�t޴RLFw\�m\��\0�\�Z!��u��b�2��\���bܝn{��~L��@$�-�d�\�\"j\�\r�\��\0Zଞ.���gXϮ�q���\�<�e,\�\��f�r~\'Ջx;���5^nQ]\��\�\����a�\�Q����\�ie<\��P��z\�\���U:\�zϴ\�\�	9ӻ\�4h�r�G�龍\�\\0�u�\��\�\�\�m\�]�4�Hvޑ\�\�\\2\'�\�K�ʎ[��ut���\�6\��\�C\�G	�w���\ZL\���h\"\�\�H}�\�\\\�9}t��\�\'\�\r\�7�i�\�\��8H,7?�Ɛ�Aw�\�\�N�\�(\� ���Κ�n?�O�	�\�H5\0�9\�O�+\'��\�P\�=_�\�K��UJb>��������\�v\�M[�\�\��ꨑ4\�DQN\�\�_}-�>ڭ@��\�\��Ҧ*$\�9G�S\�\�\��\n�\�7��<��:����9~4չԊ����Q@sO)���\0�\�œ�댺\�*(jac\�\�M`y�u\�@:Nk��U1|�\0h��`\ZN.y\�\r\�:�ڢ�>^T\0���:xb9G����g\��\�K\�\�I߶\�TWA�*�oB�o*(t�\����;��}�=i�\�R\r	؞����`�f\�CQ�~6�\�A\��\nB\�\Z�=�uB�Wo\�]\�@�\'\'�\�\�\\ߥq\�\��i�ϫ\�@\�?7Zc]Tbk��T�6 R�H��\�~4�X\�Z�7��sʂ\�H\\\�h�M&h\�\�ΣfPht�\�\�a��¸\�\�	lpq��M*ad\�s�\�*UE���p\�H��yWiPI�>���\�\�J� ��ޝ\�\�\�J�+�]��\�J�:@�i� ҥ@3��]$s�J���h\'\�Qg=*T<�#ZhSJ�!\�\�\�S�yR�B\��\�\�~\�T\�g	�;M*T��,k\ZT���\�Jc�&�*0z��ԩP$\"\�\�q֕*\0��v>�\�q\�J�G=��R�#�\�','Preview',4),(14,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\Z\Z\Z\Z\Z( %!2!%)+...383-7(-.+\n\n\n\r-% %--------------------------------------+-----------��\0\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0P\0\0\0\0!1AQ\"a2q���#BR�\��3r��\�$CSb�����\�c��4Dst��\�Ud��\��\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\01\0\0\0\0\0\0!1�AQR\�\�aq�����\"#B2r�\�\0\0\0?\0wh�bܷ�\�\\D\�2A\�\na�9\�Ƶ\�؎sH(�\�A�\�\�\�\�_j^\�%�q\�^�\�\07++��d�X\�^���\�\�[�n�\�\� ���*cq�\Z\�\�\�fq\�^f+<�1�\r�♅}N\�F�o#nc\�*\�� \�bQ�]VH\�N�\�\ru�U2�x\�d\�\ZI�A��Zɢ\�F\n�.f\�H\ZxAf\��R@\�}����V2:\r�\�ȃ�\�G\0��\�\�`\�\�#S�\�y\�hl�+�\�S\Z\�)q��e�,�s6\� �}i�ؙM���\�1l�԰�ϣ3ˡ\�\�^��q\����x�+~��V�\�\r^O�\�\�I\�4�*T\�` jI\� ��+л	x>P�\�y�r��;��*\�ֈ�6xk˰�N�]�ލ\\LWCD��-\�\�ج�3##8,-�y���\�H\nd\�F�\�\�p��.wfse���ҹK�\�\0�\�:\�D\�-�\�\�<�\�D����*��p\�w�o/\�\�0D��^C�\�n%&f1��kMi�\�2\01%�J�Hɠ`I:\�,+S�\�Iy�!�\nP�rHo0A�\�W\�j�.\�q�ul�S�\�\0\� �\n\r\�9:s	�\�v��	͝CK\�\�K2�\�v\�\�5�5z��\�;5\�\�\�\�-�	\�\0�\�`\�\�I�s�e��	\�/����T�$�w��U�\�蒿j��n�1V������4d{]\�\�YO�I;�h`A�]\�\�\�*�G\�^,c1uԂ	\"I��\�[�\�v��b`(\�#+D\�F\�X�=\�9\�[�F\�\�b-��\�9|L�\�	\'��r�24\�QT��\�;˪\�H�\�m�~�49r��Oƕ\�\r�U[�A3�\�\�\� \�9u�o\��V\��\�d�\�H5!.l��6\�N��g�X2p�\�0{�ubAP>):\�Pft\�|鵥�\�Ա���\�P2\�\�Lh#��\��<V\�\�\�\�\\\�d鮑�Y\�<\�p�]\�%��%s?J3D�[A��F\�\0�ӹ\�\�\��\��\�vp�`�\�&qY�\��;\�^\�\�9@+��\�$X�\�:���E�rkx\�ՙ�C�T\�n����\�â�]rIq(g!^4\r\�Fފ��B\"�\"���P0�$�=*�iQ`y\�\�\�\�X�0\0h\�<�N\�{LUX�S6��\�P<�\�\�\�*-�g�|J\�\�\� 	#\�#��\�`8U��{�\�\�$�9X�S�)\�.�bd�\�i��NOC�˹?6d��}\�}�\�\�޴�n6#U�d\�@�1�L\� U>)PG$���j���j˳�¹8�\0���m#HӜ5Υs�32\�-��\�\�`g�\�j�N6@$e�\r%�e��\�\�F�o\ZP�]��J��\�Pv؝>\�\�Y��\0k2f�9\�\r�LB�\�#-�\�\�er��\�*\�\��4��_�R��\�\�!��3e��\n\�\�H�\�W�n#w\�P%�P�2�\0�\��u��e�W��3Z!�+��r�Yl�A\rrDε�\�d�\r\�\�u�\�\0�Ò\�9!�mʓ:��Ԫ\�j��\�\��?í/x\Z\�g#f,�|-\�҆vК\�vcn\��*[7-sӐ�3\ZVГ�Ih\�v�\�ۘ����̤�iʠ\�r�\�2u��\�;ٮ-k\�\�\�*̆T\r� i<��b�f�\�\�pĄ*\�;\0	>@חc,Y\�^aj\�Uuݐ|AL\�\\��\"GX΢|\�h�\�Kw-2]\�^Ӊ\Z�ǻi1 \�:f�:\n;�,%ҏu\Zݿ���\�\�*#0\�ϤU.\�\�/*5��\0�y iy\�L�W��!���qb\�,�r4�б\��\�e\�Yu\�\�\�\�\�\�U.@�P�\�F�\�\�Z@#PD�\�\Z\��7��LeE�\n\�$��bI`C�^D�ηx+*��\"���A\�\�V���u�+mK4�\�	>�7�\�&j��<7����7�eH\Z��>D4��y\'ilZ\�_8��m��Hՙ`�wY i��\�*\�s��U�\r\�\�w���ַ�\�\�Z�0\�\�\�\�Hf!��\�#(��f&4:MR\�xk\�qiF��;\�Fmm��\�\�\��I�\�h�Xá\�\�\�NPCꤐ\�hO�1c�M�0���90�劷�):�&G?*�\�pĶ�\�Rʡ·�\�S�\r����	%\�m\�	.���\�2B A�\�0�\�	&b�Ew��	�\�\�t\\�)02��;�\�}�\�Ī.�m�rt�F�\rĒyj+I�E�\�\�X�\�r�rP7\�!���4\�\�[�{��KX�\�؂\�\� hD\�I�\"Hܚ \������\�Ki�c\�\n5\�:�\�\�\�|�^��Sf��\�\r`\��yqm��-�D�\0b|`��\�XG�\�W��\�Ar\�-�p/�`h~��\0@��6�bi[Xz(؁]�\�S;iT\�U�J\�U�\"&��{�kX\�D\��*{�Cݚ\�\r�4�!��ٱ4Xwuڳ\�)R��\�-�\�dn\�\�r�\�\��>	\0O0|�l-\�SF%r4� ��1�O�]\�\�V\n\\\\�\�,�\���0Ĩ�ņ\�Tr�\�q�6wn[,5�`��6ʍG(=8\\iY�e_p\�3[R\�{,\'\�͔5\�6��.m��\�FB��\�\0ae�\�4�5�`\�\�\�\�Q1HЌ�,Þ�mZ>���r\�Rn*ړ\�Ƣ>�׬O:��E\r����B\�9\�`�\�#Qˬy\�]\�\�]\�!\0� ����w�%]��\�\0�\�i\"6\"�:\�\�y�\'\�R\�cs(^DA\0H:A\�\�\�j\�ڋ�DM���5�\�9\�\\	��\0H:�FJ\�t3\�\�\�\�mV\�,nR%A�Iӻ}h$z;���f\�`\�[wgmF�4�W[~�1<�8�\�<��\�+4�\�ORH�-�\'\�}+���.\�P\�},��\ZD�gMɫ\�=\rtUyաtAVy+*P\0Cx[+�ȟHLLf\�Z�\��b�#\0\�6t͓77�&ga$Ϙ�\�}�\�\�%\�]\�Z\�(e��d�t\��$\�:͜%É$-\�[%��\�\�6�c���	�\�|�\�h�\����B�T�\�IB21P�\n�ѴQ �\�6�I�vz\�\�ή�6i��\�R�H$zC);\�\0f�F���Y~Ky@RenO\�\�7���\0\'}��y�عm\�$���!��d곯:·f\��:څX�R\'�:ӭa�G�w�\�E\nNց̩\�LXB\�Q �A\�l:�<�b;A�[꘧�B;[p#\�4�xZ8\�@��V��ČM�ȷr�:\�9�@9��:F�\�1�\�\�>H�/[d��@F\�\����\��g8��j���v<d/\�eAo�:�#���\��\�\�5˪��bI;+\�e	#�=kqĻP0\�\�,3wBдČ�f�ٶ�d�?�@+\r\�\��Z��mZr�$�1�k\�\"mC\�{7z\�\Z\�\�Z\�e&\�ȋ�\�Y&�u\�\\>�\�U=\�gu%�s$N�F@�@\n4�\�p��w�5��V\�b!I\�Qu�\�ySbq\�Ź�-\�)0�\0ruV\0�\'R3n&�4=�\�]�\�u��+d0��2\0P|C\�m\�i\�\�ֲ\\/i�*\�\n{\�u\r �D �y	�\�J��v\���K�\�\0u�vӥb�Wږ\\\�-!K�\Z.3\r[4lA1�N�j\�&�%�-�ew,�@bĪ\�\0�\0\�F��-\�m�\�=�n!T�e#Q:�{�bv�9\�cȴ\�+\�\�Q�����#\��\�t\�+w\�n\�ټ�\�g\�v\�z��r�\�}�2�LM\�Z\�ˑB�\�\�\"��\�i4&Mh¢�e�&�3\nf��h\�\nM\�\0%��mEY\���U�\Z9�\�\�CQ*E�\�^|�:Ҩ\�t�\��`�C��fP\�c)#6\���SV\\��l2�eDf�Y@���\�\�Z�[���l\�I���t�L��\�5�j\�㔺*�3h�0@�5\Z\�*\�s4~Ϊb1s��\�2 \�� \�F�<�5���3[U\rȑ\�\��ֶ\�x�_\�\�v\��:\�\�\��N`ڗ\Zs\�\'�SvK\�|[��y��\��\�\rp\�\"|���WE��?JuA\�P�\�K$\0����2�`��w\�q�騫Af�{\"�8\�\�\n�\�\��130r\Z���\�\0�\�\�\��\�C\�Z	\�(mg\�����35��\\��ic�@������!�2#�Ų���\�:�6\�i\�P:>pm[V�|\�I10d(̻Lhv�\�8�iT�T|\�f�\����K��#k\��Sf�L9$\�\03�Q��\�`t\�]6��$�fz����8\�Ţb\�\�f\�3f,��\'\\\�t�y֋\rz\�Z��;˄#���ԓ��]\�̊\�/\�bHށ�\�\��$��Ab�)f��$��+<8\�\�?\�\'�jT\�\�\��v�ub��=\�\�h�d\�g8W�xkI+n�!��75\�H>�9\�ݛ\��.%܁fʆc9��\�t<�& ��Ua۲l�\�\�s̢��kXѶ��\�\0\�\0��\�\����uE�rx_Cj�b�QXq\�om\�붿p��9{�_�1P��O���kO\�V~Sհ̸�LC\�9,�\�	���A�6%�\�R��\�n\�\�ᔗ\��X��U�+y\�ݱ\0��IGv�՞��T�N\�X�0\�AR�ʧ~{zS�<�E/h\�\�]Pprx_C#�\�^ \�]1���\�ps\0 \�dk\�uZ\�v�\�e�\�4�\�\�y[̒�\�i�֜���X?{{2�a@�d�\��]�\�\�^���+\�\�J2rQ�1\�\�Mg\�\�]Pp\�\�}\��ى\r\�\�r<Zj&A\ZZ7\�N\�z\�g0�{�ܷt�u,	@�d-\�Y�\�哻͟1@I1De n4\�Z��zm�}\��[eKr�e 4څ��uB\�Ϲ�\��/����,��\�\0\�e2%�ᑻo�W�E�\�l�#:\�K�Lf\\\�\�\�$\�\�RMKH�\�\��-�g\�\�@\0Dm�=i\�n\�\�*��I\�@$�CMG�l~%\�\n~\�	��^$\\!�vd�h�\0\0·I�J���&\��;�\\y�H�X���% \�\Zz$N�Z\\e\�J����\�\�\�}���|\�\�.��P-,(\�E\�\� ǨB\�1x�TO\�_�`�@ �y�I�MnH��}e8�\�ٚ�\0xm���\�\�h�<M�B�\�\0@���\0ml��o�.��N\�\�\�䩭a&��\�\�?�o\���\"v���\������\��b\�\�\Z�\�\"\��\�X�\�\'���\0DTo\�\Z\�?\���y�\�׸\�w#�;\�\�V�R�\�\�e eUw\�L	��}h.�mJ\�W��\�J�\�{�S�\�Wx�]\�\\-��Sq�\Z�	3\�\�5Z��\�\�MN�\���H�\�[�$G��$~6�-`\�P`\��b r\�6\�\�γrlt\��ћ�.*\\\�X\n��`�\" � \�!4wc�%n\�����\�ʐ|�|\�팶\�(В�\0=>{\�61e�S\�W-�\�#q\�@\Z��\���8��S���^\�\�A�� \�t2z�_�f\�\�\�\�iK\�\�%�\�FU9t��\�;�7\�]\�2+0U3��$\��\�L\r\�[\�[(��F#.I�0I0F�#���j����\�X�8�\���\nW.di� 1ц����?��\r�e]T��\�:f\�Μ�F���^�2\�@X�p�\�[����$�=\�\r��\�b\�\�M-� ��\�6\Z\�E�\�3j\��F)�	\�VSR��b�`5�\�7k0��g\�0�c�!W_#��y��g�|t���\�r~\�\�[%�M\�\�\���}��\�\�O�W\�I�W�\�q��{\�\�[,Ô_K\�\Zf=(|O\0��\"\Z;�\�H�k\��!\�\�\�u�_\��2ƌ\�m�\�\���KΖ탚\".I &WM�o�v\�5?\�&�\�	�gd�\�{�\�6n\�\�jV\��\�\�W\��\�S\�\�V�E\�A\�n\���;Y�\�\Z᎖/>I\�*��\�\�a,1S&ړ�\�Sa8%���\r�\��G�?}G�\�\�ׯ�\\W��L�\�\�\����i& ں��և	�BA\�\�,��V+�\�&\�cl��\�I��|潧�a@\n\�{*�U\�s<\�ݘ.\�q�V\�x\�\�T�\0�\�H�#�\�y-\�m���\��e�\riv\�\���\�K\0\�\�\�J\�V\�\�v�RJn/�\�2����\�u�\��\0��\0uXa{M�\�1}Fh�6�G\�S\Z��T�\�+��9t���\�p�l\�g�5��\Z���ډB-��$Г��1�\�\��\0���ʓ\�\�m\��\�V��p�\"\�\�S�9\�\�r�F�C\�O��,�RW��M\�\�\\��]�W�{�OS\�q]��\�Ug\�\�\0\r�������r���}\�\�\'�[���\�X��?\�[\�W�8p\�^�ɳBXԗoyş<��YB\�\�\���6Ŏ�\�WOÇJ\Z�+��\�\�Ĳ�\�\�\03Gp�\\q��ң����=U�\�x0hNQ0�\�\r�sS\�\�\�\�p�,۴�\0\�LD�@�:Q\�\�Jn�+���U\Z\��T��W�v��Wn�P\�퐒<:����ss3�f��f�r\�w\��\�m��\�l�{��\�)���#�${��J�,�.��\�*v�f�ؑs/�9t\"\�f\�\Z:\�\�A\���\�@B_V�11m\0�����=�\�oaS��N\\�+�؟�\�\�\�\���\�\�˲_@;}��̩p�\"(e�՟\�>\�\�s$� \�_\�_N�ꦯ�wW�_�\0�\�x~\�݉�+w\�(��\����\�.ƈ��\�&\�E\Zg*�Pm\�>ꭻ�vԹ&D�i�F�W\�\�07:��\���j\��|=\�N���q{f����\0�b\�\�\��s�\�}��\�v\��!&�L��G/���?�3h�\�\�jEE\�r�\�\�e?\�\"El��;\�v��\0Y[\�~\�M��}��[G\��\0e\�\�:�:8\��S��W��\"w�\r\n�e���.̀17�\"\Z\�ߟ\�?\�R�<+�\�9���\�r1W̟\�r�\�\���G�*֙Xwy!�CHq�GC5\�ش�U��j�\�4��F�\�=\�j��\�\�m���\�E\�\�9\�\�t\�t��\�K�\�I\�M{\r�\�\�\�/�U���ue#� �Aӹ�A���\�f\�1x\��e*F�璉C\�5\�t�\�\�\�r�`J�\�\�R�\�H\�������Q�I�}�?\�\'y��\Z\�^c�47f.�\���\�\"GP*�\�4+\�K]�\0��\�\'{�iR�w):�%�G�J\�qXF\�H\�\��שXĤzK\�\��\��p�N�\�?�kj�\�wOW�/\�].\rF)�6�tڬZw+��Q�bk\���\�\�n�e:9�]i{Qp�I�~yw\���\�-�\�G��7:\�\�\��\���)�$�H e�\��Xv7�\�e���\Z�\�&g��\�a�m[q\�z\n#��\�\r�\0춹\�1T*ܕ�~Q�\�\�/\�N+\�l�7@��\�ߘ���q�!w�!D\�4\�U?�;����܇\�>T�2�K\��Q|�8p\��J\�_\�7�\�a����j�Α\�r�\�/�V3�����\������ŋG\"\���\��{�\"Q\���>�$t��C\�փĕ\0\�(�r�\Z����믕Gz\�:K��J��Z�\�*7\"w�{Ǿ�\�G\Z|5�}\�\0��`�\�ԑ\�5ku��[\�~K��yW�v\��\�=J-�f��\"G\�\�/a����~v��P\�I�i�s�\�2�\�x\Z��2O��PI|F�\0m*,Tz\�\��Ѻ�\�`�/j�Y�p:|\�\�\�\�±\0�A K�\�V~\�c�7.��\�!FRB�֎�;��q\�Ru���̢Ҿ/R\�v���\�P{]~\�z�~g�E�y|\��ɬ�\�5ջ�\�\�\�<]\�؝\�DZ\�cU8�\�b-@�dݹ݉K\'\\���}J\�O���M�\�܋\�9�\�\���)Ã\��\�\�,��~�\�}��~\�\�\�lԷ�S��\���\0tß\������?��E\'%\�z.	q?5�$rĆ�\0Mwv\"\�n�[diG�p&�\���Ѱ�S��\0�\��3��\n+*�J+x^\��\�t�\�\�\�\�\�\�z�\Z�����u�/�\�\�9ʭ\�7\�a��Ը\�1�L��\�\'\�H?\n�\'\�}\�]`�Y\�IcZ�wcKx������w�ף�lmk��9��S\��k8\'\0�\�7/eb0]�\�%ۗ3\�!\�0�x�jr�м���E˶�e�,{Ҡ�9L�_)�x7k\�\�-��\�`�\�\�\�[{U����˄\�i\�{쨣)��ip�\'j�\�*\��E��W\"#�\�$�Q#B4\�Tv�\�#�oퟺ�\�cz\�]L#�u��A �\ZEs\�c�\�\�}}M�\�\�a�\�wWG[L\"\�AF\�\�b7�\�����bP���\�\���u\0\�\Z�롁�	�\�\�Y{\��f�~P���m\�M\rs�x�\��\0ʷ�S��w}W�,S}�G\�i86��XtmM�E�P@#I\�\�Q[\�=\�(v\"\�\�\�E �W\�X����\09H���\�\"U�\�UH;T#�8��<��ns�\0ʔ3B\r\�E��	\�ST\�\�h�\�dn޻i\��h�\�\�,ĝT�\�M�nͿ�\�\�^]�\�f(�\�\�\�\�zn�>�Vg�\���\�}.���)m�oT��a\�s]\�\�\�[\n�?�\�F��k\�U\r�	�y�h#Ӻef۴���.t�\�/ew\�\\S0X`\�\�C^\�.c,\�+9OGn/��4K,4Mt/�\0�1B`\�\���>\�*��p\�\�<�\�R\�mկ4\�\�/�\�z\�q\�g��\�\�6�cH����\�c\�$l}U\�>\�U�.k̿﻿��5��uu ���w �|��r�+\�IbvP9�\�\�rv��\�xY�%^#>\�䦙�\�8�\�\\\�?u�l\�i\�ԙ\�̞����\�\�\�E�S�Al\�L��\�w���KL�\0?8����߉��h!b�\�\�m&u\�ʟ�b�L\�\�y0\r\��;N\�:\�~)(EF)���6\�7��#�\��\�?\�`~��s�a�G���W�\�;i�S\nn��\�#�H�\�΂\�v\�\�u�\�i\'}zu�KѢ5\\�\�\�\�{怶\�\�٧\�a�\�\�7Nvf�\�\�ImĒI\'\�Sb{C�����t`b:�]�N^��T9.�6\�0��D�:\n\�\�v#_UKf�:4;�\�P&u�\\����$�r�B\�i�*c=\�w�9�\�U\�\n��[E�I��2Lz�5m�a�H\�\�(�\�p\��[7���IO\"c�Ӿ¼GS\�\�*��\���s\�2��#c\��UOiG\�`�c�Ew��2\�5\�q\�R�$\�a\�\'s�<��\�\��\��p����{\��3�\���\�\�,�#@܊z	\���7\r7� \��\\M�Qr\�r:�	�\�I���\�%��I�QX\�\��\�\�$�\ZNX,O-Nլ{�*\rI\�\�|VҜ�o���>lo0:�\�\�*�g׿O?]i\�?�@}WNf�1\�<\�\�Q�V�yP\�g�\'I��\�\�_\�\�8O���T�\'?�\�g\�^�\0TU�\�\�a\�q�\�n�=�t��pd�\0��4��c�Z�\�8I�o���b\��:\0p\�$s\�\��\0 �k�t�j\�?m0M���\�h�Օ\�\�\�Z�\�\"\�I\�t�kq\�;�0��x�\0�z�U����\n�#�#m\�\�vێ\�ǖ�s\�\�u\�\�\�b.\�Sa.�\�\���\Z\�*\���z�ήoY\�\�N�\�yx�2ŸF���\�:��K�\�C0�0-k?�\��\0\�l\�\��N\�DL^�­\�t�s\r�\0��[��f\���+Ε��\��\�-c�ۉg�����MT8�0[\�\�|�\��-ZK�י�MQ\�S\�-��P�\0\�k�\�9�\0\�%�\��F��\�L(\�I�\����4\�pO�\�y��\Z~7�p�+;};�\�=x����=��︧\�\�`x�\�\���\0\�\�5�\��:9VW��\\~��}pn�a�W��E}?�\09\�4�\0y�>ڿ��A�D\�f֟ϯ�nVX\���I_\�$}����\���`s��~�\�ŭ��(\�#���^�\�\������np\�h�.\�Dq�Щ����]D�\�\�~�\���I�~j(�*\n�$!]H\�\�\�G\�5\� 맗���K\�hN䑸�\'\�J\�\03\�-�\0w�Դ&�\Z\��-\�A9uMv\�� y��t\�Q[�\�6�Ҭl\�F\0���\0o���P\'ȇW�\nTp\�y�ꟾ�U�t�=��|_HO��\�b\�aj\��\�2�L��\"1�\�d��\�U?\�.!TbN^\�W\"|$��:W�cq7��|�P�\���\�~u\�\�\��\0���.WMh{�\n\�Zݺ\�ٹl\�$�\�A!d�۝ۜpa�\�\�b�������{n�߂շ/\�s\�&4�-��nvެ8\�_\�a\�\Z\�wp\\n\\s9]9�\�\�\�\"���\�\nKS�\�X�\�\�b$ʍ�O�\�vV�ˊe9E�K�H\n�s0&\�\ru\�\�\�Y�_!�6\'\r�&�\�=\�\��m^\���\�a\�KAyw�s���$g\�k\���6h\����(��\�\�\\��\�2\\7/0uu*�+ �H#siUw�0\��\0(�qcT�\�\0rZ�0t0M�#\�Q6?\0\nsF�\�\'OX\�Û\��\0���\���_���#Q�\�}\�Uu�̓�\�Fb8����菺�ob��3������\Z\�]Q��C��\�X\�\�]\�\\̥�\\X\�L\�k\�\�z\�~Own�\���X.#��\\e`\�u%�vNi \�I~�\�\�1\�ԋ}\��!IPIܝu:\n\�\�\�\�9&߽y��އ�\�]\rc�)���,:�e\�aj\�*\0!HQ��gA\��И>\�8\�n��xG\�\�\�\�G��\��\�ո\�\�ˌq���\�[\�.{*���.\�x ��t��\�J���H��\��=Z�g~]��\0\�\�����?���X\�\�?\�\\9\��\�JRZ{\�\�o�&<)�v�Fq;9P�\�/\�\�6vh;\n6�Iz�OE�0��QD\�(��csP.u����\�\�ں�1��K�,�\��\0\�\��\r16O:��0\�\�3	P�q���맲�ߊ+{���A\Zu\��\�`����)�#MDo���ʇ�d\�$�i�i\�У�\0&\�\�5~�kҨ�G\�b\�\��^m�\�[bw�ʞ�QH\�\�ϓ��M+�B\�\0��\������dLi\�0\�P�Z�טd\�-ܸ\�>Q�[[���\\5�0�\�%\�A&9V{	�Ū���\"\�\�\\�\�oP|��ӈaW�\�l�1���\����\0b�@�\�\�\�\�ʣu]W�~\�|\�\�A��|v�&ǉ5\�/�e阃�y\�q�:�e\�*��WU ���4${jk��\��(�g���g��\�\�\�y��g���\�\�*\�\�;\�\�\�z\�|�]�[k\�\"!I$�V\�mi8�-o�W,˼1f�H�����&\�.\�9J�B\"c]��\�[dߖ�u�G=�\��\�F�rZ=٨[�=[\�\�\�V�\��0A>q\�s/�sG6e�\�6��\��o:O-y\Z�I����Y\�\�zy\�\�^��P=\� A\�o�\�V��6\�s�X+��4�]���\Zo�?U^=\�?\\z�G��\�C��if@\0�t޴RLFw\�m\��\0�\�Z!��u��b�2��\���bܝn{��~L��@$�-�d�\�\"j\�\r�\��\0Zଞ.���gXϮ�q���\�<�e,\�\��f�r~\'Ջx;���5^nQ]\��\�\����a�\�Q����\�ie<\��P��z\�\���U:\�zϴ\�\�	9ӻ\�4h�r�G�龍\�\\0�u�\��\�\�\�m\�]�4�Hvޑ\�\�\\2\'�\�K�ʎ[��ut���\�6\��\�C\�G	�w���\ZL\���h\"\�\�H}�\�\\\�9}t��\�\'\�\r\�7�i�\�\��8H,7?�Ɛ�Aw�\�\�N�\�(\� ���Κ�n?�O�	�\�H5\0�9\�O�+\'��\�P\�=_�\�K��UJb>��������\�v\�M[�\�\��ꨑ4\�DQN\�\�_}-�>ڭ@��\�\��Ҧ*$\�9G�S\�\�\��\n�\�7��<��:����9~4չԊ����Q@sO)���\0�\�œ�댺\�*(jac\�\�M`y�u\�@:Nk��U1|�\0h��`\ZN.y\�\r\�:�ڢ�>^T\0���:xb9G����g\��\�K\�\�I߶\�TWA�*�oB�o*(t�\����;��}�=i�\�R\r	؞����`�f\�CQ�~6�\�A\��\nB\�\Z�=�uB�Wo\�]\�@�\'\'�\�\�\\ߥq\�\��i�ϫ\�@\�?7Zc]Tbk��T�6 R�H��\�~4�X\�Z�7��sʂ\�H\\\�h�M&h\�\�ΣfPht�\�\�a��¸\�\�	lpq��M*ad\�s�\�*UE���p\�H��yWiPI�>���\�\�J� ��ޝ\�\�\�J�+�]��\�J�:@�i� ҥ@3��]$s�J���h\'\�Qg=*T<�#ZhSJ�!\�\�\�S�yR�B\��\�\�~\�T\�g	�;M*T��,k\ZT���\�Jc�&�*0z��ԩP$\"\�\�q֕*\0��v>�\�q\�J�G=��R�#�\�','Imagen 2',4),(15,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	 (!\Z%!1!%)+... 383-7(-.+\n\n\n\r\Z-% %--------/--------/---//----------/----------------��\0\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0D\0	\0\0\0!1AQa\"q���2��BR�\�#br�\�S���$3Cc�\�ңT�\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\00\0\0\0\0\0\0\0!1AQa\"���2q�\�B\�R���\�\0\0\0?\0�\�Al�����>5\�MtF��Q�\\��\�A4`�\�E\Z\�Mt�\�rWA�W2k����x�4��4�\����\�p��]	��j/�\�\�\�U\�劭E�go���G\�N�*�\���J�>U\�LR�T�\�0}\�ձ7��)6\Z\'����|�*=>����r7B��\�K�&k�6�@9�\'\�J\�[���\�\�yJ\�e\�\�\�,�}�EC�\�lqJ��r;�\�\'$�\�ƻ��	j��U�\�\rb���k�:ǅ,\�3W�L��g<����&1\�Aʥh.8�����\�L��iT�T�U\�&�0*IV��\�\�ͱF\�s��\�q��@Q��i��p\�\Z\Z�[j�*�/*<M`j�KT�Sr)�G��,T�cZ-R\��,�\\)��ST%�L�)l\�\�j��n�[UE\"n$Rڠ-��q�ڪ�q#Ku�\�j��P�O5	��(�k���\n>Q\�EtE	��VP �\�E&��\�5\0��S�\�\�\r\�\�8\�\"=-Q\�\�\�\�\�\�\�f�,�D:oQazQ\�\�H!�2Yd;!Ӥ&\�T\����2Z�\�GLq�m�a\rQZf�CU	H\�\�4vڦ\�,Ԝ\�(K3Fm����a�T�\"�\"\�d�q�#QM�T�52�\"!�3H�>\�]jnE@�$q\Z�S\\��R� 깏!�\�P{kh�8�+Q�?�R��$(tq\\4m\�\�)����\�08e\�i����\�v�W�}\�z��\�\�h�,IuV�c1\�p2�\�ׯ8sn�_*+hB�Y\�\\�\0^\0\�9\�GZ�\�o�\���2\�!@�\"lA�\�<(j@.\�{m���\�+�q)^�\�	�Ư6eB�:��I	��\n����\�@�\�ĭO���c��K8��Ziu����\�j�\�1��\�Ğ�\"\��h�s�T,A|\�\�YRsYS\�/R�#\�x.Z\�M2�(\�\�\�׹$|���n��=:�(\�f���O|��L#M��*Z���T0$*�h\�j�KtD�Rs:#�[���2[��7\"р$�EB(�E(�9Q�\�\�j��QR���U\ZLS-�\ZSFBj2-�H�!�B@�*2*�����%�\\&���*�\�\�\n\�4J�*�b])L�\�<���>�4Wٸ\�΁\�_¡c\�L)@jcƠ6\�\��:o8�q�i�c\�\'�ڕ��\�d5�*,}�d�;D���\�L�s����3��	� A\n��H��.\"-#\�M�\�\�ea�V���3�\�\�J#*u��\�F�H\�N�\�ZB��2o�0\�@i*׆����\Z\�-��O4Ӧ\����\�	\�X!(\\��F1JǼ\�\�#4\�\0e\��po\ZL�Rj\�/\n����e^T�Z\�+\�cS{{}\�\�[W9\�!�Sh���&\�M�	��\�S����o\�p\�-2%0�$TI13h\�\�i��b#��$d�XV�:�\����w��+}�|V���W3\'C�M�z�\�ò�\�@\�g�$�= �ҝ_vӻ�:��@<ʤ���\�B#�N-��7{�\�Es	:N�~�Z�p-!C�Q3Z��)F�Zh*T#\�\Z\���\�HR\�T�&��a7<�,\�R\�`Ŷ\�\�\"A\�Mt\�O!\Z��hˆ|�\�\\�d�DKT\�n�\rҹ�XŒ\�-\�D��Ȫ��n��\�\�v�\�\�P\r\�a�`7]�\��(�J(�E\"��rDM)�\�k���e9Jh\�MbSEJjm���M	�Bh�MJL�GHd\�)M\"�\�T�\�X��\Z�Zqa �¦P�\�\r\�\�\�U�W�𠫉\�\�\�^��7�u׆nS�� ���$H�^\�\��i�\�\��Sxt�b\�\�E��q\�\�<k\�v�1�\0����YD$\�C\0ͭ2\�*�\�k\0\�\�_\�a*`&GĐ;\����	ʞ��u�ސ0e-!\�4	�鷌���Q6�\�qJ\�YD��\�\�7㥨\�KD*V��\�X�,��1eX�\0�IZ�\�\�\�q墤�9�D�=\�\�\��F��\�,�s\0\��nY����7\�<��<hm�\n�\�N��=�MC\�\�I�9If\"G�x\�\�KE@�S\0I��\"d�i\�5���1<.\0\��zW,:t\�s\�[��Z\n_\nq5��*!A�Bʮ\0����̈�νG\0�Z#\�񯞶&\�,�%WH3�kxI���\�W,^�\�\\`%��|\� �׾\'\�:�s\�4�,\�\r�z\�\�,>~\�}\�3,�\0(\�u0+϶\��b9Z��9.�s�G�o֫@o&\�,�d�/΄㚍:O�\�\�\�F�im�Nd�L�J��ī�ep��jk�\0\��֩G�v\�d�\�	Gi�,��I�m:��\��\�\�\�m��HL�\�t�~#uQs�Vb��y	 s�S8}�\�Gh�]H\05���I%d\�\0��\�\\�ʣ.9<�\�╵\�?�\�O�I�gpr5&e�A�MhoJa��R����`�\�P\�����ڪ{Kj\���\�\�|�Np�\n�5�1¡�\�\\}Nĥc6Y�X\'Px�3\�)�uSQj-߸!�r\�\�#i)\�)=�\0	\�\�\�\���t���f\�L9��\�)�TT/-&��� \Z��oc�Pi�a�J �I&2�`�i�\�V�]\�\�\�Z=(�Tv\�d�I\��t���\�p1x֒ڻ΄���;D)9\�V�Lyk\�kWL�����XB+���\�;y/�R�:�UE��I�\�\�q\nI\0\�t��R,�\\�%o-F?�M%\n9T���i�x:\\�6��\�\�|[�ڙOD�+\�D[\�\ZIg�\�V���?h4��\\Jy��H�����xwU�2�fX���P$8�<2IR���Q$��n|\�Ob`\�$�&\�͓�h���g���m!G09@&#C��<��᱉RPs��H\�\'\�޼�x@ۊD�\�@ �H͙$*\��\�J�؛\�s���	��Bu\"G\�y\�� \������\��\�%bRdp<�:e)�?\�;ÊR�|C��\0\�@��N��\n6\�\�\\��H>\���G���*�\�D\�;���J��o\"&N\�?ّ\����1\�Y9K㐒��A~ZRH\��I�m0#޹\�mFVڐ�Q*F`��\�4yv�m<��\�KM���-\�p\�%s�$\���\ry�ҩ+0{�C1\�\�׺o\�[\nR�����T{e���\�9\r8E�\�u\�NFҜ�P*\0��Z�=	\�W$\�=\�j\�؉���\0\�$\�70 �-f�\�\�B��\��!2D\�\��\�\�i-!��&�Ĕ\'2�@_\�r�P\�>1U���s�\�\�Q\�a��\0��5�n�\�CT[K\�4\��šI��3p���\�mM�\�RV�\'8\n\�M\�Gzǖ�)����\�r\���	�P��o��\�S[/g�%M\�ټ\Z\���1<\r	e�;�f�+8\��\�A�a\��z\�ѳ\\H��.4���n���%q��Q2��5\�B/ʘV-\"Dt����\�p�<Җэ��\�=\�V��X5�\�oZ��[F�M/�3\0��\Z\�\�\�YΖ\�&d\�8�ZG#�5����͑\0i9\�\'޴asN\\\ri.H��b�\0\��#0�\0-	NE�:H���)\�\Z\�&C��xf\n>�*�+�LAqr$dJ�=�����;/\��\0��MV\�\���?�\0*�\�?Z\�r�5�ۿ�H\�\��V�$� \�\�v.#\��c�\�a�\�)�I���*ԝ(�)X�Y\"\�u\03$�\0\�jg-z�����<ܖ\��\�e[�ΈR\�9%D\�\�`\�u����\�/`�\��\'@ب�$\0HI\�,�6�\�M%�!!�4?Ʈ\��\0z\�#��\�2����e��J�\�ԓ�\�$�h:߁��w�m*\�\nAm#��w�(LB��;g\�Q[\�b\��\�B\�m\"c���*3��3t\�\�ﶴ\�R\�\r�\����	I&I$�6�BovJ!\�\�(Z�JѠ9��\�m$�5\�I,^\�C�ZJGy%3\�H F�N�g�8՚/s\��f=�\Z1gVH�\�mf��aG���oX|���YL$(���\�;� ��Sel6�\��q\�3)�eVr2\�3�����t�\�h��|�)\\\�$�Uc$<jZi��պH�\�KS�T�FU*Q\�)�8�U q�@핇��(Τ\�;\�R}j��km\�4�J(v�,*Рe@XA�\0\�5L^\�\�Jx \�\�픭GC5\�\��sgJ�Q\�M�5��\�XAH�\�\n�H\\�#X�-��u+S��B�	\�Ib��\�R�PmG2\�D �vq\�Q�gw\�\� ���u%%fgY�I�\���-\�\�\�PNet�\�\�R;=(B���@���~!���tL^\�@I�\�IR�ED5�S�*Q\0X\�=\r�Tu*����E�J\�\n��\�G\�<J�\�\�\�E�\�hJTB0�-�(\�\�\�\�^y�a�\�HȬ�9fBM\�5�Lb\�\�̤:T2��7�ޕ�N�M&uҡ�HO���͵ݛ�m<\�k!��)\�7)\�\�Sɂ$G1z�}\��a\�u�\�\�8y�t�\'2��B\�\0nc\��\0�KC\�ր��R�{��ZH-k�\'[�2d\�Gn\�>bZÐx-\��|\�\�p\�:�}\�ޅbIm�C:\ns��\'�<�v Uo��&�����d��<bF��t\�($% B@ ƪ��\�\�I2�L�+�Gog��\Z_�#\�R���|T\�\�΂\� �RIH\�qߥ#�%L��k:�i$[M53i�l�59T�����\�\��\\�ڣ/q$�@=N|+<\�Wp9lq�m�XJ����%!D\�Q71y��9�\�%?\�a�FRSS�\�\���OvZl�\n���\�\nJP	��\�$\n�\�\�\����=���8]�.\��9�P�$�\�|y\�\�\�Sa �#\\�����\�d@\�\�Y>�)\�\�)IcNu9�����\'�޾/9\�B�@��d6~!���*�\��.6�AIRA�Q\�t\0\�V?�	*8�(\0I�4\�<(�o\�6X~\�\�~\�G�\�nбq�y��\�n�<I��7v\�\"\�)�\�E?�\��e\�\�\��~\�����b꿕e&#n{^\��Ǝke^�!?�T���Q	Ɂ\�kȷ�x\��^�\�a\��A\�!\�A \�BO5Zd���!(�\�bm��<lL�3]ϪQ\�\�x\���ov+/\�Lĉ 4E+�{ń-d�CjQ[JHI\n$�\�\��l\r��\�\��U�A�*^h\�1R�(�æ��\�\�Jм\�I�$%R�%�Ɯ\�\�ׇ\�%t꿐�{��������\n)\��:\\��B\�[�\��8S�\nm��T2�I/�f/ �yW�\�yC�\nU�\�;\�@J\�L\�ȋ�\�\�;7aD�n6U�M�h��T(y\�\�\�2��z���.�\�k�\0O3ʵ�\�<?%���J��	�:�L}I��\�&\�*Lȱ6\� \�k1;)y+d��V$>\"xrRxȭ���:�Ӱ�\�қK+\�\�\�\�\��_��\0�\�[[Dq{\\�����\"H\�3@���<&�x\�\0R��\�)*ʓc�0JA\�f$�\�j���R�6ps)ZA\�o\�Q�W\'\�x%�<1\�\ra��\0��s��h�q�I\�ʈ�=\�>�^W\�Q�m�a�dΠS\� �*\�&\�\"�q�!-|}=ފh[\�k\�\�@\�m��0\�@\�\Z�*ho�ZuM�T�r�0\r��u�6S�FG�\�f��4N-\�cV\�	�\�ln\�2\�w�N\���\0��\�mvYJRVT&\�)\�\�SUe�\Z���M=�o�hɺQϮ���QV��\�\�J\\\�9��/a\�\�Sh��I�nM\��$\�N�E�¡\�SҤ�j�\��\�-$\�$ñ\�\�l#ī3wR��ʀT�P�\0I�\�Jm\�:Jr�%�\�VQ2I\�Tu�3x��ۢ\r�\�b\"9�*�=���\0���v�I���\�hw�\�lO¥$\�o�����ei\"o��\��\�Bs\"#�Z�F�[\�?�s\�U\�ն�\�=gc\�\�qe%YnT$ۇ�5�\r�*��*C�e`�,\��\�̑k\�65�ϟ�\0�d\�Q\'\�/\�OmD�q\'*�\�\��邔�\�e�k,q\�\nOq\�\�§\�\�R�a�d�\'1�\ZS�\�P\�\rje\�5X\�i\�r����\0\�\�\�9�yXoL\�r�0\�O\�p�\�0��\'9*\0YC��\�\�����t\Z��\�}Е)N��������~T\��\�\�A �����\�,\�UU\�\�s\�d\0��c0	%G,�k�b\�\�þZάJ\�D�Al�I\�u�V5�RhR�\Z�\�\�W�p�JHJ�D8���\ru��\�\�p\��II)�qo\n��\0i#�쩦���I\�$\�Ҧ��d`\�\"h9��`4U�6-�ڜN`�P���\��Jm\�R]JԑM��唟�-�]	\�2L�\r\��*��>�#�Ok�\�@>\�t����\��\�b����x\'\�G\���&$(L�E�i�f𵨥	@ʘJf\0��:��-\�@�ԕ)(9Ք\�(\�\�\�4�\�l\�Km�5�f�\�\�\��b�\�\'Z\�.���k����r\�u\"0���\�[Y(\�}��p\�\�\"�>$q�\�o�>��Im�5�\�&\'�\�!\\O<�E|�\0�~��\�<RZK��R��Bp�*3Q���©홱�yaXwM\�RӁ)P0��t��jUʹ��\�s�j�\�U�t\�\�\���u9f�\\#\\N\�\�˃Q�쩙���x��-\�\�(��ɝ��H(\'*�Q����\��\0�_�h�\�u�\�B3Ȟ\��\�ڐ�����f\�\�:��\�Y\n�c���,^�q��SjH�\r8T�\�\�\�G3\�ƥT�?w�iX x��:����/\�W%\�W�\�)0\�]\�\0�5=R~ufkz0HK`\�bNCe@!W�\�JK�\�\�\�	>U�f5�\�\�*�$}̤\��\�X\�q9*V��T�i\�O�\r;o\rސ\�xA0�\�K��]r�S\�f$\\!>`��p!����ٝ`���[\�)St&L��m+�\"��ˇ@0Ӯ_�̱h\�9�*�oa}��\�u(JH)�%0W\"Ov�k��RV5\��6�p\nS�d\�QD\0�F�r�\�\�\�Kgg$|R8\�\���\�[�in38\�(iK�.�kc�)*_j��\�\�e\Z+l�El�BGt*?\�\�d \�����0�xH$��ˢ~���+\�b\��\�um�4�\�@\�\��mk��;\�H\�,\02�\Zx�\�c�i\�c�k�.tzR�NK�W�A�63X�\�ʼ:֠�!還\�\�c�*a�\�\�\�\�i ܀TAQ�:�t\�H9�q�	Z�*�(��7��a^YH*)����\�h��T2�<wT3��a�A*x4��\n\� \�\�i67��\�-�{\"Ja+���\�9֖ژ�����#2�mI�o9-�\0����\�1`TE\�\�-�^!��e\�	�BV	d�\r��\'�PJ @%0��\��\�4\\y\��seI\0I\"�\'K��\�z\��bP#B��PDZm[e�%\�/c�t\0�\�\0�R8Ir^�K�Gl�CaO����$��ȶذJR\�S���\�T�\�\��\\.�����%r|9�\�j\�\��\�4ȧ,J����q\�xUW{v��%�:��\�.�\�	\" �3~B�\�\�\�)Ep+�\�O��NEeG{���)Y�ydFch�W\'v�����;�	?�9�{نa��\ZYT���s+��6V,.�`�P@YL�\�	\�-0i{\�\�j��\�b�\�֤�R�h�p���\0��x\�i�\�\�n�\�m����	$A\�\0\�c�xU�\�*�O����\�*ₔ8��� z\�J{�l[\�\�٘HH��Z\�Xd��!�\0Z8Y\�o]h\�\nX0r�K�����y��=�\r\�U�J�*@�=\�f\��\�E6+H�o`�\�TAQ1c6\����~�C@�s�ғ\"���\�jMX�(\0Wu$�|\'1\"x_\�V��m %fL��\�\�8V�F�F��\�H�\�\��SϬ\�T�ǵ����VP�jG`��\��P\�}�̟��Zٯ�F\�|��kv�*\� ��1\�ƹ�����	��I\0Q&u)\�I��\��m�8w���\�[�nV�\0�R3R}^�AX\�\�@v�`WmUrjɇ\�6�V�\��\n�\�\�l:\r�\�U�\0��K\�q.-�\�eA��J�a���\�Tp\�W��\'\�\0�~Tb\�\��KĽ\"2\�\�TZ\�\'T;\�	�FF\�Ư�\�D�\0\�V�\�9y\Z\�@U��\�*����\�:ʉ^N\�\�\��G\�EN\�a��\�x�?���B~u\�H\�\\�\�3��ˏ��ݬ\ZN`�O>\�`�\Zq͖\�\�}dfh\�\�\����\�O�4:��w��\0qe�[�*\�\��\��\05{[����)1*)#�\�\�J\0ǜT�ds��f&xx�\��߈�D���\�\�yټ\'�J��\�o��/\�K	ﴕ��D\"Gʀ�n)%��� ~�%�T� eW\�A ��G�	���\�O2��\�\�z����G(\�\�\�\�}O>^�?�W�\�\�o�+\�\�Y:%z|�A���R�\0o�r\�V6vP*P�A�{�\�\�\�\�:��\�\�>I {RK�J�Ld\�\��\0T\��\n��+V���\�{�t�\�i ���i���^��\�\�\��$+O\�6�\"\"�y*\�\�u�8�l釁.�#̙Ŗ�	\�0�<�\��;�\��@\��n>(�T�\�T\�#`�\�6��\�\�/QX�\�`�ꖟ0���K\�c�ܣGO\�����\0vE>	\�a(�$ϋE&|\��W\n�d)�C�קh��{��V���\�n\��d�P�r[T0�T\�\�\���.Q�]\�\����M\�\�F�А�9�\�}���\���,ͣ\�>�*��ڏ&\\&8\r�R&�\����T=d�\�VY=\�j��謺\�e\0�,-\\�\�k������)fz���{�:۝\���=\�ԍ�z����e�r\\� X���Ҥ,OY��\�q��8[T�\�A��< ۘ$u\�\0���rV�`L;�����\�qM��\0b\01ʮ\�\�/\�ʺY_\"k��03q\�PA\ZVԍL��sO��\�Z�\��I��=gZ\�\�\�\�m,T3\���%*Q\�\�JY ����{\�\r}=���c�0\�\Zf���\�b3���i<�9}O�r�:�p�QJ�潂��\��?�i2\"}��9_X?\��\�r4�}|b�J\0\�\�\�\�~b\�\�f\�t������\�X���ħ�\��\0QJ\�\�mq��ե�QЊL���1\�N��\�rG__M&�ƱԻ���\�\�+�\��O\�Jg<���\�D\�br�Y���\�\�\�_9���\�ҖS��>b>zֻ`uT�\�O:Mk\Z*�Ǆ���\�\0|����\�\��\�n��||\�\�p�\�2h��\Z��\�K\�^���tlf\�\��k&\�1\�#Y=>��9\�9__\n\�9i\nfi\�ð@\���z\�9\�PreW�#��j��p3>\�B�)z�\�*��t<�\� ����V֙\�\�OY�p�NȞ?^\�M�\�\��r\�>t\�[W;r\�P6�?f�o)U\����\�f��y�\�c1(\�*Pd:���bv~\�)\r��i駥yn{����v|[	-�*/�O��z]f\�jX\�xIU1\�F\�a\��J|�\��`]/�P=j/�x�Y$ ~\���\�!k=娞��G�~�\�\�YJ>���\�\r*\n��\�3K!\�\'\�QO�#\�ʤr�Tzף\�\��;_�U�\��jA��\�&&D�\'\�S��\0k\�\��+4\�r6�[�\0�K�y�\�SZ�i\"�M\�0\�g�4m\�\�c�󮒽y����Ү�M���a hOZ#2�$_�\�\�\��Y\�\�4\��&I���4�u\�9���,J�\0��˟\�:Ĺ\�o����m4\�\�Җ�zt\�<d�`L��\�\'\�(eRgRz�TV\�W�:qӥ�BR�c̟=4��	�_\"O�.�$qB�~^k[M�i�l�\"n-��\�\�X�A�#��Z\�J@�h�ۤ�q\�BM��<t�3\��k��y\Z\�\�]D�\0M�\�\�\��(ABfI/~��QѨ\�AD\�@>��ִz*G��8R�p&�\�\����(��Ozq�\�[Fư���\�υl�\���\�Ҕ.q	\�r�G(�Z\�R����O\ZO.�5�v�\�G+\�m��ZI\'0\�o#c]�B\�\'\�ˏ\�Z\�!Lu\�H��~�J	I{�\��7���N\�xy�\�\��\�\�|\�s\�[~�s3\�~F��g���\�\�Ăo$t&�y1p	�<zxQ�}�mc1	\0\�\�\�\�?:\��@$�\�@�i�j\�%n��\�\�\�yT�o\�A��WwJ�2���Dż\�F�R\�T\�R��#�g�Xt	����=\�x\�AAI#�\��yiUÒ1���4�h�ŧ�H��넛ؔ�t�ߔ�I�nF��(�\0yǯ\�^\�\�\�	mq�h��*c۞���$�\�A�.PE\�o�:´,[��<G�5��\�>U��\�z\�\n#\�z\�7֚[`t��TA@T\��\�uקםeQ\�}�,��=L��h�(F��\�YY^Vu j7\�\�\'\�\\!@�\�񰞦�\0ֲ��+�+9\����}4�\�}<\�֛�B�\�\�\�k+)��A�.]J�&zLG�\�\n\�Sc�\�\�YYI�P�+H�>�\��uʔס��ֲ���rj��	\0�	nu������\�S2y|�맧θm�2�\ZxL	�f���Z�R�Fd��\�G�}x\�؇\nD�\"�`[�eejRj\�|w���=�\�\�N�\�]&c~sa\�>�VVP�HT�\�&cA\��\��ȱ*᭧K�}iYYCU�Ȓg�<dA\Z}M%���	�\'^�𬬧�8�\'\�i:@6F \�BT�o2imoV\0ՉL/ޛq��VP\��\�hoR�� \�j\�lc�M\�\��#\�Qo��VWF8�i{�\��~�Ӹ6Ftȴ���iYY^�\�Gbh�\�-\�\nH(P��#���#�+)�\�\�s�\�WG�smH����i�k=fՕ�\�\�)lkW:\�<<~�ee\0\�\�YYYXԏ�\�','Imagen 3',4);
/*!40000 ALTER TABLE `t_imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_property`
--

DROP TABLE IF EXISTS `t_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `id_address_property` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `rating` float DEFAULT NULL,
  `id_characteristic` int NOT NULL,
  `id_user_owner` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `t_property_ibfk_1_idx` (`id_address_property`),
  KEY `t_property_ibfk_1` (`id_user_owner`),
  KEY `t_property_ibfk_2_idx` (`id_characteristic`),
  CONSTRAINT `t_property_ibfk_1` FOREIGN KEY (`id_user_owner`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_property_ibfk_2` FOREIGN KEY (`id_characteristic`) REFERENCES `t_characteristic_property` (`id_characteristic`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_property`
--

LOCK TABLES `t_property` WRITE;
/*!40000 ALTER TABLE `t_property` DISABLE KEYS */;
INSERT INTO `t_property` VALUES (14,'Apartamento',12,1,0,12,2),(15,'Pent-House',13,1,0,13,1);
/*!40000 ALTER TABLE `t_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_publication`
--

DROP TABLE IF EXISTS `t_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_publication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `date` date NOT NULL DEFAULT (curdate()),
  `id_user_admin` int NOT NULL,
  `id_property` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_owner` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_property` (`id_property`),
  KEY `t_publication_ibfk_3_idx` (`id_owner`),
  CONSTRAINT `t_publication_ibfk_1` FOREIGN KEY (`id_property`) REFERENCES `t_property` (`id`),
  CONSTRAINT `t_publication_ibfk_3` FOREIGN KEY (`id_owner`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_publication`
--

LOCK TABLES `t_publication` WRITE;
/*!40000 ALTER TABLE `t_publication` DISABLE KEYS */;
INSERT INTO `t_publication` VALUES (1,'La real casita','2020-10-04',1,14,3200.00,1,2),(4,'La SAKA-KASA','2020-04-10',1,15,420.00,1,1);
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
  `amount_guest` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `id_user` int NOT NULL,
  `id_publication` int NOT NULL,
  `id_card` int NOT NULL,
  PRIMARY KEY (`num_reservation`),
  KEY `id_card` (`id_card`),
  KEY `id_publication` (`id_publication`),
  KEY `t_reservation_ibfk_1` (`id_user`),
  CONSTRAINT `t_reservation_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_reservation_ibfk_3` FOREIGN KEY (`id_card`) REFERENCES `t_card` (`id`),
  CONSTRAINT `t_reservation_ibfk_4` FOREIGN KEY (`id_publication`) REFERENCES `t_publication` (`id`)
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
  `gender` varchar(30) NOT NULL,
  `telephone_number` varchar(20) DEFAULT NULL,
  `type` varchar(15) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL DEFAULT (curdate()),
  `country_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `country_name` (`country_name`),
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`country_name`) REFERENCES `t_country` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'saka','sakamoto@gmail.com','123','Anthony','Sakamoto','Femenino',NULL,'Personal',1,'2020-04-08 00:00:00',NULL),(2,'jhan','jhanalmonte@gmail.com','123','Jhan','Almonte','Masculino',NULL,'Personal',1,'2020-04-10 01:06:00',NULL),(3,'wendily','wendily@gmail.com','123','Wendily','Rodriguez','Femenino',NULL,'Personal',1,'2020-04-10 01:11:00',NULL),(4,'fulano','fulanito@gmail.com','123','Fulanito','De tal','Prefiero no decirlo',NULL,'Empresa',1,'2020-04-10 00:00:00',NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_general_clientes`
--

DROP TABLE IF EXISTS `vista_general_clientes`;
/*!50001 DROP VIEW IF EXISTS `vista_general_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_general_clientes` AS SELECT 
 1 AS `ID_User`,
 1 AS `Username`,
 1 AS `Name`,
 1 AS `Lastname`,
 1 AS `Country`,
 1 AS `Gender`,
 1 AS `type`,
 1 AS `status`,
 1 AS `Email`,
 1 AS `Telephone_Number`,
 1 AS `User_Type`,
 1 AS `Created_Date`,
 1 AS `Publication_Number`,
 1 AS `Reservation_Number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_general_publicaciones`
--

DROP TABLE IF EXISTS `vista_general_publicaciones`;
/*!50001 DROP VIEW IF EXISTS `vista_general_publicaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_general_publicaciones` AS SELECT 
 1 AS `ID_Publication`,
 1 AS `Title`,
 1 AS `Confirmed_Admin`,
 1 AS `UserName_Owner`,
 1 AS `Date`,
 1 AS `status`,
 1 AS `Price`,
 1 AS `Publication_Days`,
 1 AS `Address_Property`,
 1 AS `Type_Property`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_general_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_general_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_general_clientes` AS select `t_user`.`id` AS `ID_User`,`t_user`.`username` AS `Username`,`t_user`.`name` AS `Name`,`t_user`.`lastname` AS `Lastname`,`t_user`.`country_name` AS `Country`,`t_user`.`gender` AS `Gender`,`t_user`.`type` AS `type`,`t_user`.`status` AS `status`,`t_user`.`email` AS `Email`,`t_user`.`telephone_number` AS `Telephone_Number`,`t_user`.`type` AS `User_Type`,`t_user`.`created_date` AS `Created_Date`,count(distinct `t_publication`.`id`) AS `Publication_Number`,count(distinct `t_reservation`.`num_reservation`) AS `Reservation_Number` from (((`t_user` left join `t_property` on((`t_property`.`id_user_owner` = `t_user`.`id`))) left join `t_publication` on((`t_user`.`id` = `t_publication`.`id_owner`))) left join `t_reservation` on((`t_user`.`id` = `t_reservation`.`id_user`))) group by `t_user`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_general_publicaciones`
--

/*!50001 DROP VIEW IF EXISTS `vista_general_publicaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_general_publicaciones` AS select `t_publication`.`id` AS `ID_Publication`,`t_publication`.`titulo` AS `Title`,(select `t_user`.`username` from `t_user` where (`t_user`.`id` = `t_publication`.`id_user_admin`)) AS `Confirmed_Admin`,`t_user`.`username` AS `UserName_Owner`,`t_publication`.`date` AS `Date`,`t_publication`.`status` AS `status`,`t_publication`.`price` AS `Price`,concat((to_days(now()) - to_days(`t_publication`.`date`)),' ','dias') AS `Publication_Days`,concat(`t_address_property`.`country_name`,',',' ',`t_address_property`.`city`,' ',`t_address_property`.`street`) AS `Address_Property`,`t_property`.`type` AS `Type_Property` from (((`t_publication` left join `t_property` on((`t_publication`.`id_property` = `t_property`.`id`))) left join `t_user` on((`t_property`.`id_user_owner` = `t_user`.`id`))) left join `t_address_property` on((`t_address_property`.`id_address` = `t_property`.`id_address_property`))) where ((`t_publication`.`id_user_admin` <> 0) and (`t_publication`.`status` = true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-11 23:59:30
