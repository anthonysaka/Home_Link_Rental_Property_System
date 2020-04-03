USE home_link_db;

CREATE TABLE t_user(
    -- ATTRIBUTES --
    id                    INT NOT NULL AUTO_INCREMENT,
    username             VARCHAR(15) NOT NULL,
    email                VARCHAR(50) NOT NULL,
    password             VARCHAR(25) NOT NULL,
    name                VARCHAR(20)    NOT NULL,
    lastname             VARCHAR(30) NOT NULL,
    gender                VARCHAR(15) NULL,
    country_location_id INT NULL,
    telephone_number     VARCHAR(20) NULL,
    type                VARCHAR(15) NOT NULL,
    status             VARCHAR(15) NOT NULL DEFAULT(1),
    created_date         DATETIME NOT NULL DEFAULT(current_date()),
     -- DECLARATION CONSTRAINS --
    PRIMARY KEY (id),
    UNIQUE (username),
    FOREIGN KEY (country_location_id) REFERENCES t_country(id)
);
CREATE TABLE t_country (
    -- ATTRIBUTES --
    id INT NOT NULL AUTO_INCREMENT,
    name_country VARCHAR(30),
    continent    VARCHAR(20),
    -- DECLARATION CONSTRAINS --
    PRIMARY KEY (id)
);

CREATE TABLE t_property(
id_property INT NOT NULL AUTO_INCREMENT,
type_property VARCHAR(15) NOT NULL,
address VARCHAR(30) NOT NULL,
status_property VARCHAR(15) NOT NULL,
feedbacks VARCHAR(100) NULL,
characteristic VARCHAR(100) NOT NULL,
id_user_property INT NOT NULL,

PRIMARY KEY (id_property),
FOREIGN KEY (id_user_property) REFERENCES t_user(id)
);

CREATE TABLE t_card(
id_card INT NOT NULL AUTO_INCREMENT,
num_card VARCHAR(16) NOT NULL,
card_owner VARCHAR(20) NOT NULL,
expiration_date DATETIME NOT NULL,  
cvv INT NOT NULL,

PRIMARY KEY (id_card)
);

CREATE TABLE t_reservation(
num_reservation INT NOT NULL AUTO_INCREMENT,
children_guest INT NULL,
adult_guest INT NOT NULL,
start_date DATETIME NOT NULL DEFAULT(current_date()),
end_date DATETIME NOT NULL,
id_user INT NOT NULL,
id_property INT NOT NULL,
id_card INT NOT NULL,

PRIMARY KEY (num_reservation),
FOREIGN KEY (id_user) REFERENCES t_user(id),
FOREIGN KEY (id_property) REFERENCES t_property(id_property),
FOREIGN KEY (id_card) REFERENCES t_card(id_card)
);

CREATE TABLE t_publication (
    -- ATTRIBUTES --
    id_publication INT NOT NULL AUTO_INCREMENT,
    publicaction_date date NOT NULL ,
    status_publication varchar(15) NOT NULL,
    id_user_adm int NOT NULL,
    id_property int NOT NULL,
    price NUMERIC (10,2) NOT NULL,
    -- DECLARATION CONSTRAINS --
    PRIMARY KEY (id_publication),
    FOREIGN KEY (id_property) REFERENCES t_property(id_property)
);

CREATE TABLE t_imagenes (
    -- ATTRIBUTES --
    id_image INT NOT NULL AUTO_INCREMENT,
    image LONGBLOB NOT NULL,
    descripcion VARCHAR(50),
    id_publication INT NOT NULL,
    -- DECLARATION CONSTRAINS --
    PRIMARY KEY (id_image),
    FOREIGN KEY (id_publication) REFERENCES t_publication(id_publication)
);


