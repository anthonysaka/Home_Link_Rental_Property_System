
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
    INNER JOIN t_imagenes ON t_publication.id_publication = t_imagenes.id_publication
    WHERE address = 'Puerto plata, RD' AND status_property = "Disponible" 
			AND t_imagenes.descripcion LIKE '%preview%';

END##
DELIMITER ;
 


