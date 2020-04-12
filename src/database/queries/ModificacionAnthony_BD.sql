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

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(in pa_username VARCHAR(15), in pa_email VARCHAR(50), in pa_password VARCHAR(25),
                                in pa_name VARCHAR(20), in pa_lastname VARCHAR(30), in pa_gender VARCHAR(30),
                                in pa_type VARCHAR(15), in pa_status TINYINT, in pa_created_date DATETIME)
BEGIN
    INSERT INTO t_user(username,email,password,name,lastname,gender,type,status,created_date)
    VALUES(pa_username, pa_email, pa_password, pa_name, pa_lastname, pa_gender, pa_type, pa_status, pa_created_date);
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_card`(
					in pa_numCard varchar(16), 
                    in pa_userOwner varchar(15), 
                    in pa_expirationDate date, 
                    in pa_cvv int, 
                    in pa_representante varchar(50)
                    )
BEGIN
INSERT INTO t_card (user_owner, num_card, holder_fullname, expiration_date, cvv) 
VALUES (pa_userOwner, pa_numCard, pa_representante, pa_expirationDate, pa_cvv);
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_publicacion`(
						in pa_titulo varchar(50), 
						in pa_propertyID int, 
                        in pa_price decimal(10,2),
						in pa_userID int
                        )
BEGIN
INSERT INTO t_publication (
					titulo,
                    id_user_admin,
                    id_property,
                    price,
                    status,
                    id_owner
							) 
VALUES (
		pa_titulo,
        0,
        pa_propertyID,
        pa_price,
        0,
		pa_userID
);

END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarCaracteristicas`(
				in pa_capacidad int,
                in pa_habitaciones int,
                in pa_camas int,
                in pa_bathroom int,
                in pa_wifi boolean,
                in pa_AirCond boolean,
                in pa_kitchen boolean,
                in pa_pool boolean,
                in pa_other varchar (150)						
                        )
BEGIN

INSERT INTO t_characteristic_property(capacity, room, bed, 
										bathroom, wifi, air_conditioner,
                                        kitchen, pool, other)
VALUES ( pa_capacidad,pa_habitaciones,pa_camas, pa_bathroom, 
		pa_wifi, pa_AirCond, pa_kitchen, pa_pool, pa_other
        );

END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarDireccion`(
				in pa_pais varchar (50),
                in pa_ciudad varchar (70),
                in pa_calle varchar (70)
					)
BEGIN
INSERT INTO t_address_property (country_name, city, street)
VALUES (pa_pais, pa_ciudad, pa_calle);
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertImagenes`(
							pa_imagen longblob, 
                            in pa_descripcion varchar(50),
                            in pa_id_publicacion int)
BEGIN

INSERT INTO t_imagenes (image, descripcion, id_publicacion)
VALUES (pa_imagen, pa_descripcion, pa_id_publicacion);

END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertProperty`(
                in pa_tipo varchar(30),
                in pa_idDireccion int,
                in pa_idChar int,
                in id_user int
                )
BEGIN
INSERT INTO t_property (type, id_address_property, status, rating, id_characteristic, id_user_owner)
VALUES (pa_tipo, pa_idDireccion, 0, 0.0, pa_idChar, id_user);
END$$
DELIMITER ;



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_loginIn`(in pa_username varchar(15), in pa_password varchar(25))
BEGIN
SELECT * FROM t_user WHERE username = pa_username and password = pa_password;
END$$
DELIMITER ;

ESTE HAY QUE ADAPTARLO LOS DEMÁS ESTAN LISTOS Y PROBADOS

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_search_publication_by_dir`(IN pa_direccion VARCHAR(30))
BEGIN
    SELECT t_publication.titulo, t_property.type, t_property.address, t_property.status, t_property.rating,
           t_property.characteristic, t_user.username AS Dueño, t_publication.price, t_publication.date,
           t_imagenes.image
    FROM t_property 
    INNER JOIN t_user ON t_property.id_user_owner = t_user.id
    INNER JOIN t_publication ON t_property.id = t_publication.id_property
    INNER JOIN t_imagenes ON t_publication.id_imagen_preview = t_imagenes.id
    WHERE address = pa_direccion AND t_property.status = 1;

END$$
DELIMITER ;
CREATE VIEW 
vista_general_clientes AS
select  t_user.id ID_User, username Username, t_user.name Name, lastname Lastname,t_user.country_name Country ,gender Gender, t_user.type,t_user.status,t_user.email Email, telephone_number Telephone_Number, t_user.type User_Type, t_user.created_date Created_Date , count(DISTINCT t_publication.id) Publication_Number , count(DISTINCT t_reservation.num_reservation) Reservation_Number
from t_user
left join t_property
ON t_property.id_user_owner = t_user.id
left join t_publication
ON t_user.id = t_publication.id_owner
left join t_reservation
ON t_user.id = t_reservation.id_user
group by t_user.id;

select * from t_user;
select * from t_property;	
select * from t_publication;
select * from t_address_property;
select * from t_imagenes;
select * from t_reservation;
select * from t_country;

select * from vista_general_clientes;

SELECT t_publication.id, t_publication.titulo, t_publication.`date`,
		t_publication.id_property,
        t_publication.price, t_publication.`status`,
        t_user.username
FROM t_publication 
INNER JOIN t_user ON t_publication.id_owner = t_user.id
WHERE t_publication.`status` = 0 AND t_publication.id_user_admin = 0;

select * from vista_general_publicaciones;
CREATE VIEW 
vista_general_publicaciones AS
select t_publication.id ID_Publication, titulo Title, (select t_user.username
                                                        from t_user
                                                        where t_user.id = t_publication.id_user_admin) Confirmed_Admin,
                                                        t_user.username UserName_Owner  , date Date, t_publication.status,price Price, concat(DATEDIFF(NOW(),t_publication.date)," ", 'dias' )  Publication_Days, concat( t_address_property.country_name ,"," ," " ,t_address_property.city, " ",t_address_property.street ) Address_Property, t_property.type Type_Property
from t_publication
left join t_property
ON t_publication.id_property = t_property.id
left join t_user
ON t_property.id_user_owner = t_user.id
left join t_address_property
ON t_address_property.id_address = t_property.id_address_property
where id_user_admin !=0 AND t_publication.status = true ;

DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE sp_direccionesPublicadas()
BEGIN

select concat(t_address_property.country_name, ",", " ",t_address_property.city) direccion
   from t_publication 
   inner join t_property 
   on t_publication.id_property = t_property.id inner join
   t_address_property on t_property.id_address_property = t_address_property.id_address
   where t_publication.status = 1;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=root@localhost PROCEDURE sp_tablaPropiedades(in pa_idOwner int)
BEGIN
select t_property.type, t_property.status,t_property.rating, concat( t_address_property.country_name ,"," ," " ,t_address_property.city, " ",t_address_property.street ) Address_Property,  concat( 'Capacity' ," ",t_characteristic_property.capacity ,",", 'Room'," " ,t_characteristic_property.room ,",", 'Bed', " ", t_characteristic_property.bed, "," , 'Bathroom', " ",t_characteristic_property.bathroom , ",", 'Wifi'," ",t_characteristic_property.wifi,",", 'Air_Condicioner', " ",t_characteristic_property.air_conditioner,",", 'Kitchen'," ",t_characteristic_property.kitchen,",",'Pool'," ",t_characteristic_property.pool ) Characteristic_Property
   from t_property
   left join t_address_property
   ON t_property.id_address_property = t_address_property.id_address
   left join t_characteristic_property
   ON t_characteristic_property.id_characteristic = t_property.id_characteristic WHERE t_property.id_user_owner = pa_idOwner;

END$$
DELIMITER ;

call sp_search_publication_by_dir('Dominican Republic','Santiago de los Caballeros');

select * from t_bill;
select * from t_reservation;
select num_reservation from t_reservation order by num_reservation desc limit 1;