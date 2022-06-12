DROP TABLE IF EXISTS patients ;
CREATE TABLE patients (id_patient INT  AUTO_INCREMENT NOT NULL,
nom_patient VARCHAR(30),
prenom_patient VARCHAR(30),
date_naissance DATE,
telephone VARCHAR(10),
adresse VARCHAR(70),
ville VARCHAR(30),
sexe VARCHAR(10),
cin VARCHAR(10),
credit INT,
PRIMARY KEY (id_patient) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS consultations ;
CREATE TABLE consultations (id_consultation INT  AUTO_INCREMENT NOT NULL,
type_consultation VARCHAR(60),
desc_consultation VARCHAR(70),
diagnostics VARCHAR(70),
date_consultation DATETIME,
status VARCHAR(45),
prix INT,
id_patient INT NOT NULL,
PRIMARY KEY (id_consultation) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS rappels ;
CREATE TABLE rappels (id_rappel INT  AUTO_INCREMENT NOT NULL,
desc_rappel VARCHAR(60),
date_rappel DATETIME,
id_patient INT NOT NULL,
PRIMARY KEY (id_rappel) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS paiements ;
CREATE TABLE paiements (id_paiement INT  AUTO_INCREMENT NOT NULL,
montant INT,
date_paiement DATETIME,
id_patient INT NOT NULL,
PRIMARY KEY (id_paiement) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS infos ;
CREATE TABLE infos (id_info INT  AUTO_INCREMENT NOT NULL,
propriete VARCHAR(45),
PRIMARY KEY (id_info) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS allergies ;
CREATE TABLE allergies (id_allergie INT  AUTO_INCREMENT NOT NULL,
nom_allergie VARCHAR(45),
PRIMARY KEY (id_allergie) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS medicaments ;
CREATE TABLE medicaments (id_medicament INT  AUTO_INCREMENT NOT NULL,
nom_medicament VARCHAR(45),
PRIMARY KEY (id_medicament) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS utilisateurs ;
CREATE TABLE utilisateurs (id_utilisateur INT  AUTO_INCREMENT NOT NULL,
nom_utilisateur VARCHAR(30),
prenom_utilisateur VARCHAR(30),
username VARCHAR(30),
password VARCHAR(60),
role VARCHAR(30),
PRIMARY KEY (id_utilisateur) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS contient ;
CREATE TABLE contient (id_consultation INT  AUTO_INCREMENT NOT NULL,
id_info INT NOT NULL,
valeur VARCHAR(45),
date_info DATETIME,
PRIMARY KEY (id_consultation,
 id_info) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS introduit ;
CREATE TABLE introduit (id_consultation INT  AUTO_INCREMENT NOT NULL,
id_medicament INT NOT NULL,
desc_medicament VARCHAR(70),
PRIMARY KEY (id_consultation,
 id_medicament) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS renseigne ;
CREATE TABLE renseigne (id_consultation INT  AUTO_INCREMENT NOT NULL,
id_allergie INT NOT NULL,
PRIMARY KEY (id_consultation,
 id_allergie) ) ENGINE=InnoDB;

ALTER TABLE consultations ADD CONSTRAINT FK_consultations_id_patient FOREIGN KEY (id_patient) REFERENCES patients (id_patient)  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE rappels ADD CONSTRAINT FK_rappels_id_patient FOREIGN KEY (id_patient) REFERENCES patients (id_patient)  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE paiements ADD CONSTRAINT FK_paiements_id_patient FOREIGN KEY (id_patient) REFERENCES patients (id_patient)  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE contient ADD CONSTRAINT FK_contient_id_consultation FOREIGN KEY (id_consultation) REFERENCES consultations (id_consultation)  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE contient ADD CONSTRAINT FK_contient_id_info FOREIGN KEY (id_info) REFERENCES infos (id_info)  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE introduit ADD CONSTRAINT FK_introduit_id_consultation FOREIGN KEY (id_consultation) REFERENCES consultations (id_consultation)  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE introduit ADD CONSTRAINT FK_introduit_id_medicament FOREIGN KEY (id_medicament) REFERENCES medicaments (id_medicament)  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE renseigne ADD CONSTRAINT FK_renseigne_id_consultation FOREIGN KEY (id_consultation) REFERENCES consultations (id_consultation)  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE renseigne ADD CONSTRAINT FK_renseigne_id_allergie FOREIGN KEY (id_allergie) REFERENCES allergies (id_allergie)  ON DELETE CASCADE ON UPDATE CASCADE;
