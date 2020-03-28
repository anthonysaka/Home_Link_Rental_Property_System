USE home_link_db;
DELIMITER ##
CREATE PROCEDURE sp_createUser (in pa_username VARCHAR(15), in pa_email VARCHAR(50), in pa_password VARCHAR(25),
								in pa_name VARCHAR(20), in pa_lastname VARCHAR(30), in pa_gender VARCHAR(15),
                                in pa_type_id INT, in pa_status_id INT, in pa_created_date DATETIME)
BEGIN
	INSERT INTO t_user(username,email,`password`,`name`,lastname,gender,type_id,status_id,created_date)
    VALUES(pa_username, pa_email, pa_password, pa_name, pa_lastname, pa_gender, pa_type_id, pa_status_id, pa_created_date);
END##
DELIMITER ;

