-- ============================================================
-- 2_contraintes.sql
-- Wedding Planner — Contraintes de validation (règles métier)
-- ============================================================

-- ------------------------------------------------------------
-- CLIENT : email au format valide (contient @ et .)
-- ------------------------------------------------------------
ALTER TABLE CLIENT
    ADD CONSTRAINT chk_client_email
    CHECK (email LIKE '%@%.%');

-- ------------------------------------------------------------
-- LIEU : capacité strictement positive
-- ------------------------------------------------------------
ALTER TABLE LIEU
    ADD CONSTRAINT chk_lieu_capacite
    CHECK (capacite > 0);

-- ------------------------------------------------------------
-- LIEU : prix de location non négatif
-- ------------------------------------------------------------
ALTER TABLE LIEU
    ADD CONSTRAINT chk_lieu_prix
    CHECK (prix_location >= 0);

-- ------------------------------------------------------------
-- PRESTATAIRE : email au format valide
-- ------------------------------------------------------------
ALTER TABLE PRESTATAIRE
    ADD CONSTRAINT chk_prestataire_email
    CHECK (email LIKE '%@%.%');

-- ------------------------------------------------------------
-- PRESTATAIRE : type de prestation parmi une liste définie
-- ------------------------------------------------------------
ALTER TABLE PRESTATAIRE
    ADD CONSTRAINT chk_prestataire_type
    CHECK (type_prestataire IN ('DJ', 'Traiteur', 'Photographe',
                                'Vidéaste', 'Fleuriste', 'Animateur',
                                'Musicien', 'Décorateur', 'Autre'));

-- ------------------------------------------------------------
-- MARIAGE : budget strictement positif
-- ------------------------------------------------------------
ALTER TABLE MARIAGE
    ADD CONSTRAINT chk_mariage_budget
    CHECK (budget > 0);

-- ------------------------------------------------------------
-- MARIAGE : statut parmi les valeurs autorisées
-- ------------------------------------------------------------
ALTER TABLE MARIAGE
    ADD CONSTRAINT chk_mariage_statut
    CHECK (statut IN ('prévu', 'en cours', 'terminé', 'annulé'));

-- ------------------------------------------------------------
-- CRENEAU : heure_fin strictement après heure_debut
-- ------------------------------------------------------------
ALTER TABLE CRENEAU
    ADD CONSTRAINT chk_creneau_heures
    CHECK (heure_fin > heure_debut);

-- ------------------------------------------------------------
-- INVITE : statut RSVP parmi les valeurs autorisées
-- ------------------------------------------------------------
ALTER TABLE INVITE
    ADD CONSTRAINT chk_invite_rsvp
    CHECK (rsvp IN ('confirmé', 'refusé', 'en attente'));

-- ------------------------------------------------------------
-- AFFECTER : coût négocié non négatif
-- ------------------------------------------------------------
ALTER TABLE affecter
    ADD CONSTRAINT chk_affecter_cout
    CHECK (cout_negocie >= 0);
