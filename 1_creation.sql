
CREATE TABLE CLIENT(
   id_client INT,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   email VARCHAR(100) NOT NULL UNIQUE,
   telephone VARCHAR(20),
   PRIMARY KEY(id_client)
);

CREATE TABLE LIEU(
   id_lieu INT,
   nom_lieu VARCHAR(50) NOT NULL,
   adresse VARCHAR(50) NOT NULL,
   capacite INT NOT NULL,
   prix_location DECIMAL(10,2) NOT NULL,
   PRIMARY KEY(id_lieu)
);

CREATE TABLE PRESTATAIRE(
   id_prestataire INT,
   nom VARCHAR(50) NOT NULL,
   type_prestataire VARCHAR(50) NOT NULL,
   email VARCHAR(100) NOT NULL UNIQUE,
   telephone VARCHAR(20),
   PRIMARY KEY(id_prestataire)
);

CREATE TABLE MARIAGE(
   id_mariage INT,
   date_mariage DATE NOT NULL,
   budget DECIMAL(10,2) NOT NULL,
   statut VARCHAR(50) NOT NULL DEFAULT 'prévu',
   id_lieu INT NOT NULL,
   id_client INT NOT NULL,
   PRIMARY KEY(id_mariage),
   FOREIGN KEY(id_lieu) REFERENCES LIEU(id_lieu)
      ON UPDATE CASCADE ON DELETE RESTRICT,
   FOREIGN KEY(id_client) REFERENCES CLIENT(id_client)
      ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE CRENEAU(
   id_creneau INT,
   heure_debut TIME NOT NULL,
   heure_fin TIME NOT NULL,
   id_mariage INT NOT NULL,
   PRIMARY KEY(id_creneau),
   FOREIGN KEY(id_mariage) REFERENCES MARIAGE(id_mariage)
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE INVITE(
   id_invite INT,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   email VARCHAR(100),
   telephone VARCHAR(20),
   rsvp VARCHAR(50) NOT NULL DEFAULT 'en attente',
   id_invite_1 INT DEFAULT NULL,
   id_mariage INT NOT NULL,
   PRIMARY KEY(id_invite),
   FOREIGN KEY(id_invite_1) REFERENCES INVITE(id_invite)
      ON UPDATE CASCADE ON DELETE SET NULL,
   FOREIGN KEY(id_mariage) REFERENCES MARIAGE(id_mariage)
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE affecter(
   id_mariage INT,
   id_prestataire INT,
   cout_negocie DECIMAL(10,2) NOT NULL,
   PRIMARY KEY(id_mariage, id_prestataire),
   FOREIGN KEY(id_mariage) REFERENCES MARIAGE(id_mariage)
      ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(id_prestataire) REFERENCES PRESTATAIRE(id_prestataire)
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE planifier(
   id_mariage INT,
   id_prestataire INT,
   id_creneau INT,
   description VARCHAR(150),
   PRIMARY KEY(id_mariage, id_prestataire, id_creneau),
   FOREIGN KEY(id_mariage) REFERENCES MARIAGE(id_mariage)
      ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(id_prestataire) REFERENCES PRESTATAIRE(id_prestataire)
      ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(id_creneau) REFERENCES CRENEAU(id_creneau)
      ON UPDATE CASCADE ON DELETE CASCADE
);
