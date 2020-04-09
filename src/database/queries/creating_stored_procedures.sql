
DELIMITER ##
CREATE PROCEDURE sp_createUser (in pa_username VARCHAR(15), in pa_email VARCHAR(50), in pa_password VARCHAR(25),
								in pa_name VARCHAR(20), in pa_lastname VARCHAR(30), in pa_gender VARCHAR(15),
                                in pa_type VARCHAR(15), in pa_status VARCHAR(15), in pa_created_date DATETIME)
BEGIN
	INSERT INTO t_user(username,email,`password`,`name`,lastname,gender,`type`,`status`,created_date)
    VALUES(pa_username, pa_email, pa_password, pa_name, pa_lastname, pa_gender, pa_type, pa_status, pa_created_date);
END##
DELIMITER ;

DELIMITER ##
CREATE PROCEDURE sp_search_publication_by_dir(IN pa_direccion VARCHAR(30))
BEGIN
		SELECT t_property.type_property, t_property.address, t_property.status_property, t_property.feedbacks,
			t_property.characteristic, t_user.username AS `Dueño`, t_publication.price, t_publication.publicaction_date,
            t_imagenes.image
    FROM t_property 
	INNER JOIN t_user ON t_property.id_user_property = t_user.id
    INNER JOIN t_publication ON t_property.id_property = t_publication.id_property
    INNER JOIN t_imagenes ON t_publication.id_imagen_preview = t_imagenes.id_image
    WHERE address = pa_direccion AND status_property = "Disponible";

END##
DELIMITER ;
-- --------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_card`(in pa_numCard varchar(16), in pa_username varchar(15), in pa_cardOwner varchar(20), in pa_expirationDate date, in pa_cvv int)
BEGIN

INSERT INTO t_card (num_card, card_owner, expiration_date, cvv, user_owner) 
VALUES (pa_numCard, pa_cardOwner, pa_expirationDate, pa_cvv, pa_username);

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertProperty`(in pa_typeProperty varchar(30), in pa_address varchar(30), pa_status varchar (15), pa_characteristic varchar(100), pa_userID int)
BEGIN

INSERT INTO t_property (type_property, address, status_property, characteristic, id_user_property)
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
CREATE DEFINER=root@localhost PROCEDURE sp_insert_publicacion(in pa_idPropiedad int , in pa_precio float)
BEGIN

select id AS id_admin
from t_user
where t_user.type = 'Admin';
INSERT INTO t_publication (publication_date, status_publication , id_user_adm , id_property , price) 
VALUES (curdate() , 'Publicadas' , id_admin , pa_idPropiedad , pa_precio );

END$$
DELIMITER ;

