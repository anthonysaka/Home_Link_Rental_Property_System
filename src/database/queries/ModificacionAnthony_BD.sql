CREATE TABLE `t_country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  
  PRIMARY KEY (`id`)
);

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
  UNIQUE KEY (`username`),
  FOREIGN KEY (`country_location_id`) REFERENCES `t_country` (`id`)
);

CREATE TABLE `t_card` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_owner` varchar(15) NOT NULL,
  `num_card` int NOT NULL,
  `holder_fullname` VARCHAR(50) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `cvv` int NOT NULL,
  
  PRIMARY KEY (`id`),
  UNIQUE KEY (`num_card`),
  FOREIGN KEY (`user_owner`) REFERENCES `t_user` (`username`)
);


CREATE TABLE `t_imagenes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` longblob NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `t_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `status` BOOLEAN NOT NULL,
  `rating` FLOAT DEFAULT NULL,
  `characteristic` varchar(100) NOT NULL,
  `id_user_owner` int NOT NULL,
  
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_user_owner`) REFERENCES `t_user` (`id`)
);

CREATE TABLE `t_publication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `date` date NOT NULL DEFAULT (curdate()),
  `id_user_admin` int NOT NULL,
  `id_property` int NOT NULL,
  `id_imagen_preview` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` BOOLEAN NOT NULL,
  
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_property`) REFERENCES `t_property` (`id`),
  FOREIGN KEY (`id_imagen_preview`) REFERENCES `t_imagenes` (`id`)
);

CREATE TABLE `t_reservation` (
  `num_reservation` int NOT NULL AUTO_INCREMENT,
  `amount_guest` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `id_user` int NOT NULL,
  `id_property` int NOT NULL,
  `id_card` int NOT NULL,
  
  PRIMARY KEY (`num_reservation`),
  FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`),
  FOREIGN KEY (`id_property`) REFERENCES `t_property` (`id`),
  FOREIGN KEY (`id_card`) REFERENCES `t_card` (`id`)
);

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(in pa_username VARCHAR(15), in pa_email VARCHAR(50), in pa_password VARCHAR(25),
								in pa_name VARCHAR(20), in pa_lastname VARCHAR(30), in pa_gender VARCHAR(15),
                                in pa_type VARCHAR(15), in pa_status TINYINT, in pa_created_date DATETIME)
BEGIN
	INSERT INTO t_user(username,email,`password`,`name`,lastname,gender,`type`,`status`,created_date)
    VALUES(pa_username, pa_email, pa_password, pa_name, pa_lastname, pa_gender, pa_type, pa_status, pa_created_date);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE sp_insert_card(in pa_numCard varchar(16), in pa_userOwner varchar(15), in pa_expirationDate date, in pa_cvv int, in pa_representante varchar(30))
BEGIN
INSERT INTO t_card (user_owner, num_card, holder_fullname, expiration_date, cvv) 
VALUES (pa_userOwner, pa_numCard, pa_representante, pa_expirationDate, pa_cvv);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_publicacion`(in pa_idPropiedad int , in pa_precio float)
BEGIN
select id AS id_admin
from t_user
where t_user.type = 'Admin';
INSERT INTO t_publication (publication_date, status , id_user_admin , id_property , price) 
VALUES (curdate() , 'Publicadas' , id_admin , pa_idPropiedad , pa_precio );
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertProperty`(in pa_typeProperty varchar(30), in pa_address varchar(30), pa_status varchar (15), pa_characteristic varchar(100), pa_userID int)
BEGIN
INSERT INTO t_property (`type`, address, `status`, characteristic, id_user_owner)
VALUES (pa_typeProperty, pa_address, pa_status, pa_characteristic, pa_userID);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_loginIn`(in pa_username varchar(15), in pa_password varchar(25))
BEGIN
SELECT * FROM t_user WHERE username = pa_username and password = pa_password;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_search_publication_by_dir`(IN pa_direccion VARCHAR(30))
BEGIN
	SELECT t_publication.titulo_publicacion, t_property.`type`, t_property.address, t_property.`status`, t_property.rating,
		   t_property.characteristic, t_user.username AS `Dueño`, t_publication.price, t_publication.publication_date,
		   t_imagenes.image
    FROM t_property 
	INNER JOIN t_user ON t_property.id_user_owner = t_user.id
    INNER JOIN t_publication ON t_property.id = t_publication.id_property
    INNER JOIN t_imagenes ON t_publication.id_imagen_preview = t_imagenes.id_image
    WHERE address = pa_direccion AND status_property = "Disponible";

END$$
DELIMITER ;

select * from t_user;
select * from t_property;	
select * from t_publication;
select * from t_imagenes;


