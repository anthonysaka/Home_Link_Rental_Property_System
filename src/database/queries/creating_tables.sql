USE home_link_db;
CREATE TABLE t_user(
    -- ATTRIBUTES --
	id					INT NOT NULL AUTO_INCREMENT,
	username 			VARCHAR(15) NOT NULL,
	email				VARCHAR(50) NOT NULL,
	`password`		 	VARCHAR(25) NOT NULL,
	`name`				VARCHAR(20)	NOT NULL,
	lastname 			VARCHAR(30) NOT NULL,
	gender				VARCHAR(15) NULL,
	country_location_id INT NULL,
	telephone_number 	VARCHAR(20) NULL,
	`type`				INT NOT NULL,
	`status` 			INT NOT NULL DEFAULT(1),
	created_date 		DATETIME NOT NULL DEFAULT(current_date()),
     -- DECLARATION CONSTRAINS --
    PRIMARY KEY (id),
    UNIQUE (username),
    FOREIGN KEY (country_location_id) REFERENCES country(id)
);
CREATE TABLE t_country (
	-- ATTRIBUTES --
	id INT NOT NULL AUTO_INCREMENT,
    name_country VARCHAR(30),
    continent	VARCHAR(20),
    -- DECLARATION CONSTRAINS --
    PRIMARY KEY (id)
);
