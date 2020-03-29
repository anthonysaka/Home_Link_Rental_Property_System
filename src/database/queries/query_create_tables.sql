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

CREATE TABLE t_owner(
id_owner INT NOT NULL AUTO_INCREMENT,
type_owner VARCHAR(15) NOT NULL,
address VARCHAR(30) NOT NULL,
status_owner VARCHAR(15) NOT NULL,
feedbacks VARCHAR(100) NULL,
price FLOAT NOT NULL,
characteristic VARCHAR(100) NOT NULL,
id_user_owner INT NOT NULL,

PRIMARY KEY (id_owner),
FOREIGN KEY (id_user_owner) REFERENCES t_user(id)
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
id_owner INT NOT NULL,
id_card INT NOT NULL,

PRIMARY KEY (num_reservation),
FOREIGN KEY (id_user) REFERENCES t_user(id),
FOREIGN KEY (id_owner) REFERENCES t_owner(id_owner),
FOREIGN KEY (id_card) REFERENCES t_card(id_card)
);

