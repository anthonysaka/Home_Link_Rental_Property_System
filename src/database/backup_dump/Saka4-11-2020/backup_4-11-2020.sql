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
INSERT INTO `t_imagenes` VALUES (13,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	\Z\Z\Z\Z\Z( %!2!%)+...383-7(-.+\n\n\n\r-% %--------------------------------------+-----------ÿÀ\0\0·\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0P\0\0\0\0!1AQ\"a2q‘¡#BR±\Ñğ3r‚Á\á$CSb’“¢²³\Òcƒñ4Dst£´\ÂUd„¤\Äÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\01\0\0\0\0\0\0!1‘AQR\Ñ\áaq¡±Áğ\"#B2rÿ\Ú\0\0\0?\0wh¸bÜ·‘\Ì\\D\Ô2A\Ó\na‡9\ĞÆµ\æØsH(¢\ÃAº\ï\Ï\Û\ê­_j^\ë%ƒq\Ê^´\Ä\07++˜‚d¶X\×^€õ¬\Í\ä[Šn¤\æ\å ¢ƒ*cq¤\Z\é\È\Ófq\Æ^f+<1¤\r½â™…}N\àF¤o#nc\Ü*\Ó‚ \ÛbQ¥]VH\äN£\ë\ruU2·x\Ùd\æ\ZIúA‡·ZÉ¢\ĞF\n¬.f\ÓH\ZxAf\çıR@\Ö}š²ö…V2:\r¹\ÏÈƒú\ÔG\0°—\É\È`\Æ\Ğ#S¤\Ìy\ë½hlğ+€\ßS\Z\æ)q³¼e™,¹s6\Ê }i¨Ø™MÁ¸­\ì1l…Ô°÷Ï£3Ë¡\Û\×^±Áq\Öñ·Šx§+~’óV \ï\r^O\Æ\çI\Ğ4„*T\ä` jI\Ò ¶+Ğ»	x>P„\êyr´¤;*\ÓÖˆ’6xkË°¢Nµ]‡Ş\\LWCD˜¾-\Ù\ÜØ¬§3##8,-úy”Œ\éH\nd\êFü\ê›\Ãpö®.wfse¡ÀŒÒ¹K¸\Ò\0“\â:\ÌD\Ä-‚\İ\ë•<‰\ÊDƒ¤ò™û*‡p\Ûw¯o/\æ\Ë0D©ô^C‰\Ön%&f1¥kMi–\Ú2\01%³J€HÉ `I:\ë,+SŠ\áIy‹!„\nP¤rHo0A“\ËW\×jó.\Ğqóul‰S–\Ğ\0\å \n\r\Ï9:s	¸\Ãvş	ÍCK\É\ÊK2™\æv\Í\í5…5z£\Ğ;5\Ã\Î\Ê\Ù-š	\Ö\0Œ\Æ`\Æ\äIñs«e·­	\Ã/ˆ®¬¬T‚$€wº´Uš\Òè’¿j¹n¯1Vªºõª¸±4d{]\Ä\ïYO™I;³h`A˜]\É\Ø\Ï*óG\Ã^,c1uÔ‚	\"Iô¾\ã[\Øv…¬b`(\Ñ#+D\ÃF\ÓX=\Æ9\Î[øF\í\×b-¨\È9|Ló\Ê	\'šr¬24\ÙQT‹¾\Â;Ëª\×Hù\Ûmó~ 49r¾µOÆ•\æ\r´U[ŒA3˜\æ\ä\Æ \Ş9u­o\Å–V\Ö…\Ãdº\ÊH5!.l§À6\ÒNƒ•gñX2p¶\Ë0{ƒubAP>):\ÈPft\Ì|éµ¥³\á¸Ô±ƒ¶÷\î P2\æ\ÙLh#¯¯\ì©ğ<V\Í\ä\ï\Æ\\\Ùdé®‘¿Y\ë¯<\Åp—]\Ò%²ƒ%s?J3D[Aª¬F\â\0°Ó¹\è\Î\Ó\êø\Ívpö`œ\ê&qY\Çñ;\Î^\Í\Ó9@+¦»\ê$X‘\á:‰‘E«rkx\ÊÕ™µC”T\Ën¥·‡¢\ÍÃ¢·]rIq(g!^4\r\ÓFŞŠ «B\"¹\"¤¸‘P0ª$“=*†iQ`y\ç\Ä\Ó\ŞX˜0\0h\Û<N\Ä{LUX¾S6\êP<¤\ï\Ì\Ï*-ñ g¶|J\ç\Ã\â 	#\Ù#Ÿ¼\Ğ`8U¦²{•\Î\Ù$©9X™S˜)\×.™bdœ\Äi¿—NOC¨Ë¹?6dÀô}\æ}¼\ê\ã†Ş´÷n6#U¸d\ì¦@ó1¤L\È U>)PG$÷ j»‘¨jË³¦Â¹8™\0”¨m#HÓœ5Î¥sÀ32\Û-¾\Ç\Ë`g§\ãj¹N6@$e»\r%e’¼\Ô\è°Fºo\ZPŒ]²÷J¤£\ê•PvØ>\Ê\àY¡\0k2fš9\è\r‡LB»\Û#-¢\å²\Êer¹’\Ç*\é\ÈÁ4¡ñœ_„Rö\Ó\å!‚‚3e‰\n\Ã\ÂH\ÍWğn#w\ÑP%€P·2¨\0œ\Ş–u‰óšeûW‘œ3Z!¼+²’r°YlÀA\rrDÎµ¥\éd›\r\Ú\Õuµ\ß\0¥Ã’\ë9!ˆmÊ“:òòÔª\Èj ú\ë\Ïû?Ã­/x\Z\â‹g#f,®|-\â•Ò†vĞš\Şvcn\íŸ†*[7-sÓŸ3\ZVĞ“­Ih\Êv‚\İÛ˜†´¹ÀÌ¤¡iÊ \ârÀ\Í2u‚‰\Ó;Ù®-k\Ş\á±\ä¹*Ì†T\r¼ i<Àb½fş\Ñ\ÏpÄ„*\Í;\0	>@×—c,Y\Å^aj\ÙUuİ|AL\ç\\§\"GXÎ¢|\ìh©\à¸Kw-2]\à°^Ó‰\ZÇ»i1 \ê:f‰:\n;µ,%Òu\Zİ¿¢Œª\Ğ\Ñ*#0\éÏ¤U.\Õ\ä¶/*5À–\0‚y iy\ÓL±W˜Œ!¹‹»qb\ì,Ÿr4öĞ±\Ğ¡\ç¥e\ØYu\Ù\Û\Ç\È\Ö\ã¹U.@‚P \ÌF“\ì\é–Z@#PDƒ\Ô\Z\Äö7º¾LeE¦\n\â$²¾bI`C™^D“Î·x+*Š¨\" §A\Ë\ÕV„Œu“+mK4À\è	>À7«\å´&j‹¶<7¾¶©”7ŒeH\Z‘¯>D4¦¦y\'ilZ\Ä_8ƒ™m¶ŠHÕ™`ÀwY i±‘\×*\ès”™U•\r\è\åwõøÖ·Œ\â\ïZ²0\Â\Ğ\Î\ÊHf!»²\ê#(•ñf&4:MR\âxk\ÛqiFŠ§;\éFmm¶€\é\Ô\ÄøI‘\Ôh³XÃ¡\Ê\Ù\íNPCê¤\ÚhO„1c¸M÷0’ıò90ªåŠ·Š):ü&G?*½\ÆpÄ¶‚\îRÊ¡Â·\àS´\rŒ°	%\á¸m\ï	.¹”›\Â2B A‚\Ã0€\Ñ	&b¨EwÁ¹	™\×\Ãt\\›)02Áò•;ö\Ğ}µ\ÃÄª.¥m®rt‚Fú\rÄ’yj+IÀEõ\Î\îXú\âr˜rP7\Ò!Š¸4\ç\âª[˜{‹‹KX¥\ï™Ø‚\Ä\å™ hD\ÉI‰\"HÜš \à»½„\ï»Ki c\á\n5\ç:“\ç\å\ê|ò^´·Sfù¡\Â\r`\ìöyqmµ™-©D·\0b|`–ú\ÆXGˆ\åW¿“\ÅAr\ê-óp/„`h~Šó\0@š¸6´bi[Xz(Ø]´\ÑS;iT\ÛUˆJ\âU†\"&ƒ¹{•kX\ÛD\Ó *{“Cİš\Ñ\rˆ4Š!õ§Ù±4XwuÚ³\î)R°£\È-ğ\Ädn\î\ãrğ•\Ó\Å¨>	\0O0|¨l-\×SF%r4 1¯O¿]\Ç\àV\n\\\\Š\ä,ƒ\â³0Ä¨€Å†\ßTrš\Ìq‹6wn[,5˜`±ô‡6ÊG(=8\\iY²e_p\Ì3[R\Ñ{,\'\ÓÍ”5\Ö6ò£.m»¶\ĞFB³”\ê\0aeµ\Ö45¦`\Í\Î\î\àQ1HĞŒ¾,Ã€mZ>‹ˆ½r\éRn*Ú“\èÆ¢> ×¬O:•©E\r‹ˆ¹†B\Ä9\Ê`Œ\Â#QË¬y\ë]\Ï\Æ]\Ç!\0Á ùˆó÷w¸%] \ê\0ƒ\Ôi\"6\"‘:\í\Êyş\'\áR\Æcs(^DA\0H:A\ë\ï\Ój\ÒÚ‹–DM«¤¢5¼\Ú9\Ì\\	¤«\0H:‰FJ\Öt3\ë\×\Õ\ĞmV\Ø,nR%Añ¡IÓ»}h$z;ô§‰f\Ø`\à¨[wgmF¤4™W[~¤1<8²\à<¹°\ê+4˜\ßORHú-©\'\Ñ}+¼÷ª.\åP\Ò},¾µ\ZD‚gMÉ«\Ë=\rtUyÕ¡tAVy+*P\0Cx[+«ÈŸHLLf\ÛZ¥\í¬bƒ#\0\à6tÍ“77‚&ga$Ï˜µ\ã}\î\î%\Ë]\àZ\Ù(e‰¸døt\äõ$\Ç:Íœ%Ã‰$-\Ç[%•\Ğ\×6¤c£€‹	Œ\Æ|“\Ôh§\ì÷¼˜B™T©\ÂIB21P¦\n±Ñ´Q ‘\ä6¯IÁvz\İ\äÎ® 6i®­\âRºH$zC);\í\0føF¶÷Y~Ky@RenO\é\Ñ7‰¢ÿ\0\'}¤¹y®Ø¹m\Û$Œ ‰!¡¤dê³¯:Î‡f\ïø:Ú…X§R\'¡:Ó­aüG¥wÀ\ïE\nNÖÌ©\ãœLXB\ÒQ ´A\Ôl:‰<…b;A‹[ê˜§¸B;[p#\Â4ñxZ8\Ş@±V½¯ÄŒM«È·rœ:\æ¸9§@9˜:F£\Ö1ı\Ò\â>H—/[d¬²@F\Î\ä€¦‰\Ğõg8Ÿ½jı¥°v<d/\ÎeAo¥:±#Ÿ‘œ\×²\Ö\îŒ5Ëª¶ÀbI;+\Ëe	#™=kqÄ»P0\ê\ê,3wBĞ´ÄŒ¤f¶Ù¶d?­@+\r\Ä\í÷ZûƒmZr—$Á1”k\â\"mC\Ñ{7z\Ş\Z\Ñ\ÎZ\Şe&\ÜÈ‹¯\ÌY&¾u\Ë\\>û\ÜU=\âgu%­s$NÁF@¡@\n4Š\Ñp«‰w†5ŒòV\åµb!IÂ—\ßQuõ\êySbq\ØÅ¹-\Â)0ñ•Œ\0ruV\0\'R3n&€4=°\Ã]¶\Øu°¹+d0€‹2\0P|C\Åm\Äi\Ü\ÛÖ²\\/i­*\ä¹\n{\Æu\r D õy	ø\ÜJµÁv\ä…‚K¼\ïœ\0uvÓ¥bûWÚ–\\\Ö-!K—\Z.3\r[4lA1§N¢j\îµ&%¾-†ewÂ—,@bÄª\É\0‰\0\èF´»-\Ãm‡\ï­=Án!T³e#Q:{bv¯9\ÇcÈ´\ã+\ß\ÌQ•ø‘ #\Â”\Ôt\î+w\Øn\ĞÙ¼½\Òg\Îv\Ìz”r \Ğ}®2·LM\ÅZ\åË‘B÷\æ\Ï\"´¡\ßi4&MhÂ¢¢e­&†3\nf‰¹h\×\nM\É\0%ªmEY\ÚÀ”U®\Z9š\Í\åCQ*Eª\í^|‰:Ò¨\âtù\Ó‰`¡C³•fP\æc)#6\ÜışSV\\‰™l2†eDfúY@˜ƒ\Ã\ÊZ[¶®‚l\æIğ‚¨t‚L‘ñ«\É5«j\İã”º*±3h¡0@5\Z\Ì*\Ås4~Îªb1s‘–\Ò2 \ÌÀ \ÌF²<€5À£3[U\rÈ‘\â\ÒóÖ¶\Öx‚_\Ä\Üv\Øù:\Û\Ü\ÍŒN`Ú—\Zs\Ö\'¥SvK\î|[û»yõö\Å¦\Õ\rp\ì\"|šò³î®‘¿WEŒ¬?JuA\çP¢\ÛK$\0³œ²™2¥`°w\×q˜é¨«Af³{\"™8\Û\Ì\nŒ\Ñ\àˆ130r\Z‘­÷\Ö\0¥\Õ\Ò\ÕÀ\áC\í•Z	\×(mg\Èù— Ÿ35ˆÁ\\’•ic”@ƒº¤·¸!˜2#€Å²‚½ƒ\ë:6\Íi\ßP:>pm[V•|\ÙI10d(Ì»Lhvª\Ü8‘iT–T|\Şf¨\Ë‡‘ŸK™»#k\ÃûSfÁL9$\ä\03ªQú \É`t\Ó]6–±$€fz¢°÷û8\âÅ¢b\Û\Ùf\Ê3f,’ş\'\\\ÄtõyÖ‹\rz\âZ®‚;Ë„#‘±Ô“¦³]\ÕÌŠ\î/\íbHŞ¹\Ã\Õü$¬Ab§)f«†$‰‚+<8\Ã\Ò?\á\'ûjT\â\Í\Êûv¿uböŒ=\ë\èh±d\îg8W¶xkI+nò‰!²…75\ÓH>ò9\Ñİ›\à….%ÜfÊ†c9™²\êt<ü& ‰UaÛ²l­\æ\ÈsÌ¢“ó…‹kXÑ¶øµ\Õ\0\Í\0ùµ\å\ì¬ı§‰uEğrx_Cj–b‰QXq\Çom\ßë¶¿p®9{ú_ı1PöŒOı®¨kO\èV~SÕ°Ì¸‹LC\İ9,ˆ\é	ƒ A¬6%­\ÛR¸ö\Ñn\Í\àá”—\Ò±X“¦U“+y\Äİ±\0‹·IGv›Õ¾óTøN\ÌX·0\ÌAR°Ê§~{zS¨<¹E/h\Å\ã]Pprx_C#…\ã^ \Û]1‘š\Èps\0 \èdk\ÈuZ\Óv§\Éeˆ\Ã4—\Ê\Ëy[Ì’±\Üi¡Öœı‘°X?{{2±a@’dˆ\Ëı]ª\Ë\ä^õ²³+\İ\ÛJ2rQ¤1\Ó\ÕMg\Ç\â]Pp\ç\á}\âıÙ‰\r\Å\Ír<Zj&A\ZZ7\ÒN\Úz\Ïg0¸{ Ü·tu,	@œd-\ĞY‡\ìå“»ÍŸ1@I1De n4\ßZ·¹zm÷}\à™[eKrñe 4Ú…›‰uB\áÏ¹ô\í¶/“†‹™,ª \å\0\Şe2%á‘»oµWùE«\î–l¦#:\åKŠLf\\\Ã\Ä\Â$\é\ÌRMKH·\ß\ß÷-‹g\æ\à@\0Dmñ=i\Øn\í\ã£*³’Iî‰‚\Ä@$CMG•l~%\Õ\n~\Ğ	Á¯^$\\!†vd‘h»\0\0Î‡I‚J€£&\Ïğ;¸\\y¥H‚X‘˜·% \Ô\Zz$N“Z\\e\ÕJ­Á¨‚\İ\Ñ\Ì}³¾´|\Â\èº.ÀP-,(\×E\Ó\Ã Ç¨B\Ú1x—TO\è_ñ`´@ ’yIüMnH¨Ÿ}e8…\æºÙšó\0xm¨˜˜\å\æh‹<M‘B÷\í\0@ùµÿ\0ml¶œoı.¨N\ç\Ğ\Óä©­a&²Ÿ\Ã\Ì?Ÿo\î“ıµ\"v±‡ó\çû•û©¼\Éòb\áµ\Í\Zõ\áµ\"\àÀ\åXó\Û\'ş›ÿ\0DTo\Û\Z\Ş?\İº£y¾\Ñ×¸\İw#•;\ä\ç¥VöRû\Ş\ã¹e eUw\ÖL	˜}h.¼mJ\ÄWü‡\ÕJ‹\Ô{©S¶\ÌWxŠ]\È\\-»£Sq¡\Z€	3\ê\ç©5Z™™\Ì\ÜMN¹\Ä¦§HŠ\ã[$Gœ¸$~6¢-`\ÉP`\ÄÀb r\Ó6\Ã\ßÎ³rlt\ÃøÑ›—.*\\\ÎX\n¬¢`ú\" … \Ç!4wcñ%n\à€û’\ÖÊ|½|\ê†íŒ¶\î(Ğ’¬\0=>{\Ñ61eÁS\âW-´\ë#q\Ì@\Z¤õ\ê“ü8½ƒSœ÷^\æ\êAô \êt2z”_ñf\Ş\İ\Ë\ËiK\í\Û%–\ĞFU9tô¼\ë;ù7\Ç]\î2+0U3¢“$\ÄÁ\ĞL\r\Ë[\í[(¢òF#.I˜0I0F¦#°¶¦jª‘™\âX·8›\Öğ–ó¡\nW.di¸ 1Ñ†¼öµ?„ö\r‰e]T€º\Ë:f\ØÎœ¦F†¯¾^ˆ2\Ù@Xpû\è[—™Œ±$ş=\Õ\r–¢\Ùb\Ø\ÔM-‰ ™¤\è6\Z\êEˆ\Ä3j\Æ…F)¬	\ØVSR‘¼b‹`5ª\Ü7k0¡ˆg\Ô0¬c—!W_#“­yŸÀg¿|t¹¯\Ïr~\Ê\Â[%­M\Ğ\Ó\Ğô»}¨À\Ç\çO÷W\ÙI»W\åq‰òµ{\ì\É[,Ã”_K\Ñ\Zf=(|O\0³ò›\"\Z;«\ßHık\æğ!\ï\ë\èuñ_\êõ2ÆŒ\×m›\ß\ì£µ¸KÎ–íƒš\".I &WM­oñv\Ç5?\Ú&¨\Ç	·gd¢\Æ{š\ë¸6n\Ï\ÅjV\Ï§\ç\ĞW\Ï÷\îS\Ù\íV€E\ÂA\én\éû;Y„\Ö\Zá–/>I\æ*÷²\Ü\Óa,1S&Ú“©\éSa8%‚ø‰\r¥\ÕúGú?}G³\Â\Ú×¯¡\\Wú½L\Ş\Û\à•²—i& ÚºúŠÖ‡	ŒBA\î\î,÷V+·\Ü&\Úcl„”\êIú|æ½§‡a@\n\ë{*ŠU\Ús<\Îİ˜.\Òq›V\Ïx\Ö\İT\0û\ÇHò¬®#µ\Öy-\Ïm·û«\Ôûeƒ\riv\Ò\ê¶±\ÜK\0\Æ\Õ\ÂJ\ÆV\ß\Ôv¬RJn/°\Ò2¸¦Œˆ\íu“\Éÿ\0°ÿ\0uXa{M…\Ó1}Fh®6’G\ÑS\Z©÷Tø\Ì+¨9tû¨\Âp»l\í™gù5ƒ¹\Z›˜™Ú‰B-÷¥$Ğ“´¸1¬\İ\Óÿ\0·¿şÊ“\Û\Ôm\Íó·\êV«‰p‹\"\Å\ÈS¢9\Ü\èrF¾C\İO·Á,•RWúM\Ó\×\\û°]ıW‘{ò¿OS\Ïq]¯Á\ÈUg\Ì\Ä\0\r»‹¹¤£r÷Ÿ¢}\Õ\å\'†[·‹Á\äX–©?\Î[\ëW—8p\é^¾É³BXÔ—oyÅŸ<”œYB\Ø\Ñ\Ğûª6Å‡\İWOÃ‡J\Z÷+»€\Ñ\ËÄ²’\ï\Ö\03Gpœ\\q›¨Ò£³€›†=U¬\àx0hNQ0ù\Ä\r§sS\ë¨\Û\Ğ\İpğ,Û´¤\0\îLD‚@ó:Q\Ü\ãJn›+€˜‰U\Z\ÌÁTúW–v·Wn¶P\Èí’<:À€ºss3­f¯ñf—r\Ìw\Ôõ\×m²ª\Ìl÷{£\Â)ƒˆ·#¡${ÀƒJ¼,ñ.Š±\æ*v…f³Ø‘s/ò„9t\"\Äf\Í\Z:\Û\ßA\ÙüŸ\ß@B_V™11m\0š™˜ó¢†=¹\ÙoaSö‘N\\ü+£ØŸ±\ëƒ\Ú\å\Û¯¡\İ\ìË²_@;}ƒ¼Ì©pŒ\"(eøÕŸ\ì>\Â\Äs$ \ä_\Õ_N³ê¦¯wWõ_ÿ\0Œ\Ñx~\Óİ‰ı+w\Ç(«\Ùõ‰–\Í.Æˆ±£\Ó&\ŞE\Zg*öPm\ë>ê­»‰vÔ¹&D—i´F“W\Í\Æ07:¨§\ë÷ˆj\êğ|=\àN”‡q{fº¡–ÿ\0–b\à\á\Í©sú\Ê}±÷\Ñv\ÃÁ!&øLı±G/º˜?ª3h\Ş\àjEE\Õr¤\Æ\Äe?\Ù\"El¢™;\äv°ÿ\0Y[\à~\ÂMÀó}¢§[G\êÿ\0e\Ï\î§:˜:8\ĞıSö“Wº—\"w¬\r\nıe÷Šó.Ì€17Á\"\Z\àßŸ\Î?\ï¯R°<+«\ì9ªò\Şr1WÌŸ\Îrü\ã\Ğù G·*Ö™Xwy!¼CHqûGC5\ËØ´ùUŸjô\ê4–±Fğ\ç=\Òjş‰\Ü\Èm¦•\íE\â˜\Ü9\ã\æ¯t\Ñtªğ\ÉK¶\ÏI\ÏM{\r¯\Ê\Ó\ë/¼Uº‡‚ue#¾ AÓ¹¼Aøšª\áf\Ø1x\Ş¸e*F¤ï¦”C\ã­5\Üt÷\Ï\ì\Är±`J¸\ì\ÒR¾\ÂH\Õ½—¼£†–QóI¹}µ?\Ä\'yˆ–\Z\İ^cú47f.‘\àˆ€\ì’\"GP*¶\Î4+\âK]¸\0¸±\á\'{ºiRöw):‘%©GùJ\ÊqXF\ÓH\ä\ë÷×©XÄ¤zK\ï\ã¯\Ç—p’N\Ñ?¥kjõ\ëwOW÷/\İ].\rF)ö6›tÚ¬Zw+¿Q¡bk\Äøˆ\Ê\Ên¬e:9]i{Qp÷I«~yw\Õü«\Æ-œ\ÇG ó¯7:\İ\È\ßÀ\ìÀ®)·$H eó\Ü¥Xv7–\îe…±¹\Zü\æ&g¾©\íaµm[q\Éz\n#€§\Ï\rÿ\0ì¶¹\é1T*Ü•÷~Q¦\í\É/\á›N+\Ål÷7@¸§\æß˜ú¦’q»!w‰!D\ê4\ĞU?°;›— Ü‡\Õ>T¶2ŸK\èòQ|«8p\äøJ\Ê_\Ê7½\Æa¿ªÀ¤jöÎ‘\ì­r²\é/¼V3¶«ü»¿\çñõ¬ô­Å‹G\"\êşˆ\ä½•{û\"Q\Å»>¹$t úC\ßÖƒÄ•\0\ê(ür˜\Z¿¦œ—ë¯•Gz\Ù:Kû—î®¹J‘‚Z•\Ø*7\"wü{Ç¾†\íG\Z|5»}\Ë\0÷’`ˆ\æÔ‘\î5ku¸[\Ğ~Kõ­yWŸv\çŸ\È=J-f­ş\"G\ê\×/a¤ûŠ“~v¦³P\×Iûisö\Ò2 \åx\Z¢Ÿ2Oû©PI|Fÿ\0m*,Tz\å®\ÙğÑº\ë´`§/jøY™p:|\Û\ï\î©\ŞÂ±\0€A KŸ\ëV~\çc±7.À´\î!FRB’Ö±;šñq\äRuªùúÌ¢Ò¾/R\ävƒ…Ÿ\çP{]~\Úzñ~gùE°y|\èøÉ¬÷\ì5Õ»’\Í\Ò\Ğ<]\âØ\ÌDZ\×cU8ş\Èb-@‹dİ¹İ‰K\'\\ü”}J\èŠOı¾¦M¿\ĞÜ‹\Ü9ö\Ä\Ûşõ)Ãƒ\àœ\È\Ä,ı™~°\Õ}•…~\Å\ã\ÖlÔ·ûS“²\ØÁÿ\0tÃŸ\Õû¯Š‰¨?õõE\'%\Øz.	q?5‹$rÄ†ÿ\0Mwv\"\în¯[diGp&¼\ïøğÑ°˜Sÿ\0 \Õş3±ö\n+*J+x^\àŒ\Âtù\Ê\Í\í\Â\Ò\Şzü\Zû‹‡Ÿuø/¬\İ\Â9Ê­\İ7\Õa”Ô¸\Ê1ğL‚¬\Ò\'\ØH?\nò\'\Ù}\Î]`€Y\ÌIcZ‹wcKx§ªòÀûwø×£‹lmkû÷9§³S\Ğõk8\'\0€\Î7/eb0]\Å%Û—3\Ù!\Û0úx‹jrùĞ¼µ¸¼EË¶•e­,{Ò …9L§_)¢x7k\ï\â-÷Š\Å`¼\ì\é\ç[{Uº§§ÀË„\×i\é˜{ì¨£)¤ipÁ\'j¡\ã*\åüE«…W\"#£\í$¸Q#B4\ËTvø\î#˜oíŸº¥\á¼cz\Ú]L#•u§¿A ‰\ZEs\ïc‹\Ş\İ}}M›\Ò\Ña„\àwWG[L\"\çAF\Ú\îb7¦\àøô»‡bP¥›™\È\à™·u\0\È\Zºë¡­	‹\ã\ÛY{\Ì®f€~Pœ”´m\ÑM\rs´xŸ\è£ÿ\0Ê·÷Sö˜w}W˜,S}¿G\äi86ı›XtmM”Eğ¹‰P@#I\×\áQ[\á=\Ö(v\"\ã\é\àE ûW\ãX»ı¶¼\09H’Àü\é\"UŠ\èUH;T#·8À<¿œnsÿ\0Ê”3B\r\ÉEõõ	\ÂST\Ú\èhø\ïdnŞ»i\í÷h–\Ì\å,ÄT˜\ÓMnÍ¿ö\Ï\ß^]‡\íf(Á\î\Ë\È\ï˜zn¨>‡Vgˆ\ãÀ\å£}.“ö­)m°oTşa\ìs]\Æ\Õ\ï[\n‹?Š\ãF™ºk\ÌU\rş	‰y“h#ÓºefÛ´ø³ô.tô\Ï/ew\Ú\\S0X`\Å\ÊC^\È.c,\Â+9OGn/ªó4K,4Mt/ÿ\0€1B`\Ú\×ú÷>\ï*›‡p\Ö\ß<§\æR\ÜmÕ¯4\í·\Î/¸\Õz\ãq\Ùg»‘\×\å‰6cH·¤¶ø\Ëc\Ñ$l}U\Û>\ëU§.kÌ¿ï»¿£ò5øŒuu ø”w |µ©r‹+\ÊIbvP9ƒ\Ó\ì¬rvƒ¬\ÏxY®%^#>\Éä¦™‰\ã8¥\İ\\\Ì?uğl\íi\×Ô™\åÌ²ú¥\ì\í\ÜEûS»Al\ËL·‰\áw…Š¾KL»\0?8ü‡ª¼ß‰ö§h!bğ\Î\Óm&u\ÛÊŸübºL\×\Äy0\r\é™;N\İ:\×~)(EF)œ²¹6\Û7˜œ#°\ØŸ\Î?\Ñ`~¯•s¸aôG÷¯÷W—\ã;iŠS\nn¤\Ü#ŸHö\ïÎ‚\Æv\Ã\çu\ãi\'}zu­KÑ¢5\\™\ê˜\æ\È{æ€¶\Ñ\ÉÙ§\Ña¸\êµ\ã7Nvf¸\Ò\ÌImÄ’I\'\ßSb{CŠº¥ût`b:ò]ŸN^³÷T9.Á6\ß0²šDş:\n\í\Ív#_UKfğ:4;û\êP&uŸ\\†¾º$ür¥B\äi­*c=\áw¤9ƒ\ÌU\Î\nõµ[EI„À2Lz«5ma´H\Û\Ö(®\Õp\Ìø[7²·IO\"c¦Ó¾Â¼GS\Ù\É*…\íû«s\î„2²ˆ#c\ãöUOiG\Î`ócıEw²œ2\ê»5\Öq\áRˆ$\Îa\ã\'s <¨\Õ\Ûù\Ìşp¡ˆ«Š{\×ñ3¿\â—À±\î\Å,•#@ÜŠz	\Øûª7\r7 \í§\\MòQr\çr:	\ÇI­õû\Ç%°óIşQX\Î\Òò»\è¤\Î$…\ZNX,O-NÕ¬{£*\rI\î\Ğ|VÒœ”o÷‘>lo0: \Û\Ö*‹g×¿O?]i\î?‡@}WNf©1\í<\Ì\ÏQ÷V˜yP\æg¿\'Iü³\æ—\Õ_\ä\Ë8OùşT¨\'?ö\Üg\è^ÿ\0TU¯\äº\Üa\éq¿\Ën½=tşòpdÿ\0…ó4¶°c¥Zö\Ù8I±oü‚»b\Íù:\0p\ì$s\Ã\Úÿ\0 £kŠtƒj\Ø?m0M—¤ü\ëhüÕ•\Æ\á\ÔZ¸\Ì\"\çI\Øtkq\Û;0ü¾xÿ\0£z²U••Á’\n°#¨#m\ë\çvÛ\ÓÇ–Ÿs\Ô\Ùu\Â\ï\Şb.\ÙSa.†\å\Ã”»\Z\æ*\Ş¤›zŸÎ®oY\È\ÓNö\ìyx2Å¸Fô“\ì:õòK¸\ä„C0˜0-k?œ\Ãÿ\0\îl\Ö\ë†N\ìDL^ªÂ­\è¶tşs\rÿ\0¹³[«—f\Øıû+Î•«¿\Ù®\Ã-c…Û‰gƒ™´‰úMT8œ0[\ë\Ì|¢\çú-ZK“×™ûMQ\ãS\ç-óşPÿ\0\è½k‰\Ş9ÿ\0\å•%ü\ãñF†\âL(\ÛIš\Íü„4\ÏpOü\×y„¿\Z~7¡p+;};¿\ë=x‘œ£ù=¿—ï¸§\à\Ø`x†\Î\åÁÿ\0\ë\Ş5¸\âü:9VW…¡\\~§}pnùa÷W¡ñE}?ÿ\09\Ş4ÿ\0y>Ú¿±AùD\ÃfÖŸÏ¯ùnVX\à€ôI_\Ñ$}•¸ü§\Ùù‹`s¾º~¥\ÊÅ­‘¯(\ç¨#¤Áƒ^¤\è\à¡Œ¯ np\ßh¦.\à®Dq¹Ğ©²¦“]D‘\Ğ\ê~Š\áøÀI‰~j(«*\nŒ$!]H\Ñ\É\ÚG\Ò5\Ô ë§——²‹K\àhNä‘¸‰\'\ãJ\à\03\Ï-ÿ\0w¬Ô´&¬\Z\Òó-\ÏA9uMv\Û€ yƒût\åQ[ñ\Ì6òÒ¬l\ØF\0Àıÿ\0o¾˜”P\'È‡W÷\nTp\Ãy‘êŸ¾•Utô=Á™|_HO¿\Üb\Ñaj\åÀ\à2–L±–\"1ğ™\ÖdÀ\ÔU?\á·.!TbN^\ïW\"|$±ˆ:Wcq7–ñ¶|¬P\àŸ\Î~u\ã\Ç\Èÿ\0‹£¿.WMh{Ÿ\n\íZİº\äÙ¹l\Ä$ˆ\ÌA!dÁÛÛœpa„\È\Ìb¤¬±ó‹ {nşß‚Õ·/\Ís\Ë&4ğ-¢šnvŞ¬8\ê_\Åa\Æ\Z\ßwp\\n\\s9]9 \ä\æ£\Ç\"¶¨©\ë\nKS\âX’\àµ\Öb$Ê§Oš\ÑvVûËŠe9E¶K¥H\n¹s0&\Ü\ru\Ü\Ï\ÊYü_!ƒ6\'\r§&´\Ì=\İ\àŸm^\áñ©\Åa\à¬KAyw„s®½§$g\Ük\èüŒ6h\Ï·¦û(‡\á\ì\\õ›\Ü2\\7/0uu*¤+ H#siUw±0\Åÿ\0(¢qcT¯\Ê\0rZµ0t0M¶#\ßQ6?\0\nsF’\Ê\'OX\ËÃ›\æ¾ÿ\0“£‰\Éı†_„Áú#Q®\ä}\ÕUu„Ì“¬\íFb8šŸ¥§èº«ob”ı3ı–ı‚·„\Z\ç]Q”³C¼«\àX\å\Â]\Ä\\Ì¥œ\\X\×L\×k\è\Ûz\Ù~Ownğ\ëú©X.#À­\\e`\Ùu%‡vNi \êI~ú\Ğ\á1\İÔ‹}\à–!IPIÜu:\n\é\Ä\ã\ï9&ß½yœŞ‡¨\Ú]\rcû)·ò,:œe\äaj\Ø*\0!HQ ›gA\ëöĞ˜>\Ğ8\İn·—xG\í®\Û\Å\á„Gµş\á¬ó\íÕ¸\ë\æ¼ËŒqµüµ\ê[\â.{*¸—½.\àx ›¢tˆû\ÏJ±ş¼Hœ \Îğ=Zg~]†ÿ\0\é\ÖÀøÀ®?±°ÀX\×\É?\Û\\9\àó\ÉJRZ{\ã\æo‡&<)¨vüFq;9P¨\Ö/\Ş\ê6vh;\n6ŸIzOE0ª®QD\è¤(®csP.uù³ıº\Ù\ëÚº¯1¬°K™,ü\Ùÿ\0\Ä\Ãù\r16O:½ş0\Ù\Õ3	P£q®Àóë§²©ßŠ+{®ªA\Zu\ë–\Ä`¿•ü§)ô‹#MDo›®¾Ê‡d\ç$¾i÷i\ÌĞ£ÿ\0&\ê\æ5~´kÒ¨ûG\Ãb\à\×ù^mÀ\Ğ[bwÊ¼QH\Ö\ÓÏ“Ÿ²M+œB\Ó\0­†\ï‡—†ˆdLi\í­0\âP¾Zû×˜d\Ï-Ü¸\á·>Q”[[ˆ¤’\\5–0š\Ä%\ÂA&9V{	ŒÅª²¡¸\"\í\Ñ\\ˆ\ïoP|õ¢ÓˆaWş\ålü1û¤³\Åğñÿ\0b¶@£\ì\Ë\í¬\ÖÊ£u]W™~\×|\ß\ïAœˆ|v¾&Ç‰5\î/ıeé˜ƒ¥y\Úq¬:°e\Â*º™WU ©‚²4${jk¨\Íı(ıgû«·gş¸\î\×\Õyœùg»¿¹\ß\Ê*\æ\Ù;\Ê\Ş\åz\Ã|½]†[k\â\"!I$ŸV\ßmi8–-o©W,Ë¼1fƒH¦³œ†&\éº.\æ9J‰B\"c]ü£\Û[dß–±uóG=¥\ÚÀ\ÆFrZ=Ù¨[œ=[\è¯\ã\×V¯\ÅÁ0A>q\ã½s/…sG6e¤\Ğ6Š›\Ü¤o:O-y\ZøI‚ƒ§Y\Û\×zy\Õ\Ã^ò÷P=\æ“ A\ë­o·\ÌVŠœ6\âsŸX+û¾4Š]·½¶\Zo?U^=\Å?\\zšGº–\ÑC†ñƒ¶if@\0tŞ´RLFw\åm\Ôÿ\0‹\ï¥Z!ƒ¶u´óbò2´©\Ú¥óbÜn{´¡~L™³@$™-•dŸ\Ò\"j\à\rÂ™\ßÿ\0Zà¬.š•ógXÏ®‘q¶¦€\ï<¿e,\Ó\Èûf§r~\'Õ‹x;¼Â‘½¾5^nQ]\íö\Ò\à÷†ğa¿\çQ›ªŒ\Êie<\éğP¬˜z\ë¾\Ñğ¨ŸU:\ÚzÏ´\Ó\á 	9Ó»\Í4h¡rùG·ï§„\Ú\\0²u»\çö\Ó\×\Êm\Ç]©4¸HvŞ‘\Ï\á\\2\'­\çKñÊ[¾ut¿õ½\Ô6\Ã÷\ÓC\ïG	†w£©÷\ZL\àóûh\"\Ş\ÊH}¾\Ú\\\Î9}t³§\×\'\ï¡\r\Ğ7ûi‚\ä\íú8H,7?ŸÆ¹Aw‡\Õ\çN“\Î(\á °¾÷Îš÷n?œO—ÂŸ	’\×H5\0ò®9\ëO†+\'¸‹\åP\å=Â˜_§\ÛK½UJb>º…‰õû«¦ñ\èv\éM[“\Ï\ßûê¨‘4\ÅDQN\Ô\æ_}-÷>Ú­@‡»\Ú\éõÒ¦*$\Ì9G´S\Í\Æ\ëö\n„\Ü7§–<´:¡‰—ñ­9~4Õ¹ÔŠ¿Ÿ¨Q@sO)§«ş\0ı\ÕÅ“ûëŒº\Å*(jac\Ó\ãM`yu\Ñ@:Nk¯U1|ÿ\0h¾š`\ZN.y\×\r\ß:Ú¢‘>^T\0÷¹¯:xb9G™š‰g\Û÷\×K\Ç\í¢„Iß¶\ÚTWAŸ*oB˜o*(t‚\ÉıõÁ;Àü}•=i²\ÔR\r	Ø‚º›`¦f\ÓCQ³~6„\åA\ßö\nB\Ø\Z=¿uB·Wo\Û]\é@´\'\'Ÿ\ã\ã\\ß¥q\Ì\Ìüi¥Ï«\ã@\ì?7Zc]Tbk¹½T†6 RùHŠ‡\à~4¨X\ÇZº7©­sÊ‚\ÍH\\\èh…M&h\Ô\ÄÎ£fPht‘\Ğ\Ôa«ªÂ¸\Ş\Ê	lpqøªM*ad\Şs­\Å*UE“ªp\éHšyWiPI>”…ø\Ô\ëJ• ½øŞ\Ş\Ç\ÛJ•+³]ƒø\åJ•:@iŒ Ò¥@3“³]$s¥J…¤h\'\×Qg=*T<±#ZhSJ•!\Ğ\Ì\ÄS‹yR¥B\Ìõ\Ñ\ä~\ÚT\Åg	®;M*T“,k\ZT¨•ô\ÛJcô&•*0z«ªÔ©P$\"\Õ\ÖqÖ•*\0šv>ú\äq\ì¥J€G=´©R¤#ÿ\Ù','Preview',4),(14,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	\Z\Z\Z\Z\Z( %!2!%)+...383-7(-.+\n\n\n\r-% %--------------------------------------+-----------ÿÀ\0\0·\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0P\0\0\0\0!1AQ\"a2q‘¡#BR±\Ñğ3r‚Á\á$CSb’“¢²³\Òcƒñ4Dst£´\ÂUd„¤\Äÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\01\0\0\0\0\0\0!1‘AQR\Ñ\áaq¡±Áğ\"#B2rÿ\Ú\0\0\0?\0wh¸bÜ·‘\Ì\\D\Ô2A\Ó\na‡9\ĞÆµ\æØsH(¢\ÃAº\ï\Ï\Û\ê­_j^\ë%ƒq\Ê^´\Ä\07++˜‚d¶X\×^€õ¬\Í\ä[Šn¤\æ\å ¢ƒ*cq¤\Z\é\È\Ófq\Æ^f+<1¤\r½â™…}N\àF¤o#nc\Ü*\Ó‚ \ÛbQ¥]VH\äN£\ë\ruU2·x\Ùd\æ\ZIúA‡·ZÉ¢\ĞF\n¬.f\ÓH\ZxAf\çıR@\Ö}š²ö…V2:\r¹\ÏÈƒú\ÔG\0°—\É\È`\Æ\Ğ#S¤\Ìy\ë½hlğ+€\ßS\Z\æ)q³¼e™,¹s6\Ê }i¨Ø™MÁ¸­\ì1l…Ô°÷Ï£3Ë¡\Û\×^±Áq\Öñ·Šx§+~’óV \ï\r^O\Æ\çI\Ğ4„*T\ä` jI\Ò ¶+Ğ»	x>P„\êyr´¤;*\ÓÖˆ’6xkË°¢Nµ]‡Ş\\LWCD˜¾-\Ù\ÜØ¬§3##8,-úy”Œ\éH\nd\êFü\ê›\Ãpö®.wfse¡ÀŒÒ¹K¸\Ò\0“\â:\ÌD\Ä-‚\İ\ë•<‰\ÊDƒ¤ò™û*‡p\Ûw¯o/\æ\Ë0D©ô^C‰\Ön%&f1¥kMi–\Ú2\01%³J€HÉ `I:\ë,+SŠ\áIy‹!„\nP¤rHo0A“\ËW\×jó.\Ğqóul‰S–\Ğ\0\å \n\r\Ï9:s	¸\Ãvş	ÍCK\É\ÊK2™\æv\Í\í5…5z£\Ğ;5\Ã\Î\Ê\Ù-š	\Ö\0Œ\Æ`\Æ\äIñs«e·­	\Ã/ˆ®¬¬T‚$€wº´Uš\Òè’¿j¹n¯1Vªºõª¸±4d{]\Ä\ïYO™I;³h`A˜]\É\Ø\Ï*óG\Ã^,c1uÔ‚	\"Iô¾\ã[\Øv…¬b`(\Ñ#+D\ÃF\ÓX=\Æ9\Î[øF\í\×b-¨\È9|Ló\Ê	\'šr¬24\ÙQT‹¾\Â;Ëª\×Hù\Ûmó~ 49r¾µOÆ•\æ\r´U[ŒA3˜\æ\ä\Æ \Ş9u­o\Å–V\Ö…\Ãdº\ÊH5!.l§À6\ÒNƒ•gñX2p¶\Ë0{ƒubAP>):\ÈPft\Ì|éµ¥³\á¸Ô±ƒ¶÷\î P2\æ\ÙLh#¯¯\ì©ğ<V\Í\ä\ï\Æ\\\Ùdé®‘¿Y\ë¯<\Åp—]\Ò%²ƒ%s?J3D[Aª¬F\â\0°Ó¹\è\Î\Ó\êø\Ívpö`œ\ê&qY\Çñ;\Î^\Í\Ó9@+¦»\ê$X‘\á:‰‘E«rkx\ÊÕ™µC”T\Ën¥·‡¢\ÍÃ¢·]rIq(g!^4\r\ÓFŞŠ «B\"¹\"¤¸‘P0ª$“=*†iQ`y\ç\Ä\Ó\ŞX˜0\0h\Û<N\Ä{LUX¾S6\êP<¤\ï\Ì\Ï*-ñ g¶|J\ç\Ã\â 	#\Ù#Ÿ¼\Ğ`8U¦²{•\Î\Ù$©9X™S˜)\×.™bdœ\Äi¿—NOC¨Ë¹?6dÀô}\æ}¼\ê\ã†Ş´÷n6#U¸d\ì¦@ó1¤L\È U>)PG$÷ j»‘¨jË³¦Â¹8™\0”¨m#HÓœ5Î¥sÀ32\Û-¾\Ç\Ë`g§\ãj¹N6@$e»\r%e’¼\Ô\è°Fºo\ZPŒ]²÷J¤£\ê•PvØ>\Ê\àY¡\0k2fš9\è\r‡LB»\Û#-¢\å²\Êer¹’\Ç*\é\ÈÁ4¡ñœ_„Rö\Ó\å!‚‚3e‰\n\Ã\ÂH\ÍWğn#w\ÑP%€P·2¨\0œ\Ş–u‰óšeûW‘œ3Z!¼+²’r°YlÀA\rrDÎµ¥\éd›\r\Ú\Õuµ\ß\0¥Ã’\ë9!ˆmÊ“:òòÔª\Èj ú\ë\Ïû?Ã­/x\Z\â‹g#f,®|-\â•Ò†vĞš\Şvcn\íŸ†*[7-sÓŸ3\ZVĞ“­Ih\Êv‚\İÛ˜†´¹ÀÌ¤¡iÊ \ârÀ\Í2u‚‰\Ó;Ù®-k\Ş\á±\ä¹*Ì†T\r¼ i<Àb½fş\Ñ\ÏpÄ„*\Í;\0	>@×—c,Y\Å^aj\ÙUuİ|AL\ç\\§\"GXÎ¢|\ìh©\à¸Kw-2]\à°^Ó‰\ZÇ»i1 \ê:f‰:\n;µ,%Òu\Zİ¿¢Œª\Ğ\Ñ*#0\éÏ¤U.\Õ\ä¶/*5À–\0‚y iy\ÓL±W˜Œ!¹‹»qb\ì,Ÿr4öĞ±\Ğ¡\ç¥e\ØYu\Ù\Û\Ç\È\Ö\ã¹U.@‚P \ÌF“\ì\é–Z@#PDƒ\Ô\Z\Äö7º¾LeE¦\n\â$²¾bI`C™^D“Î·x+*Š¨\" §A\Ë\ÕV„Œu“+mK4À\è	>À7«\å´&j‹¶<7¾¶©”7ŒeH\Z‘¯>D4¦¦y\'ilZ\Ä_8ƒ™m¶ŠHÕ™`ÀwY i±‘\×*\ès”™U•\r\è\åwõøÖ·Œ\â\ïZ²0\Â\Ğ\Î\ÊHf!»²\ê#(•ñf&4:MR\âxk\ÛqiFŠ§;\éFmm¶€\é\Ô\ÄøI‘\Ôh³XÃ¡\Ê\Ù\íNPCê¤\ÚhO„1c¸M÷0’ıò90ªåŠ·Š):ü&G?*½\ÆpÄ¶‚\îRÊ¡Â·\àS´\rŒ°	%\á¸m\ï	.¹”›\Â2B A‚\Ã0€\Ñ	&b¨EwÁ¹	™\×\Ãt\\›)02Áò•;ö\Ğ}µ\ÃÄª.¥m®rt‚Fú\rÄ’yj+IÀEõ\Î\îXú\âr˜rP7\Ò!Š¸4\ç\âª[˜{‹‹KX¥\ï™Ø‚\Ä\å™ hD\ÉI‰\"HÜš \à»½„\ï»Ki c\á\n5\ç:“\ç\å\ê|ò^´·Sfù¡\Â\r`\ìöyqmµ™-©D·\0b|`–ú\ÆXGˆ\åW¿“\ÅAr\ê-óp/„`h~Šó\0@š¸6´bi[Xz(Ø]´\ÑS;iT\ÛUˆJ\âU†\"&ƒ¹{•kX\ÛD\Ó *{“Cİš\Ñ\rˆ4Š!õ§Ù±4XwuÚ³\î)R°£\È-ğ\Ädn\î\ãrğ•\Ó\Å¨>	\0O0|¨l-\×SF%r4 1¯O¿]\Ç\àV\n\\\\Š\ä,ƒ\â³0Ä¨€Å†\ßTrš\Ìq‹6wn[,5˜`±ô‡6ÊG(=8\\iY²e_p\Ì3[R\Ñ{,\'\ÓÍ”5\Ö6ò£.m»¶\ĞFB³”\ê\0aeµ\Ö45¦`\Í\Î\î\àQ1HĞŒ¾,Ã€mZ>‹ˆ½r\éRn*Ú“\èÆ¢> ×¬O:•©E\r‹ˆ¹†B\Ä9\Ê`Œ\Â#QË¬y\ë]\Ï\Æ]\Ç!\0Á ùˆó÷w¸%] \ê\0ƒ\Ôi\"6\"‘:\í\Êyş\'\áR\Æcs(^DA\0H:A\ë\ï\Ój\ÒÚ‹–DM«¤¢5¼\Ú9\Ì\\	¤«\0H:‰FJ\Öt3\ë\×\Õ\ĞmV\Ø,nR%Añ¡IÓ»}h$z;ô§‰f\Ø`\à¨[wgmF¤4™W[~¤1<8²\à<¹°\ê+4˜\ßORHú-©\'\Ñ}+¼÷ª.\åP\Ò},¾µ\ZD‚gMÉ«\Ë=\rtUyÕ¡tAVy+*P\0Cx[+«ÈŸHLLf\ÛZ¥\í¬bƒ#\0\à6tÍ“77‚&ga$Ï˜µ\ã}\î\î%\Ë]\àZ\Ù(e‰¸døt\äõ$\Ç:Íœ%Ã‰$-\Ç[%•\Ğ\×6¤c£€‹	Œ\Æ|“\Ôh§\ì÷¼˜B™T©\ÂIB21P¦\n±Ñ´Q ‘\ä6¯IÁvz\İ\äÎ® 6i®­\âRºH$zC);\í\0føF¶÷Y~Ky@RenO\é\Ñ7‰¢ÿ\0\'}¤¹y®Ø¹m\Û$Œ ‰!¡¤dê³¯:Î‡f\ïø:Ú…X§R\'¡:Ó­aüG¥wÀ\ïE\nNÖÌ©\ãœLXB\ÒQ ´A\Ôl:‰<…b;A‹[ê˜§¸B;[p#\Â4ñxZ8\Ş@±V½¯ÄŒM«È·rœ:\æ¸9§@9˜:F£\Ö1ı\Ò\â>H—/[d¬²@F\Î\ä€¦‰\Ğõg8Ÿ½jı¥°v<d/\ÎeAo¥:±#Ÿ‘œ\×²\Ö\îŒ5Ëª¶ÀbI;+\Ëe	#™=kqÄ»P0\ê\ê,3wBĞ´ÄŒ¤f¶Ù¶d?­@+\r\Ä\í÷ZûƒmZr—$Á1”k\â\"mC\Ñ{7z\Ş\Z\Ñ\ÎZ\Şe&\ÜÈ‹¯\ÌY&¾u\Ë\\>û\ÜU=\âgu%­s$NÁF@¡@\n4Š\Ñp«‰w†5ŒòV\åµb!IÂ—\ßQuõ\êySbq\ØÅ¹-\Â)0ñ•Œ\0ruV\0\'R3n&€4=°\Ã]¶\Øu°¹+d0€‹2\0P|C\Åm\Äi\Ü\ÛÖ²\\/i­*\ä¹\n{\Æu\r D õy	ø\ÜJµÁv\ä…‚K¼\ïœ\0uvÓ¥bûWÚ–\\\Ö-!K—\Z.3\r[4lA1§N¢j\îµ&%¾-†ewÂ—,@bÄª\É\0‰\0\èF´»-\Ãm‡\ï­=Án!T³e#Q:{bv¯9\ÇcÈ´\ã+\ß\ÌQ•ø‘ #\Â”\Ôt\î+w\Øn\ĞÙ¼½\Òg\Îv\Ìz”r \Ğ}®2·LM\ÅZ\åË‘B÷\æ\Ï\"´¡\ßi4&MhÂ¢¢e­&†3\nf‰¹h\×\nM\É\0%ªmEY\ÚÀ”U®\Z9š\Í\åCQ*Eª\í^|‰:Ò¨\âtù\Ó‰`¡C³•fP\æc)#6\ÜışSV\\‰™l2†eDfúY@˜ƒ\Ã\ÊZ[¶®‚l\æIğ‚¨t‚L‘ñ«\É5«j\İã”º*±3h¡0@5\Z\Ì*\Ås4~Îªb1s‘–\Ò2 \ÌÀ \ÌF²<€5À£3[U\rÈ‘\â\ÒóÖ¶\Öx‚_\Ä\Üv\Øù:\Û\Ü\ÍŒN`Ú—\Zs\Ö\'¥SvK\î|[û»yõö\Å¦\Õ\rp\ì\"|šò³î®‘¿WEŒ¬?JuA\çP¢\ÛK$\0³œ²™2¥`°w\×q˜é¨«Af³{\"™8\Û\Ì\nŒ\Ñ\àˆ130r\Z‘­÷\Ö\0¥\Õ\Ò\ÕÀ\áC\í•Z	\×(mg\Èù— Ÿ35ˆÁ\\’•ic”@ƒº¤·¸!˜2#€Å²‚½ƒ\ë:6\Íi\ßP:>pm[V•|\ÙI10d(Ì»Lhvª\Ü8‘iT–T|\Şf¨\Ë‡‘ŸK™»#k\ÃûSfÁL9$\ä\03ªQú \É`t\Ó]6–±$€fz¢°÷û8\âÅ¢b\Û\Ùf\Ê3f,’ş\'\\\ÄtõyÖ‹\rz\âZ®‚;Ë„#‘±Ô“¦³]\ÕÌŠ\î/\íbHŞ¹\Ã\Õü$¬Ab§)f«†$‰‚+<8\Ã\Ò?\á\'ûjT\â\Í\Êûv¿uböŒ=\ë\èh±d\îg8W¶xkI+nò‰!²…75\ÓH>ò9\Ñİ›\à….%ÜfÊ†c9™²\êt<ü& ‰UaÛ²l­\æ\ÈsÌ¢“ó…‹kXÑ¶øµ\Õ\0\Í\0ùµ\å\ì¬ı§‰uEğrx_Cj–b‰QXq\Çom\ßë¶¿p®9{ú_ı1PöŒOı®¨kO\èV~SÕ°Ì¸‹LC\İ9,ˆ\é	ƒ A¬6%­\ÛR¸ö\Ñn\Í\àá”—\Ò±X“¦U“+y\Äİ±\0‹·IGv›Õ¾óTøN\ÌX·0\ÌAR°Ê§~{zS¨<¹E/h\Å\ã]Pprx_C#…\ã^ \Û]1‘š\Èps\0 \èdk\ÈuZ\Óv§\Éeˆ\Ã4—\Ê\Ëy[Ì’±\Üi¡Öœı‘°X?{{2±a@’dˆ\Ëı]ª\Ë\ä^õ²³+\İ\ÛJ2rQ¤1\Ó\ÕMg\Ç\â]Pp\ç\á}\âıÙ‰\r\Å\Ír<Zj&A\ZZ7\ÒN\Úz\Ïg0¸{ Ü·tu,	@œd-\ĞY‡\ìå“»ÍŸ1@I1De n4\ßZ·¹zm÷}\à™[eKrñe 4Ú…›‰uB\áÏ¹ô\í¶/“†‹™,ª \å\0\Şe2%á‘»oµWùE«\î–l¦#:\åKŠLf\\\Ã\Ä\Â$\é\ÌRMKH·\ß\ß÷-‹g\æ\à@\0Dmñ=i\Øn\í\ã£*³’Iî‰‚\Ä@$CMG•l~%\Õ\n~\Ğ	Á¯^$\\!†vd‘h»\0\0Î‡I‚J€£&\Ïğ;¸\\y¥H‚X‘˜·% \Ô\Zz$N“Z\\e\ÕJ­Á¨‚\İ\Ñ\Ì}³¾´|\Â\èº.ÀP-,(\×E\Ó\Ã Ç¨B\Ú1x—TO\è_ñ`´@ ’yIüMnH¨Ÿ}e8…\æºÙšó\0xm¨˜˜\å\æh‹<M‘B÷\í\0@ùµÿ\0ml¶œoı.¨N\ç\Ğ\Óä©­a&²Ÿ\Ã\Ì?Ÿo\î“ıµ\"v±‡ó\çû•û©¼\Éòb\áµ\Í\Zõ\áµ\"\àÀ\åXó\Û\'ş›ÿ\0DTo\Û\Z\Ş?\İº£y¾\Ñ×¸\İw#•;\ä\ç¥VöRû\Ş\ã¹e eUw\ÖL	˜}h.¼mJ\ÄWü‡\ÕJ‹\Ô{©S¶\ÌWxŠ]\È\\-»£Sq¡\Z€	3\ê\ç©5Z™™\Ì\ÜMN¹\Ä¦§HŠ\ã[$Gœ¸$~6¢-`\ÉP`\ÄÀb r\Ó6\Ã\ßÎ³rlt\ÃøÑ›—.*\\\ÎX\n¬¢`ú\" … \Ç!4wcñ%n\à€û’\ÖÊ|½|\ê†íŒ¶\î(Ğ’¬\0=>{\Ñ61eÁS\âW-´\ë#q\Ì@\Z¤õ\ê“ü8½ƒSœ÷^\æ\êAô \êt2z”_ñf\Ş\İ\Ë\ËiK\í\Û%–\ĞFU9tô¼\ë;ù7\Ç]\î2+0U3¢“$\ÄÁ\ĞL\r\Ë[\í[(¢òF#.I˜0I0F¦#°¶¦jª‘™\âX·8›\Öğ–ó¡\nW.di¸ 1Ñ†¼öµ?„ö\r‰e]T€º\Ë:f\ØÎœ¦F†¯¾^ˆ2\Ù@Xpû\è[—™Œ±$ş=\Õ\r–¢\Ùb\Ø\ÔM-‰ ™¤\è6\Z\êEˆ\Ä3j\Æ…F)¬	\ØVSR‘¼b‹`5ª\Ü7k0¡ˆg\Ô0¬c—!W_#“­yŸÀg¿|t¹¯\Ïr~\Ê\Â[%­M\Ğ\Ó\Ğô»}¨À\Ç\çO÷W\ÙI»W\åq‰òµ{\ì\É[,Ã”_K\Ñ\Zf=(|O\0³ò›\"\Z;«\ßHık\æğ!\ï\ë\èuñ_\êõ2ÆŒ\×m›\ß\ì£µ¸KÎ–íƒš\".I &WM­oñv\Ç5?\Ú&¨\Ç	·gd¢\Æ{š\ë¸6n\Ï\ÅjV\Ï§\ç\ĞW\Ï÷\îS\Ù\íV€E\ÂA\én\éû;Y„\Ö\Zá–/>I\æ*÷²\Ü\Óa,1S&Ú“©\éSa8%‚ø‰\r¥\ÕúGú?}G³\Â\Ú×¯¡\\Wú½L\Ş\Û\à•²—i& ÚºúŠÖ‡	ŒBA\î\î,÷V+·\Ü&\Úcl„”\êIú|æ½§‡a@\n\ë{*ŠU\Ús<\Îİ˜.\Òq›V\Ïx\Ö\İT\0û\ÇHò¬®#µ\Öy-\Ïm·û«\Ôûeƒ\riv\Ò\ê¶±\ÜK\0\Æ\Õ\ÂJ\ÆV\ß\Ôv¬RJn/°\Ò2¸¦Œˆ\íu“\Éÿ\0°ÿ\0uXa{M…\Ó1}Fh®6’G\ÑS\Z©÷Tø\Ì+¨9tû¨\Âp»l\í™gù5ƒ¹\Z›˜™Ú‰B-÷¥$Ğ“´¸1¬\İ\Óÿ\0·¿şÊ“\Û\Ôm\Íó·\êV«‰p‹\"\Å\ÈS¢9\Ü\èrF¾C\İO·Á,•RWúM\Ó\×\\û°]ıW‘{ò¿OS\Ïq]¯Á\ÈUg\Ì\Ä\0\r»‹¹¤£r÷Ÿ¢}\Õ\å\'†[·‹Á\äX–©?\Î[\ëW—8p\é^¾É³BXÔ—oyÅŸ<”œYB\Ø\Ñ\Ğûª6Å‡\İWOÃ‡J\Z÷+»€\Ñ\ËÄ²’\ï\Ö\03Gpœ\\q›¨Ò£³€›†=U¬\àx0hNQ0ù\Ä\r§sS\ë¨\Û\Ğ\İpğ,Û´¤\0\îLD‚@ó:Q\Ü\ãJn›+€˜‰U\Z\ÌÁTúW–v·Wn¶P\Èí’<:À€ºss3­f¯ñf—r\Ìw\Ôõ\×m²ª\Ìl÷{£\Â)ƒˆ·#¡${ÀƒJ¼,ñ.Š±\æ*v…f³Ø‘s/ò„9t\"\Äf\Í\Z:\Û\ßA\ÙüŸ\ß@B_V™11m\0š™˜ó¢†=¹\ÙoaSö‘N\\ü+£ØŸ±\ëƒ\Ú\å\Û¯¡\İ\ìË²_@;}ƒ¼Ì©pŒ\"(eøÕŸ\ì>\Â\Äs$ \ä_\Õ_N³ê¦¯wWõ_ÿ\0Œ\Ñx~\Óİ‰ı+w\Ç(«\Ùõ‰–\Í.Æˆ±£\Ó&\ŞE\Zg*öPm\ë>ê­»‰vÔ¹&D—i´F“W\Í\Æ07:¨§\ë÷ˆj\êğ|=\àN”‡q{fº¡–ÿ\0–b\à\á\Í©sú\Ê}±÷\Ñv\ÃÁ!&øLı±G/º˜?ª3h\Ş\àjEE\Õr¤\Æ\Äe?\Ù\"El¢™;\äv°ÿ\0Y[\à~\ÂMÀó}¢§[G\êÿ\0e\Ï\î§:˜:8\ĞıSö“Wº—\"w¬\r\nıe÷Šó.Ì€17Á\"\Z\àßŸ\Î?\ï¯R°<+«\ì9ªò\Şr1WÌŸ\Îrü\ã\Ğù G·*Ö™Xwy!¼CHqûGC5\ËØ´ùUŸjô\ê4–±Fğ\ç=\Òjş‰\Ü\Èm¦•\íE\â˜\Ü9\ã\æ¯t\Ñtªğ\ÉK¶\ÏI\ÏM{\r¯\Ê\Ó\ë/¼Uº‡‚ue#¾ AÓ¹¼Aøšª\áf\Ø1x\Ş¸e*F¤ï¦”C\ã­5\Üt÷\Ï\ì\Är±`J¸\ì\ÒR¾\ÂH\Õ½—¼£†–QóI¹}µ?\Ä\'yˆ–\Z\İ^cú47f.‘\àˆ€\ì’\"GP*¶\Î4+\âK]¸\0¸±\á\'{ºiRöw):‘%©GùJ\ÊqXF\ÓH\ä\ë÷×©XÄ¤zK\ï\ã¯\Ç—p’N\Ñ?¥kjõ\ëwOW÷/\İ].\rF)ö6›tÚ¬Zw+¿Q¡bk\Äøˆ\Ê\Ên¬e:9]i{Qp÷I«~yw\Õü«\Æ-œ\ÇG ó¯7:\İ\È\ßÀ\ìÀ®)·$H eó\Ü¥Xv7–\îe…±¹\Zü\æ&g¾©\íaµm[q\Éz\n#€§\Ï\rÿ\0ì¶¹\é1T*Ü•÷~Q¦\í\É/\á›N+\Ål÷7@¸§\æß˜ú¦’q»!w‰!D\ê4\ĞU?°;›— Ü‡\Õ>T¶2ŸK\èòQ|«8p\äøJ\Ê_\Ê7½\Æa¿ªÀ¤jöÎ‘\ì­r²\é/¼V3¶«ü»¿\çñõ¬ô­Å‹G\"\êşˆ\ä½•{û\"Q\Å»>¹$t úC\ßÖƒÄ•\0\ê(ür˜\Z¿¦œ—ë¯•Gz\Ù:Kû—î®¹J‘‚Z•\Ø*7\"wü{Ç¾†\íG\Z|5»}\Ë\0÷’`ˆ\æÔ‘\î5ku¸[\Ğ~Kõ­yWŸv\çŸ\È=J-f­ş\"G\ê\×/a¤ûŠ“~v¦³P\×Iûisö\Ò2 \åx\Z¢Ÿ2Oû©PI|Fÿ\0m*,Tz\å®\ÙğÑº\ë´`§/jøY™p:|\Û\ï\î©\ŞÂ±\0€A KŸ\ëV~\çc±7.À´\î!FRB’Ö±;šñq\äRuªùúÌ¢Ò¾/R\ävƒ…Ÿ\çP{]~\Úzñ~gùE°y|\èøÉ¬÷\ì5Õ»’\Í\Ò\Ğ<]\âØ\ÌDZ\×cU8ş\Èb-@‹dİ¹İ‰K\'\\ü”}J\èŠOı¾¦M¿\ĞÜ‹\Ü9ö\Ä\Ûşõ)Ãƒ\àœ\È\Ä,ı™~°\Õ}•…~\Å\ã\ÖlÔ·ûS“²\ØÁÿ\0tÃŸ\Õû¯Š‰¨?õõE\'%\Øz.	q?5‹$rÄ†ÿ\0Mwv\"\în¯[diGp&¼\ïøğÑ°˜Sÿ\0 \Õş3±ö\n+*J+x^\àŒ\Âtù\Ê\Í\í\Â\Ò\Şzü\Zû‹‡Ÿuø/¬\İ\Â9Ê­\İ7\Õa”Ô¸\Ê1ğL‚¬\Ò\'\ØH?\nò\'\Ù}\Î]`€Y\ÌIcZ‹wcKx§ªòÀûwø×£‹lmkû÷9§³S\Ğõk8\'\0€\Î7/eb0]\Å%Û—3\Ù!\Û0úx‹jrùĞ¼µ¸¼EË¶•e­,{Ò …9L§_)¢x7k\ï\â-÷Š\Å`¼\ì\é\ç[{Uº§§ÀË„\×i\é˜{ì¨£)¤ipÁ\'j¡\ã*\åüE«…W\"#£\í$¸Q#B4\ËTvø\î#˜oíŸº¥\á¼cz\Ú]L#•u§¿A ‰\ZEs\ïc‹\Ş\İ}}M›\Ò\Ña„\àwWG[L\"\çAF\Ú\îb7¦\àøô»‡bP¥›™\È\à™·u\0\È\Zºë¡­	‹\ã\ÛY{\Ì®f€~Pœ”´m\ÑM\rs´xŸ\è£ÿ\0Ê·÷Sö˜w}W˜,S}¿G\äi86ı›XtmM”Eğ¹‰P@#I\×\áQ[\á=\Ö(v\"\ã\é\àE ûW\ãX»ı¶¼\09H’Àü\é\"UŠ\èUH;T#·8À<¿œnsÿ\0Ê”3B\r\ÉEõõ	\ÂST\Ú\èhø\ïdnŞ»i\í÷h–\Ì\å,ÄT˜\ÓMnÍ¿ö\Ï\ß^]‡\íf(Á\î\Ë\È\ï˜zn¨>‡Vgˆ\ãÀ\å£}.“ö­)m°oTşa\ìs]\Æ\Õ\ï[\n‹?Š\ãF™ºk\ÌU\rş	‰y“h#ÓºefÛ´ø³ô.tô\Ï/ew\Ú\\S0X`\Å\ÊC^\È.c,\Â+9OGn/ªó4K,4Mt/ÿ\0€1B`\Ú\×ú÷>\ï*›‡p\Ö\ß<§\æR\ÜmÕ¯4\í·\Î/¸\Õz\ãq\Ùg»‘\×\å‰6cH·¤¶ø\Ëc\Ñ$l}U\Û>\ëU§.kÌ¿ï»¿£ò5øŒuu ø”w |µ©r‹+\ÊIbvP9ƒ\Ó\ì¬rvƒ¬\ÏxY®%^#>\Éä¦™‰\ã8¥\İ\\\Ì?uğl\íi\×Ô™\åÌ²ú¥\ì\í\ÜEûS»Al\ËL·‰\áw…Š¾KL»\0?8ü‡ª¼ß‰ö§h!bğ\Î\Óm&u\ÛÊŸübºL\×\Äy0\r\é™;N\İ:\×~)(EF)œ²¹6\Û7˜œ#°\ØŸ\Î?\Ñ`~¯•s¸aôG÷¯÷W—\ã;iŠS\nn¤\Ü#ŸHö\ïÎ‚\Æv\Ã\çu\ãi\'}zu­KÑ¢5\\™\ê˜\æ\È{æ€¶\Ñ\ÉÙ§\Ña¸\êµ\ã7Nvf¸\Ò\ÌImÄ’I\'\ßSb{CŠº¥ût`b:ò]ŸN^³÷T9.Á6\ß0²šDş:\n\í\Ív#_UKfğ:4;û\êP&uŸ\\†¾º$ür¥B\äi­*c=\áw¤9ƒ\ÌU\Î\nõµ[EI„À2Lz«5ma´H\Û\Ö(®\Õp\Ìø[7²·IO\"c¦Ó¾Â¼GS\Ù\É*…\íû«s\î„2²ˆ#c\ãöUOiG\Î`ócıEw²œ2\ê»5\Öq\áRˆ$\Îa\ã\'s <¨\Õ\Ûù\Ìşp¡ˆ«Š{\×ñ3¿\â—À±\î\Å,•#@ÜŠz	\Øûª7\r7 \í§\\MòQr\çr:	\ÇI­õû\Ç%°óIşQX\Î\Òò»\è¤\Î$…\ZNX,O-NÕ¬{£*\rI\î\Ğ|VÒœ”o÷‘>lo0: \Û\Ö*‹g×¿O?]i\î?‡@}WNf©1\í<\Ì\ÏQ÷V˜yP\æg¿\'Iü³\æ—\Õ_\ä\Ë8OùşT¨\'?ö\Üg\è^ÿ\0TU¯\äº\Üa\éq¿\Ën½=tşòpdÿ\0…ó4¶°c¥Zö\Ù8I±oü‚»b\Íù:\0p\ì$s\Ã\Úÿ\0 £kŠtƒj\Ø?m0M—¤ü\ëhüÕ•\Æ\á\ÔZ¸\Ì\"\çI\Øtkq\Û;0ü¾xÿ\0£z²U••Á’\n°#¨#m\ë\çvÛ\ÓÇ–Ÿs\Ô\Ùu\Â\ï\Şb.\ÙSa.†\å\Ã”»\Z\æ*\Ş¤›zŸÎ®oY\È\ÓNö\ìyx2Å¸Fô“\ì:õòK¸\ä„C0˜0-k?œ\Ãÿ\0\îl\Ö\ë†N\ìDL^ªÂ­\è¶tşs\rÿ\0¹³[«—f\Øıû+Î•«¿\Ù®\Ã-c…Û‰gƒ™´‰úMT8œ0[\ë\Ì|¢\çú-ZK“×™ûMQ\ãS\ç-óşPÿ\0\è½k‰\Ş9ÿ\0\å•%ü\ãñF†\âL(\ÛIš\Íü„4\ÏpOü\×y„¿\Z~7¡p+;};¿\ë=x‘œ£ù=¿—ï¸§\à\Ø`x†\Î\åÁÿ\0\ë\Ş5¸\âü:9VW…¡\\~§}pnùa÷W¡ñE}?ÿ\09\Ş4ÿ\0y>Ú¿±AùD\ÃfÖŸÏ¯ùnVX\à€ôI_\Ñ$}•¸ü§\Ùù‹`s¾º~¥\ÊÅ­‘¯(\ç¨#¤Áƒ^¤\è\à¡Œ¯ np\ßh¦.\à®Dq¹Ğ©²¦“]D‘\Ğ\ê~Š\áøÀI‰~j(«*\nŒ$!]H\Ñ\É\ÚG\Ò5\Ô ë§——²‹K\àhNä‘¸‰\'\ãJ\à\03\Ï-ÿ\0w¬Ô´&¬\Z\Òó-\ÏA9uMv\Û€ yƒût\åQ[ñ\Ì6òÒ¬l\ØF\0Àıÿ\0o¾˜”P\'È‡W÷\nTp\Ãy‘êŸ¾•Utô=Á™|_HO¿\Üb\Ñaj\åÀ\à2–L±–\"1ğ™\ÖdÀ\ÔU?\á·.!TbN^\ïW\"|$±ˆ:Wcq7–ñ¶|¬P\àŸ\Î~u\ã\Ç\Èÿ\0‹£¿.WMh{Ÿ\n\íZİº\äÙ¹l\Ä$ˆ\ÌA!dÁÛÛœpa„\È\Ìb¤¬±ó‹ {nşß‚Õ·/\Ís\Ë&4ğ-¢šnvŞ¬8\ê_\Åa\Æ\Z\ßwp\\n\\s9]9 \ä\æ£\Ç\"¶¨©\ë\nKS\âX’\àµ\Öb$Ê§Oš\ÑvVûËŠe9E¶K¥H\n¹s0&\Ü\ru\Ü\Ï\ÊYü_!ƒ6\'\r§&´\Ì=\İ\àŸm^\áñ©\Åa\à¬KAyw„s®½§$g\Ük\èüŒ6h\Ï·¦û(‡\á\ì\\õ›\Ü2\\7/0uu*¤+ H#siUw±0\Åÿ\0(¢qcT¯\Ê\0rZµ0t0M¶#\ßQ6?\0\nsF’\Ê\'OX\ËÃ›\æ¾ÿ\0“£‰\Éı†_„Áú#Q®\ä}\ÕUu„Ì“¬\íFb8šŸ¥§èº«ob”ı3ı–ı‚·„\Z\ç]Q”³C¼«\àX\å\Â]\Ä\\Ì¥œ\\X\×L\×k\è\Ûz\Ù~Ownğ\ëú©X.#À­\\e`\Ùu%‡vNi \êI~ú\Ğ\á1\İÔ‹}\à–!IPIÜu:\n\é\Ä\ã\ï9&ß½yœŞ‡¨\Ú]\rcû)·ò,:œe\äaj\Ø*\0!HQ ›gA\ëöĞ˜>\Ğ8\İn·—xG\í®\Û\Å\á„Gµş\á¬ó\íÕ¸\ë\æ¼ËŒqµüµ\ê[\â.{*¸—½.\àx ›¢tˆû\ÏJ±ş¼Hœ \Îğ=Zg~]†ÿ\0\é\ÖÀøÀ®?±°ÀX\×\É?\Û\\9\àó\ÉJRZ{\ã\æo‡&<)¨vüFq;9P¨\Ö/\Ş\ê6vh;\n6ŸIzOE0ª®QD\è¤(®csP.uù³ıº\Ù\ëÚº¯1¬°K™,ü\Ùÿ\0\Ä\Ãù\r16O:½ş0\Ù\Õ3	P£q®Àóë§²©ßŠ+{®ªA\Zu\ë–\Ä`¿•ü§)ô‹#MDo›®¾Ê‡d\ç$¾i÷i\ÌĞ£ÿ\0&\ê\æ5~´kÒ¨ûG\Ãb\à\×ù^mÀ\Ğ[bwÊ¼QH\Ö\ÓÏ“Ÿ²M+œB\Ó\0­†\ï‡—†ˆdLi\í­0\âP¾Zû×˜d\Ï-Ü¸\á·>Q”[[ˆ¤’\\5–0š\Ä%\ÂA&9V{	ŒÅª²¡¸\"\í\Ñ\\ˆ\ïoP|õ¢ÓˆaWş\ålü1û¤³\Åğñÿ\0b¶@£\ì\Ë\í¬\ÖÊ£u]W™~\×|\ß\ïAœˆ|v¾&Ç‰5\î/ıeé˜ƒ¥y\Úq¬:°e\Â*º™WU ©‚²4${jk¨\Íı(ıgû«·gş¸\î\×\Õyœùg»¿¹\ß\Ê*\æ\Ù;\Ê\Ş\åz\Ã|½]†[k\â\"!I$ŸV\ßmi8–-o©W,Ë¼1fƒH¦³œ†&\éº.\æ9J‰B\"c]ü£\Û[dß–±uóG=¥\ÚÀ\ÆFrZ=Ù¨[œ=[\è¯\ã\×V¯\ÅÁ0A>q\ã½s/…sG6e¤\Ğ6Š›\Ü¤o:O-y\ZøI‚ƒ§Y\Û\×zy\Õ\Ã^ò÷P=\æ“ A\ë­o·\ÌVŠœ6\âsŸX+û¾4Š]·½¶\Zo?U^=\Å?\\zšGº–\ÑC†ñƒ¶if@\0tŞ´RLFw\åm\Ôÿ\0‹\ï¥Z!ƒ¶u´óbò2´©\Ú¥óbÜn{´¡~L™³@$™-•dŸ\Ò\"j\à\rÂ™\ßÿ\0Zà¬.š•ógXÏ®‘q¶¦€\ï<¿e,\Ó\Èûf§r~\'Õ‹x;¼Â‘½¾5^nQ]\íö\Ò\à÷†ğa¿\çQ›ªŒ\Êie<\éğP¬˜z\ë¾\Ñğ¨ŸU:\ÚzÏ´\Ó\á 	9Ó»\Í4h¡rùG·ï§„\Ú\\0²u»\çö\Ó\×\Êm\Ç]©4¸HvŞ‘\Ï\á\\2\'­\çKñÊ[¾ut¿õ½\Ô6\Ã÷\ÓC\ïG	†w£©÷\ZL\àóûh\"\Ş\ÊH}¾\Ú\\\Î9}t³§\×\'\ï¡\r\Ğ7ûi‚\ä\íú8H,7?ŸÆ¹Aw‡\Õ\çN“\Î(\á °¾÷Îš÷n?œO—ÂŸ	’\×H5\0ò®9\ëO†+\'¸‹\åP\å=Â˜_§\ÛK½UJb>º…‰õû«¦ñ\èv\éM[“\Ï\ßûê¨‘4\ÅDQN\Ô\æ_}-÷>Ú­@‡»\Ú\éõÒ¦*$\Ì9G´S\Í\Æ\ëö\n„\Ü7§–<´:¡‰—ñ­9~4Õ¹ÔŠ¿Ÿ¨Q@sO)§«ş\0ı\ÕÅ“ûëŒº\Å*(jac\Ó\ãM`yu\Ñ@:Nk¯U1|ÿ\0h¾š`\ZN.y\×\r\ß:Ú¢‘>^T\0÷¹¯:xb9G™š‰g\Û÷\×K\Ç\í¢„Iß¶\ÚTWAŸ*oB˜o*(t‚\ÉıõÁ;Àü}•=i²\ÔR\r	Ø‚º›`¦f\ÓCQ³~6„\åA\ßö\nB\Ø\Z=¿uB·Wo\Û]\é@´\'\'Ÿ\ã\ã\\ß¥q\Ì\Ìüi¥Ï«\ã@\ì?7Zc]Tbk¹½T†6 RùHŠ‡\à~4¨X\ÇZº7©­sÊ‚\ÍH\\\èh…M&h\Ô\ÄÎ£fPht‘\Ğ\Ôa«ªÂ¸\Ş\Ê	lpqøªM*ad\Şs­\Å*UE“ªp\éHšyWiPI>”…ø\Ô\ëJ• ½øŞ\Ş\Ç\ÛJ•+³]ƒø\åJ•:@iŒ Ò¥@3“³]$s¥J…¤h\'\×Qg=*T<±#ZhSJ•!\Ğ\Ì\ÄS‹yR¥B\Ìõ\Ñ\ä~\ÚT\Åg	®;M*T“,k\ZT¨•ô\ÛJcô&•*0z«ªÔ©P$\"\Õ\ÖqÖ•*\0šv>ú\äq\ì¥J€G=´©R¤#ÿ\Ù','Imagen 2',4),(15,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	 (!\Z%!1!%)+... 383-7(-.+\n\n\n\r\Z-% %--------/--------/---//----------/----------------ÿÀ\0\0·\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0D\0	\0\0\0!1AQa\"q‘¡2±ğBRÁ\Ñ#br‚\áS’¢ñ$3Cc²\ÂÒ£Tÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\00\0\0\0\0\0\0\0!1AQa\"‘¡±2q\áB\ÑRÁğÿ\Ú\0\0\0?\0¬\×Al•°Šúú>5\ÌMtF­„Q¡\\À„\×A4`Š\ØE\Z\ÌMt”\ÑrWA¨W2k¼¡°“x4÷µ4½\æı˜Œ\ÉpÁ±]	®‚j/§\Æ\İ\ÑU\ÖåŠ­E³go¨˜G\ïN½*º\à’ôJˆ>U\åLRšT¢\Ş0}\êÕ±7¡ò°—)6\Z\'™®«¤|Á*=>‹¯‹ør7Bø©\åK©&k–6ª@9”\'\ëJ\á[ÀÀ±\×\ëyJ\ìe\Î\Ø\ã,š}´EC\álqJ¿¼r; \Í\'$»\ÍÆ»–	jµ›UŠ\à\rb«ø¬k‹:Ç…,\Û3W‡L–òg<ú–öŠ&1\ÔAÊ¥h.8Ÿ´ºñı\ØLøóiT³TµU\Ñ&¹0*IVµˆ\Ã\ÓÍ±F\Ğs ¨\áq®¤@Q°iƒ‹p\êª\Z\Z¦[j¡*ô/*<M`jKT±Sr)¤G°¬,T—cZ-R\ë’,±\\)š•ST%µL¤)l\Ò\Ëj¥œn–[UE\"n$RÚ -º“qºÚª©q#Ku”\Ùj²ŸPšO5	®‚(¹k Šú\n>Q\ÈEtE	®²VP Š\ØE&ˆ†\æ°5\0­„Sˆ\Ã\Ó\r\á©\Ò8\å\"=-Q\Û\Â\Ó\é\Ã\Ñ\Ûf¥,‡D:oQazQ\Ğ\ÅH!š2Yd;!Ó¤&\ÛT\Ê£¥š2Z¨\ÊGLqƒmºa\rQZf˜CU	H\èŒ\Ã4vÚ¦\İ,Ôœ\Ë(K3Fm˜¢¡ºa´T¥\"ª\"\édğq…#QM¡Tµ52ª\"!š3H§>\Ï]jnE@¶$q\ZS\\¸úR´ ê¹!õ\ëP{khö8”+Qğª?€R®©$(tq\\4m\á\Å)‡§º\á08e\áiö¤±ƒ\âv¦Wò}\Ñz›“\å\âh¸,IuVøc1\çp2ƒ\Ê×¯8sn‡_*+hBœY\Ó\\«\0^\0\Ê9\ŞGZ›\ÄoÁ\á‡Ÿ2\Å!@\"lA‰\ä<(j@.\Ü{m¡˜\è+–q)^•\æ›	‰Æ¯6eB§:Á’I	ø\nô½—²\Â@¨\ÇÄ­O¥¨¦c¥·K8Š‘Ziu¢¨˜­\Ëj´\Ö1ˆ§\ĞÄ•\"\Ê‘h¦s¡T,A|\Ó\ãYRsYS\×/Rš#\èx.Z\ØM2–(\É\Ã\××¹$|„˜nŒŒ=:†(\Èf¦ò‡O|ˆ£L#M¥ª*Z©¼‡T0$*†h\Éj˜KtD·Rs:#Œ[¢¥ª2[¢¥7\"Ñ€$·EB(©E(©9Q–\è\ÈjŠ„QRš›‘U\ZLS-Š\ZSFBj2-¨H£!±B@¦*2*‚¡¤õ¢%¡\\&Œš‹*\Ğ\İ\n\á4J“*b])L„\æ<´¨¼>ñ4WÙ¸\ÊÎ\È_Â¡c\á­L)@jcÆ 6\Æ\ÑÁ:o8‹q‘ic\æ\'„Ú•„Š\Şd5*,}£d;DÁ”“\ÄL¤sª¿ö¨3¼	• A\nŒªH™ø.\"-#\ÍMò\Ø\ëeaöV¢„‚3§\î\åJ#*u‘¥\ÄF•H\ÚN­\ÉZB ©2o—0\Õ@i*×†—š”\Z\É-ƒ•O4Ó¦\Ãö®¨\È	\ÆX!(\\©F1JÇ¼\ã\ê#4\Ê\0e\î³po\ZL•Rj\Û/\n¥¸¦¤e^T­Z\É+\ÎcS{{}\ê\Ú[W9\ì!¶Shˆ”¥&\äM‰	º\ÛS¢ö°¥o\Òp\ê-2%0‚$TI13h\ã\âiŒôb#¼¨$d…XV:ğ\Ôôº»wğ¥+}ğ¥|V‹˜¸W3\'C­M£z°\ÌÃ²„\é @\àgŒ$ƒ= ƒÒ_vÓ»¬: °@<Ê¤ô¾‘\ËB#N-ª»7{”\á¾Es	:N~Z›p-!CQ3Zˆ )F™Zh*T#\Ú\Z\Ê¸–\ÒHR\ĞTô&²›a7<ı,\ÑR\Í`Å¶\Í\İ\"A\×Mt\åO!\ZŠ÷hË†|ú\Ã\\¡d³DKT\Èn»\rÒ¹”XÅ’\İ-\ÓD¢•Èª€°nˆ–\é\İv–\é\ÇP\r\×aº`7]†\éŠ(€J(©E\"»¤rDM)®\Âk°š›e9Jh\ÈMbSEJjm‘‰M	¬Bh©MJLªGHd\×)M\"¢\ÙT\ÓX¹ƒ\Zğ­Zqa “Â¦P¨\í\r\Ù\Ä\âUûWò§ğ «‰\ã\Î\Ş^¦ 7‡u×†nS‹ˆ ¸”À$H…^\Â\Æòi½\ê\ßÁSxt¦b\æ\ä¦E…¬q\Æ\Ò<k\Ív¾1ÿ\0úø¥YD$\ÎC\0Í­2\Ç*Œ\æ—k\0\ë\Û_\Ûa*`&GÄ;\ä¤• ƒ	Ê‡u‹Ş0e-!\ß4	é·Œ«­…Q6†\×qJ\î­YD÷\ä\ë7ã¥¨\î´KD*V¥«\âX‚,›1eXÿ\0ªIZ¶\Ã\Ã\àqå¢¤9€D›=\â™\á\ÌøF†•\Ä,ƒs\0\ŞónY –Œ¡7\É<Àƒ<hm¬\n¼\ŞN¦•=½MC\Ì\íI‚9If\"Gœx\Ê\ì¼KE@ªS\0Iº¦\"dƒi\ç5µ€“1<.\0\ÓúzW,:t\Ís\Ç[ƒ¯Z\n_\nq5·°*!AÁBÊ®\0µÀ¬Ìˆ“Î½G\0øZ#\Èñ¯¶&\Ò,©%WH3kxI¶œõ\åW,^ö\â\\`%¥‘|\Å ™×¾\'\Ä:¬s\Å4Ÿ,\Ê\rğz\ß\Ş,>~\Õ}\ã¢3,ÿ\0(\Ğu0+Ï¶\Öûb9Zı‚9.¨søG‚oÖ«@o&\ä›,d›/Î„ãš:Oòª\Ç\È\×F¦im¢Nd¶L’J‚³Ä«­ep ¾jkÿ\0\ÉùÖ©G³v\Ëd†\×	Gi˜,”¬I·m:Š¸\ìı\ä\Í\İm’›HLŸ\Ğtª~#uQs³Vb’y	 sóS8}’\ÛGh·]H\05ğ„I%d\Â\0µ¼\éº\\Ê£.9<ü\Øâ•µ\É?\ÛO¥I‡gpr5&eA·MhoJa°’R¢±Ÿ»`”\ÉP\ÍÀ˜ Úª{Kj\ã°À¥\Ö\å“|ŠNp£\n¦5‹1Â¡ş\Ü\\}NÄ¥c6YˆX\'Pxƒ3\Î)³uSQj-ß¸!r\Ñ\ë»#i)\å)=™\0	\Í\Ã\Ã\Çô©t¢¼¯f\âœL9ö\É)’TT/-&ö˜ \Z’Àoc‹Pi·a™J ºI&2¦`i˜\ãV‡]Â’\ä›\é\éZ=(¢Tv\àd­I\í“t Œñ\Ôp1xÖ’Ú»Î„·™²;D)9\ÛV Lyk\åkWL²¤­ˆ¢XB+°Š‰\Ù;y/R“:”UEõ·Iğ\ã\Îq\nI\0\æt¸¿R,ª\\¢%o-F?¼M%\n9T¥…öi³x:\\ğ6ª¦\Ô\Ş|[’Ú™OD•+\ÍD[\È\ZIgŠ\îVœ‹?h4À—\\Jy©ğH¹ò¨ıŸ½xwU—2fX„«¨P$8¯<2IR¤“©Q$¦n|\ëOb`\Ù$õ&\ÕÍ“ªh¿‘·g®¹Œm!G09@&#C¡ğ<ô¢á±‰RPs›ˆH\ã\'\ÆŞ¼x@ÛŠD–\É@ ¡HÍ™$*\æµ\àJ”Ø›\Îs…‹ª	„…Bu\"G\áy\Ş÷ \Íõ¨ƒ\Ûğ\î%bRdp<‡:e)¯?\Ù;ÃŠR†|Cû‰\0\Ç@¬°N–«\n6\Ã\Ã\\‡ùH>\Êü«G©Œø* \ËD\Ô;ñ¶”şJo\"&N\Ç?Ù‘\ì¹ö£­1\ÔY9Kã’ƒŸA~ZRH\Ş¥Iñm0#Ş¹\ÇmFVÚ—Q*F`¡ \ä¨4yvõm<’\ĞKM’¤£-\Üp\È%sÁ$\Åøò€\ry›Ò©+0{§C1\Ó\Ì×ºo\ï²[\nR”§¼¢T{eø…À\à9\r8E³\Úu\â²NFÒœ™P*\0ˆ•ZÀ=	\ÔW$\İ=\Øj\ÊØ‰¸›‚\0\Ê$\É70 Ÿ-fœ\Ú\ÎBø\àò!2D\å\á¯ú\Õ\Ïi-!¦û&»Ä”\'2³@_\ÄróP\Í>1U­¹„s³\Ì\æQ\ÍaÀ\0›€5nñ\ëCT[K\Ü4\ÑƒÅ¡I¬ª3pŸ¶„\ÖmM˜\ØRV‡\'8\n\ÊM\ÌGzÇ–¼)­…²‚\Ùr\à’¨	üP¡o¨¹\çS[/g¬%M\êÙ¼\Z\Èö™1<\r	e;¤f›+8\Ü‹\ï‘AŸa\Æóz\ÖÑ³\\H’Ÿ.4üµ«n”°¥%q—ˆQ2‹¦5\×B/Ê˜V-\"DtôµÀ˜\Ôp¨<Ò–Ñ¯ \Ê=\ÙVÁ¨X5“\çoZ²¢[F£M/§3\0ü‡\Z\ç\ì\êYÎ–\Ó&d\Ç8ZG#­5ˆÀ¸¸Í‘\0i9\Ş\'Ş´asN\\\ri.H¢­bÿ\0\Ãú#0ÿ\0-	NE¬:HÀü)\ç\Z\Ã&C˜„xf\n>Š*­+„LAqr$dJ¢=€®÷•²;/\îÿ\0”şMV\é\ï÷›?ÿ\0*ü\Â?Z\Êrô5“Û¿±H\Å\â·V•$ \ÅÂŒ\Ïv.#\Îõcş\Ëaò\å)‘IºŒñ*Ô(û)XŒY\"\èu\03$ÿ\0\äjg-z˜’Œ—÷<Ü–\ßğ¾\Åe[ ÎˆR\Ğ9%D\Â\â`\Úu¨½³±\ì/`‚\âû\'@Ø¨‘$\0HI\Ò,6«\ØM%¶!!¥4?Æ®\Ïÿ\0z\Ù#ƒ\É2‰¼„ e„‹J¤\çÔ“˜\Ì$ƒh:ß„Àî»‰w´m*\Ì\nAm#¼‹w¤(LB§;g\ËQ[\Äb\Èû\ëB\ã¡m\"cª‚½*3Áö3t\ì©\ìï¶´\âR\Î\r¶\Ó•˜—	I&I$˜6BovJ!\Ö\Ú(ZÁJÑ 9¬±\çm$ô5\ìI,^\ÏC¨ZJGy%3\ÄH F„N´g8Õš/s\Ì÷f=‚\Z1gVH\é»mf™€aGŒÀ°oX|¢—YL$(¶¦À\Ì;ñ úôSel6¾\ÆÁq\Ç3)”eVr2\Ê3±¡¹¾ºt©\İh‡‘|ª)\\\å$÷Uc$<jZi·ûÕºH¬\ãKS‹T©FU*Q\Ñ)½8“U q‡@í•‡œ§(Î¤\Ò;\ÆR}jù½km\å4¦J(v‡,*Ğ e@XAÿ\0\ë5L^\Ğ\ãŠJx \Ä\Ïí”­GC5\Î\ãñsgJ’Q\àMü5·„\ãXAH\É\n™H\\ğ#X¨-»‰u+S•…Bˆ	\âIb§¶\ÚRœPmG2\ÒD ›vq\íQûgw\á\Õ „œÀu%%fgYšI­\Íˆª-\Ö\à¦\åPNetˆ\Ë\áR;=(B‚² @°Œœ~!­ùtL^\Ç@I†\ÜIRœED5ƒS™*Q\0X\ê=\r¾Tu*…ƒº»E°J\Ò\nò™\ïG\á<J’\Ä\ï\ÎEº\ÙhJTB0-”(\é\Æ\Ú\é^y‡aö\ßHÈ¬÷9fBM\â5½Lb\Ú\ÜÌ¤:T2 ”7¯Ş•¢NƒM&uÒ¡HOŸ…ıÍµİ›½m<\èk!¬)\Ë7)\ë\íSÉ‚$G1zò}\äÁa\Ûu®\Ë\Ò8y¸t¹\'2²¡B\ä\0nc\Æÿ\0»KC\ÊÖ€„¥R {±ZH-k©\'[™2d\ÕGn\ï>bZÃx-\Ş£|\Ï\ïp\á:ˆ}\âŞ…bIm©C:\nsø¹\'§<„v Uo‘’&•¸…¦d”<bF‘­t\Ş($% B@ Æª‘ø\ë\ëI2µL +“Gog¼­\Z_˜#\çRü¼›|T\Ç\ÖÎ‚\Ó RIH\áqß¥#¼%L™€k:©i$[M53i©l—59T´ˆ÷¨ı\ç\Ùñ‡\\¸Ú£/q$’@=N|+<\ïWp9lqºm²XJ–¢•¹%!D\ÈQ71y÷µ9‰\Æ%?\Æa”FRSS¬\Å\ÍúŠOvZl°\n– ¬\ë\nJP	«\É$\n”\ì\Ù\à—š=‰¤–8]¶.\â§9ŠP¡$™\Ê|y\Ó\Ù\ÜSa #\\ ùÁ¡¸\Ûd@\Ã\æY>¡)\æ\Ò)Iî‰cNu9¯ø‚«’\'ıŞ¾/9\äBù@ «d6~!˜şñ*ù\Òñ.6•AIRAøQ\Ät\0\ÔV?ˆ	*8…(\0I”4\è<(¬o\Ô6X~\È\Ú~\êG\ÏnĞ±q…yúû\Òn¢<I÷§7v\á\"\ã)‡\ŞE?‘\êÁe\Ä\â\Ùü~\Çô¬¨¶bê¿•e&#n{^\ÈŠÆke^¬!?úT»‰Q	É\êkÈ·£x\Üµ^­\Ëa\ÎğA\î!\ÂA \ÜBO5Zdºú!(™\Ìbm˜‰<lLŸ3]ÏªQ\à\âx\ìö¥ov+/\ÚLÄ‰ 4E+¼{Å„-dûCjQ[JHI\n$¡\Ö\×÷l\r¦õ\å\á‘÷UAƒ*^h\Ó1R (Ã¦´ \Ù\ëJĞ¼\èI˜$%R’%‹Æœ\à\Ú×‡\ç%tê¿¬{°¯ö“†“•\n)\à¥¤:\\óñB\Ù[ò\Êñ8S•\nm”’T2¥I/’f/ ¤yW\â¶yC‰\nU–\â’;\Ò@J\ÂL\ÚÈ‹ñ®\Ö\ê;7aDön6UšM¡h´™T(y\Ù\ç\è2ôz°®ü.§\Åk“\0O3Êµ\ß<?%³¯ÀJôş	:ğL}I’®\Í&\É*LÈ±6\Ô \Şk1;)y+d¬©V$>\"xrRxÈ­ùœœ:ƒÓ°›\îÒ›K+\Ê\ß\Ù\Ò\Ú™_ó”\0¥\Ê[[Dq{\\¡²´–œ\"H\Î3@”“ñ<&©x\Ì\0R’®\Õ)*Ê“c›0JA\Êf$·\èjÁ³ğRŒ6ps)ZA\Òo\éQ–W\'\Éx%¹<1\Ë\ra¼‰\0¬¥s”«î³h¨q¿I\àÊˆ‰=\à>ö^W\çQŒm³a¥dÎ S\İ ©*\Ì&\Ò\"ñq§!-|}=ŞŠh[\äk\Ú\Ï@\Âm¥¹0\Ô@\ê\Z*hošZuM–T‚r©0\r‰‚u§6S©FGÂ‘¨\Ôfªò4N-\ßcV\Ğ	§\Òln\İ2\Òwñ³«N\Çƒÿ\0ª\ÃmvYJRVT&\ã)\å\ÅSUe±\Zª›ôM=´oˆhÉºQÏ®¶¡¥QV©–\Ñ\ŞJ\\\Ô9¤‰/a\Ø\ÊSh€¥I‚nM\Éõ$\ÔN°E‡Â¡\×SÒ¤ğj‹\åµ\ì-$\Ò$Ã±\Û\Øl#Ä«3wR¢¹Ê€T¨Pƒ\0I‰\çJm\Ì:Jr¶%´\æVQ2I\ÖTu¹3x¤¶Û¢\r¿\éb\"9ö*©=“–ÿ\0‡õ§v¢I¿ˆƒ\íšhw’\ÚlOÂ¥$\Ío¼„¥„ei\"o”ı\Ñ­\îBs\"#şZşFª[\Û?‰s\àU\ÂÕ¶À\å»=gc\Ë\í‡qe%YnT$Û‡5\r¡*ı°*C‰e`‡,\â’”\ÏÌ‘k\×65şÏŸÿ\0†d\ÜQ\'\Ã/\ëOmD’q\'*»\Ø\Öé‚”¶\Îek,q\Ü\nOq\í\ÕÂ§\ã\éRƒa¥d’\'1’\ZS›\ç°P\Ş\rje\Ğ5X\êi\Ïr‚¤ÿ\0\Ä\Ê\Ú9’yXoL\ïr’0\ëO\Úp\Í0¥…\'9*\0YCœƒ\Î\ì¡®©´t\ZÁ£\Ù}Ğ•)N¹€“œ‰¸¦~T\êö\Ö\ÉA ¬¨ƒ„“\Ó,\ãUU\à\Üs\ÏdÂœ\0½™c0	%G,‘k®b\á\ÜÃ¾ZÎ¬J\ÑD¬AlI\ÊuøV5±RhRö\Z™\é\ÛW³p‹JHJ•D8©“”\ruš‡\Ş\Òp\ïˆII)şqo\n‹ÿ\0i#ûì©¦´¤¶I\Â$\ëÒ¦ö³d`\×\"h9¦—`4U¶6-¶ÚœN`¦P‘¦º\ÍúJm\ÜR]JÔ‘M¨å”Ÿ-µ]	\Ã2Lü\r\éü*¥›>˜#öOk¯\Æ@>\Õt£¢»œ\ß˜\ßb«³ •x\'\ÜG\İ‚¨&$(L™Eµi½fğµ¨¥	@Ê˜Jf\0‰¹:¾-\Û@²Ô•)(9Õ”\å°(\Ô\Ş\Ä4©\Él\è´Km‚5”f¶\Æ\ì\Ïşb¸\Ş\'Z\Õ.‘¬ˆk´°¥¶r\åu\"0˜ñû\ä[Y(\Ø}™‰p\æ\î\"ò>$q­\ãoº>„Imò5¿\í&\'û\å!\\O<»E|ÿ\0¡~«‹\İ<RZK©—R¥”Bp¬*3Q”œšÂ©í™±±yaXwM\ÒRÓ)P0¤ğ’t¹jUÍ´ú\ßsüjÀ\ĞUt\ê\ê\Ïó¨şu9f›\\#\\N\Ä\ÆËƒQì©™±¼ƒxõ˜-\Ô\Æ(º…É³¢H(\'*§Q®¶¬¬\ê¥ÿ\0‰_­h‰\àuú\ãB3È\Õò\ìÚ£›£…f\ì\Ó:•¼\ßY\n‚c†œ©,^Àq´—SjH“\r8T©\Ö\Ê\ÈG3\ëÆ¥TÀ?wiX xŸ¥:œûµü/\ìW%\èWğ˜\Ì)0\â]\Ê\0‡5=R~ufkz0HK`\ÏbNCe@!W¿\ÓJKı\Ş\Ù\Õ	>Uƒf5ı\Ò\Â*«$}Ì¤\×ª\ÚX\éq9*V¨‰T“i\æO­\r;o\rŞ\ïxA0Ÿ\ïK€ü]rùS\çf$\\!>`˜§p!„‚•‚Ù`ùÀµ[\ã)St&L²Œm+ö\"°»Ë‡@0Ó®_ûÌ±h\á9¼*—oa}´ö\èu(JH)„%0W\"OvŸk÷›RV5\îª˜6´p\nS“d\ÎQD\0Fºr®\ï\É\ÊKgg$|R8\ß\Å¿÷\È[ºin38\á(iKù.kc…)*_jœ†\ì\Äe\Z+l©ElœBGt*?\íœ\Şd \Èó³Œ«0’xH$ûŠË¢~¦—Œ+\ãb\Çş\éum¤4¶\Ê@\â¸\Ö÷mk†ö;\éH\Æ,\02ğ\ZxŠ\Ócöi\ácó¦kº.tzRşNK¸W‹A¾63X´\çÊ¼:Ö ™!é‚„\ä\êcŸ*a­\Ş\Æ\Ì\åi Ü€TAQ™:øt\éH9ˆq±	Z£* (•°7¸¢a^YH*)“û¨ü\Òh¾’T2ñ<wT3´·aüA*x4¥‘\n\ä \å¿\Îi67–”\Ñ-¼{\"Ja+´¨•\ï9Ö–Ú˜”…¦³#2òmIšo9-¤\0€£œı\Ñ1`TE\Ë\Í-†^!…ºe\Ë	ˆBV	d¡\rŒ­\'³PJ @%0ˆŸ\Ê‡\Æ4\\y\ÌùseI\0I\"ò\'Kñğ¡\ìŒz\Ô¤bP#B€¨PDZm[eÀ%\Í/c…t\0’\Ï\0úR8Ir^ñK†Gl¼CaO«º§œ$‚®È¶Ø°JR\ÃS¤“©\ãTı\á\Ù\\.ö™”„˜%r|9™\èj\Ø\æü\á4È§,J²¶”ğ¥q\ÒxUW{vó %œ:›…\æ.„\È	\" ‰3~B¦\İ\ì\Ë)Ep+…\ÙO½‡NEeG{º‘”)YydFch W\'v¶»œ¤;·	?•9»{Ù†a€‡\ZYT•„¶s+’ˆ6V,.÷`œP@YL‹\Ü	\Ö-0i{\Ø\êj¨\Æb±\ÙÖ¤¼R•h“p”„\0®œx\êi½\ê\Ún´\Ûmœ›­	$A\Ì\0\ÍcŠxU\Ü*¿Oòğô¨\ã*â‚”8¤Áƒ z\å·J{•l[\Ö\ĞÙ˜HH‡Z\ÓXd†û!š\0Z8Y\Ío]h\Ç\nX0r¡K™ø”“yµ¡=‰\r\çUˆJ£*@ü=\âf\æñ\åE6+HŒo`´\ÒTAQ1c6\Ò€ğ®ö~ÀC@­sıÒ“\"¤‹ƒ\ÊjMX¤(\0Wu$…|\'1\"x_\ÄV“m %fLœ \å\Ê8V·F¤F³»\éHŒ\ê\ã÷SÏ¬\ÖT¨Çµøı•úVP¶jG`³À\×úP\Ü}ƒÌŸ®ZÙ¯«F\Ô|¢škv±*\Õ €¯1\æÆ¹’ù’¦û	¥şI\0Q&u)\é­Iµ¹\ï©m€8w–”\ë[ nVÿ\0’R3R}^şAX\å\è@v‚`WmUrjÉ‡\İ6’V£\âú\n\Ã\ìl:\rš\ÖUÿ\0‘©K\Äq.-›\ÊeA¸˜Jªa”ò\ìTp\åW„¨\'\á\0€~Tb\ä\ßó¨KÄ½\"2\Å\îTZ\İ\'T;\Å	ó“FF\æÆ¯Ÿ\åDÿ\0\íVœ\Ò9y\Z\Ò@U‰¿\×*Œºü²\Ù:Ê‰^N\ç·\Å\×’G\ëEN\éa†¥\Åx©?©¸B~u\ÑH\ç\\ò\ë3ú‡Ë¡†İ¬\ZN`…O>\Ñ`û\ZqÍ–\Ù\Ğ}dfh\æ\ß\Óõ®™\ÖO­4:üğw´ÿ\0qe†[¤*\î\Íı\Ôÿ\05{[ü´£Œ)1*)#û\Ô\æJ\0ÇœT«dsö¢f&xxÁ\ìôßˆóÂ–D¤¾¿\ë\ìyÙ¼\'÷JŸ¶\ßoû²/\íK	ï´•¦÷D\"GÊ€¼n)%µˆü ~µ%öT“ eW\âA úG	üˆŒ\ÒO2…«\Ì\Øzö±ø÷G(\Û\Û\Û\í}O>^?†Wû\×\İoô+\ï\âY:%z|¼A„—²R«\0o¬r\ëV6vP*PA”{„\Ñ\Û\Ù\É:•«\Å\×>I {RKñJ¿Ld\Í\Ìÿ\0T\Òş\n¢°+V¬¬ø\Ì{ó¥±t \ëi ŸúšiÀ«­^“²\Ú\â\Òñ$+O\â½6Œ\"\"Ày*\å—\âuş8¾lé‡.ó#Ì™Å–¢	\Í0™<§\áğ«;›\ÄÁ@\Îòn>(ŸTŸ\ÌT\Ö#`°\ä…6›ñ\Ó\ê/QX­\Ê`ê–Ÿ0¯˜¨K\Çc•Ü£GO\Ğù¨¶ÿ\0vE>	\àa(ŸÂ”$Ï‹E&|\é÷W\n±d)™Cª×§hó¦ñ{ƒøV•Š\Ån\Óød•P‘r[T0“T\Ç\×\áŸ¶‰.Q˜]\Ô\Â”´ó‚M\Ê\ÔFœĞ•9ƒ\İ}œ™\Ãñ€¥,Í£\â>ı*¯†Ú&\\&8\r‡R&\Öø‰ƒT=d‘\íVY=\Êj¡è¬º\Ìe\0€,-\\¾\Ëk±÷š¤³¾)fzŒ´ş{˜:Û\Èù‚=\éÔ©z¿ºøe’r\\ò X¤ñ’Ò¤,OY§ğ\Ûq…›8[T«\äAö¦< Û˜$u\â\0÷§³rV¸`L;¨‹§„ƒ\ÃÂ”qM–“\0b\01Ê®\Ê\Æ/\îÊºY_\"k±ˆ03q\ÖPA\ZVÔLóó¸sOø\ëZ«\âñIŒ©=gZ\Ê\Ú\ã\êm,T3\Òö­%*Q\×\ëJY “¯”{\Ä\r}=õ¯Šcò0\Ù\Zfüôò­º\êb3¢ô»i<®9}Oµr³:ùpùQJ–æ½‚‡À\Şó?•i2\"}½¨9_X?\Öõ\Ör4}|b›J\0\Ò\Í\à\ê~b\Õ\Óf\İt¹¥¾£Š­\×X­¥ÁÄ§œ\Üÿ\0QJ\Ö\ámq®Õ¥QĞŠL¯‰Ÿ1\ÖN¾•\ØrG__M&Æ±Ô»›œñ\å\ê+‚\ÙıO\åJg<¼‰—\éD\ÎbrY½¯\Ø\Ê\Ã_9²üğ\ÓÒ–Sš™>b>zÖ»`uTô\ÓO:Mk\Z*…Ç„®€\å\0|½«€¼\Ú\Ìóš\Ön ||\è\×p\Ï2h­™\Z“õ\ëK\Ï^¼¨tlf\Ã\ëık&\Â1\ç#Y=>®”9\Î9__\n\ì9i\nfi\îÃ°@\â¸úõz\Å9\ÌPreW#§…jµ p3>\ßB™)z˜\é*ú½t<ü\è ©ùVÖ™\Ó\×OY¤pNÈ?^Â\ÛM¨\á\İò…r\å>t\ê[W;r\ÔP6‚?f°o)U\î‡ˆª\Ãfğyö\ëc1(\Ì*Pd:õŠ½bv~\Ë)\r¤ié§¥yn{‹™™óv|[	-•*/¤OŸz]f\ÊjX\ÎxIU1\ÌF\éa\ÕğJ|ü\ê¹`]/üP=j/½x…Y$ ~\èşµ\î!k=å¨¤‘G¥~©\×\ÔYJ>ö†\Ï\r*\n’¿\á3K!\Å\'\áQO#\åÊ¤r®Tz×£\Ò\ä˜ó;_Uˆ\ïıjAğ\Ä&&D•\'\ËSòªÿ\0k\å\íò¬+4\êr6¦[ÿ\0·Küyƒ\îSZªi\"·M\æ0\ëgª4m\Ã\Æcúó®’½yô¹ùøÒ®¨M§‘a hOZ#2­$_‰\ç\Æ\ÕóY\Ñ\ì4\êÀ&IúŸ®4¸u\Ö9ış´,J¯\0¤‘ËŸ\×:Ä¹\Æo§¥ôšm4\Ì\ÙÒ–¢zt\ç<d`L›“\á\'\Ú(eRgRzşTV\áW:qÓ¥¬BRcÌŸ=4­¤	¾_\"O¥.µ$qBó~^k[Müi¬l¥\"n-¥¯\á\íX…A˜#•¿Z\åJ@·h¡Û¤øq\éBMò‹<tŸ3\éık„¾y\Z\Û\å]Dˆ\0M¤\ß\ç\Ãı(ABfI/~œ¸QÑ¨\ÃAD\ß@>´úÖ´z*G–½8RŠp&ñ\æ\äøŸ­(ı²Ozqõ\é[FÆ° ú\ÇÏ…l»\Èòñ\ãÒ”.q	\ër G(·Z\ØRúúğóŸO\ZO.¹5v“\ÈG+\×m»§ZI\'0\ão#c]¥B\Ö\'\ÈË\×Z\Î!Lu\åH¿¬~‡J	I{Ÿ\â÷7®‚£N\äxyš\Ì\Ä§\È\Ê|\ïs\å[~üs3\æ~FŒ—g—\È\ÒÄ‚o$t&¸y1p	ò<zxQ‹}ƒmc1	\0\Ä\é\Ó\å?:\ŞÀ@$‘\â@ùiıj\í%n„§\á\Ë\ÄyTûo\ßA¤£WwJù2•˜§DÅ¼\ÌFµR\ŞT\âR¥˜#÷gò«Xt	°ğşœ=\èx\ÇAAI#\ÅøyiUÃ’1•µó4’hòÅ§ŒHğüë„›Ø”ıt¦ß”©InF£(¡\0yÇ¯\å^\Ò\İ\Ô	mqŸhü¨*cÛ´û$¨\ÄAµ.PE\ío¯:Â´,[¥¥<G¥5˜ª\Ğ>U§š\éz\Ö\n#\Öz\à7Öš[`tò¡¨®TA@T\Ùü\ëu×§×eQ\é}’,ñ=Lüh‰(F³Ÿ\åYY^Vu j7\á\à\'\ç\\!@ğ\Äñ°¦ÿ\0Ö²²–+–+9\Ã÷Áƒ}4´\É}<\éÖ›€B®\Ï\Ó\êk+)¥ğºA.]JŒ&zLGŸ\×\n\ïScú\é\áYYI‘P¨+H°>±\ÄşuÊ”×¡úúÖ²²’­rj˜¼	\0ğÂ˜	nu¶“ş••”\ÉS2y|½ë§§Î¸mñ2‰\ZxL	f²²Z÷R”Fd¡\ÔG”}x\ÒØ‡\nD©\"¼`[•eejRj\Æ|w”Á¸=ğ\ë\àN´\Â]&c~sa\Æ>¸VVP”HT÷\ã&cA\Ïú\ĞúÈ±*á­§Kù}iYYCUŒÈ’gº<dA\Z}M%´ö€	™\'^¸ğ¬¬§†8¹\'\îi:@6F \êBT’o2imoV\0Õ‰L/Ş›qúğ­VP\Éú\èhoRœ‚ \íj\çlc‰M\í\ÈÀ#\ÓQoô­VWF8­i{\Ğ’~¹Ó¸6FtÈ´ñ¸ö¼iYY^¼\ÕGbh°\í-\Û\nH(P®#õª¾#´+)¹\Ò\Äs­\ÖWGšsmH£Š«¡iğk=fÕ••\Ş\Ñ)lkW:\Õ<<~…ee\0\Ë\áYYYXÔÿ\Ù','Imagen 3',4);
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
