USE home_link_db;

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
CREATE PROCEDURE sp_search_publication_by_dir(in pa_direccion VARCHAR(30))
BEGIN
	SELECT * FROM t_property WHERE address = pa_direccion;
END##
DELIMITER ;


