DROP DATABASE IF EXISTS PManager;

CREATE DATABASE PManager;

USE PManager;

CREATE TABLE users (
    IdUser INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
    token TEXT,
    id CHAR(50),
    email VARCHAR(255),
    url VARCHAR(150),
    PRIMARY KEY (IdUser) USING BTREE,
    UNIQUE INDEX `UC_User` (`email`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE files (
    IdFile INT(11) NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
    DateLastModif DATETIME NULL DEFAULT NULL,
    File BLOB NULL DEFAULT NULL,
    IdOwner INT(11) UNSIGNED NULL DEFAULT NULL,
    IdProject INT(11) UNSIGNED NULL,
    PRIMARY KEY (IdFile) USING BTREE,
    INDEX indexage (IdOwner) USING BTREE,
    CONSTRAINT Contrainte1 FOREIGN KEY (IdOwner) REFERENCES users (IdUser) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE projects (
    IdProjects INT(11) NOT NULL,
    Name VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
    IdOwner INT(11) UNSIGNED NOT NULL,
    PRIMARY KEY (IdProjects) USING BTREE,
    INDEX IdOwne (IdOwner) USING BTREE,
    CONSTRAINT IdOwne FOREIGN KEY (IdOwner) REFERENCES users (IdUser) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `images` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`path` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;

CREATE TABLE `associationproject` (
	`IdProjects` INT(11) NOT NULL,
	`IdUser` INT(11) NOT NULL,
	UNIQUE INDEX `UC_Project` (`IdProjects`, `IdUser`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;




INSERT INTO users (Name, token, id, email, url) VALUES ('Teys', '00000', '00000', 'louis.teys@insa-lyon.fr', 'monsite.com');
INSERT INTO users (Name) VALUES ('Lee');
INSERT INTO users (Name) VALUES ('Mansour');
INSERT INTO users (Name) VALUES ('Jiang');
INSERT INTO users (Name) VALUES ('Jerbi');
INSERT INTO users (Name) VALUES ('Dinh');


INSERT INTO files (Name, DateLastModif, IdOwner) VALUES ('test', '2022-03-15 18:42:42',1);
INSERT INTO files (Name, DateLastModif, IdOwner) VALUES ('tesqrqzert', '2022-03-15 18:42:42',1);
INSERT INTO files (Name, DateLastModif, IdOwner) VALUES ('test', '2022-03-15 18:42:42',1);
INSERT INTO files (Name, DateLastModif, IdOwner) VALUES ('teszrt', '2022-03-15 18:42:42',1);
INSERT INTO files (Name, DateLastModif, IdOwner) VALUES ('testL1', '2022-03-15 18:42:42',1);
INSERT INTO files (Name, DateLastModif, IdOwner) VALUES ('testL', '2022-03-15 18:42:42',1);
INSERT INTO files (Name, DateLastModif, IdOwner) VALUES ('test', '2022-03-15 18:42:42',1);

INSERT INTO files (Name, DateLastModif, IdOwner) VALUES ('testC1', '2022-03-15 18:42:42',2);
INSERT INTO files (Name, DateLastModif, IdOwner) VALUES ('testC2', '2022-03-15 18:42:42',2);
INSERT INTO files (Name, DateLastModif, IdOwner) VALUES ('testC3', '2022-03-15 18:42:42',2);

INSERT INTO associationproject (IdProjects, IdUser) VALUES (1,2);
INSERT INTO associationproject (IdProjects, IdUser) VALUES (1,1);

INSERT INTO projects (IdProjects, Name, IdOwner) VALUES (1,'PWEB',1);
INSERT INTO projects (IdProjects, Name, IdOwner) VALUES (2,'PIR',1);
INSERT INTO projects (IdProjects, Name, IdOwner) VALUES (3,'CTC',1);

UPDATE files SET File="fichier test" WHERE IdFile=1

