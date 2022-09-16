CREATE TABLE IF NOT EXISTS users (
     user_id int NOT NULL AUTO_INCREMENT,
     accreditation_num int DEFAULT -1,
     active TINYINT NOT NULL,
     address varchar(255) NOT NULL,
     date_of_birth date NOT NULL,
     email varchar(100) NOT NULL,
     first_name varchar(100) NOT NULL,
     last_name varchar(100) NOT NULL,
     password varchar(30) NOT NULL,
     phone_num varchar(30) NOT NULL,
     role ENUM('AD','PA','DR') NOT NULL,
     verified TINYINT DEFAULT 0,
     PRIMARY KEY (user_id),
     UNIQUE KEY `phone_num_UNIQUE` (phone_num),
     UNIQUE KEY `email_UNIQUE` (email)
) ENGINE=InnoDB;