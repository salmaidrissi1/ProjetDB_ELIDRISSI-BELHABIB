CREATE TABLE client(
   id_client INT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   email VARCHAR(50),
   telephone INT,
   PRIMARY KEY(id_client)
); 

CREATE TABLE Lieu(
   id_lieu INT,
   nom_lieu VARCHAR(50),
   adresse VARCHAR(50),
   capacite INT,
   prix_location DECIMAL(15,2),
   PRIMARY KEY(id_lieu)
);

CREATE TABLE Prestataire(
   id_prestataire INT,
   email VARCHAR(50),
   telephone INT,
   nom VARCHAR(50),
   type_prestataire VARCHAR(50),
   PRIMARY KEY(id_prestataire)
);

CREATE TABLE Creneau(
   id_creneau INT,
   heure_debut TIME,
   heure_fin TIME,
   PRIMARY KEY(id_creneau)
);

CREATE TABLE Mariage(
   id_mariage INT,
   date_mariage DATE,
   budget DECIMAL(15,2),
   statut VARCHAR(50),
   id_lieu INT NOT NULL,
   id_client INT NOT NULL,
   PRIMARY KEY(id_mariage),

   FOREIGN KEY(id_lieu)
   REFERENCES Lieu(id_lieu)
   ON DELETE CASCADE
   ON UPDATE CASCADE,

   FOREIGN KEY(id_client)
   REFERENCES client(id_client)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);

CREATE TABLE Invite(
   id_invite INT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   email VARCHAR(50),
   telephone INT,
   rsvp VARCHAR(50),
   id_invite_1 INT,
   id_mariage INT NOT NULL,
   PRIMARY KEY(id_invite),

   FOREIGN KEY(id_invite_1)
   REFERENCES Invite(id_invite)
   ON DELETE SET NULL
   ON UPDATE CASCADE,

   FOREIGN KEY(id_mariage)
   REFERENCES Mariage(id_mariage)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);

CREATE TABLE affecter(
   id_mariage INT,
   id_prestataire INT,
   cout_negocie DECIMAL(10,2),
   PRIMARY KEY(id_mariage, id_prestataire),

   FOREIGN KEY(id_mariage)
   REFERENCES Mariage(id_mariage)
   ON DELETE CASCADE
   ON UPDATE CASCADE,

   FOREIGN KEY(id_prestataire)
   REFERENCES Prestataire(id_prestataire)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);

CREATE TABLE planifier(
   id_creneau INT,
   description VARCHAR(50),
   id_mariage INT NOT NULL,
   id_prestataire INT NOT NULL,

   PRIMARY KEY(id_creneau, id_mariage, id_prestataire),

   FOREIGN KEY(id_creneau)
   REFERENCES Creneau(id_creneau)
   ON DELETE CASCADE
   ON UPDATE CASCADE,

   FOREIGN KEY(id_mariage)
   REFERENCES Mariage(id_mariage)
   ON DELETE CASCADE
   ON UPDATE CASCADE,

   FOREIGN KEY(id_prestataire)
   REFERENCES Prestataire(id_prestataire)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);
