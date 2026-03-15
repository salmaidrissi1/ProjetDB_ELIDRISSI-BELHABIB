/* ===== Contraintes sur les mariages ===== */

ALTER TABLE Mariage
ADD CONSTRAINT chk_budget
CHECK (budget >= 0);

ALTER TABLE Mariage
ADD CONSTRAINT chk_statut
CHECK (statut IN ('prévu','en cours','terminé','annulé'));


/* ===== Contraintes sur les lieux ===== */

ALTER TABLE Lieu
ADD CONSTRAINT chk_capacite
CHECK (capacite > 0);

ALTER TABLE Lieu
ADD CONSTRAINT chk_prix_location
CHECK (prix_location >= 0);


/* ===== Contraintes sur les créneaux horaires ===== */

ALTER TABLE Creneau
ADD CONSTRAINT chk_heure
CHECK (heure_fin > heure_debut);


/* ===== Contraintes RSVP pour les invités ===== */

ALTER TABLE Invite
ADD CONSTRAINT chk_rsvp
CHECK (rsvp IN ('confirme','refuse','en attente'));


/* ===== Contraintes sur les emails ===== */

ALTER TABLE Client
ADD CONSTRAINT unique_email_client
UNIQUE (email);

ALTER TABLE Prestataire
ADD CONSTRAINT unique_email_prestataire
UNIQUE (email);


/* ===== Contraintes sur les téléphones ===== */

ALTER TABLE Client
ADD CONSTRAINT chk_tel_client
CHECK (telephone > 0);

ALTER TABLE Prestataire
ADD CONSTRAINT chk_tel_prestataire
CHECK (telephone > 0);

ALTER TABLE Invite
ADD CONSTRAINT chk_tel_invite
CHECK (telephone > 0);


/* ===== Contraintes sur les types de prestataires ===== */

ALTER TABLE Prestataire
ADD CONSTRAINT chk_type_prestataire
CHECK (type_prestataire IN ('DJ','traiteur','photographe','decorateur','animateur'));


/* ===== Contraintes sur les coûts négociés ===== */

ALTER TABLE affecter
ADD CONSTRAINT chk_cout_negocie
CHECK (cout_negocie >= 0);