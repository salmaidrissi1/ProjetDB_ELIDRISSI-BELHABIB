
-- ============================================================
-- 3_insertion.sql
-- Wedding Planner — Insertion des données
-- ============================================================

-- ------------------------------------------------------------
-- CLIENT (10 lignes) — pas de clé étrangère
-- ------------------------------------------------------------
INSERT INTO CLIENT (id_client, nom, prenom, email, telephone) VALUES
(1,  'Dupont',   'Marie',    'marie.dupont@gmail.com',       '0612345678'),
(2,  'Martin',   'Pierre',   'pierre.martin@outlook.fr',     '0723456789'),
(3,  'Bernard',  'Sophie',   'sophie.bernard@yahoo.fr',      '0634567890'),
(4,  'Leroy',    'Thomas',   'thomas.leroy@gmail.com',       '0745678901'),
(5,  'Moreau',   'Camille',  'camille.moreau@free.fr',       '0656789012'),
(6,  'Laurent',  'Julie',    'julie.laurent@hotmail.fr',     '0767890123'),
(7,  'Simon',    'Nicolas',  'nicolas.simon@gmail.com',      '0678901234'),
(8,  'Michel',   'Lucie',    'lucie.michel@orange.fr',       '0789012345'),
(9,  'Lefebvre', 'Antoine',  'antoine.lefebvre@sfr.fr',      '0690123456'),
(10, 'Garcia',   'Emma',     'emma.garcia@gmail.com',        '0701234567');

-- ------------------------------------------------------------
-- LIEU (8 lignes) — pas de clé étrangère
-- ------------------------------------------------------------
INSERT INTO LIEU (id_lieu, nom_lieu, adresse, capacite, prix_location) VALUES
(1, 'Château des Roses',      '12 Rue des Fleurs, 69003 Lyon',          300, 15000.00),
(2, 'Domaine de la Forêt',    '5 Route Forestière, 44000 Nantes',       150,  5000.00),
(3, 'Villa Méditerranée',     '3 Allée des Palmiers, 06000 Nice',       200,  8000.00),
(4, 'Le Moulin de Paris',     '45 Rue du Moulin, 75015 Paris',          100,  6000.00),
(5, 'Bastide Provençale',     '8 Chemin des Lavandes, 13300 Salon',     250, 10000.00),
(6, 'Salle Grand Est',        '22 Rue Principale, 67000 Strasbourg',     80,  2500.00),
(7, 'Manoir Atlantique',      '17 Boulevard Océan, 33000 Bordeaux',     220,  9000.00),
(8, 'Domaine des Vignes',     '9 Route des Vignes, 21200 Beaune',       180,  7000.00);

-- ------------------------------------------------------------
-- PRESTATAIRE (12 lignes) — pas de clé étrangère
-- ------------------------------------------------------------
INSERT INTO PRESTATAIRE (id_prestataire, nom, type_prestataire, email, telephone) VALUES
(1,  'Beats & Love',       'DJ',          'contact@beatslove.fr',        '0611223344'),
(2,  'Saveurs du Terroir', 'Traiteur',    'info@saveursduterroir.fr',    '0422334455'),
(3,  'Lumière Éternité',   'Photographe', 'studio@lumiereetternite.fr',  '0633445566'),
(4,  'Ciné Mariage',       'Vidéaste',    'pro@cinemariage.fr',          '0744556677'),
(5,  'Fleurs de Rêve',     'Fleuriste',   'contact@fleursdereve.fr',     '0655667788'),
(6,  'Show & Fun',         'Animateur',   'booking@showfun.fr',          '0766778899'),
(7,  'Quartet Harmonie',   'Musicien',    'quartet@harmonie.fr',         '0677889900'),
(8,  'Élégance Déco',      'Décorateur',  'contact@elegancedeco.fr',     '0788990011'),
(9,  'DJ Maxime',          'DJ',          'djmaxime@protonmail.com',     '0699001122'),
(10, 'Gastronomie Étoile', 'Traiteur',    'contact@gastroetoile.fr',     '0400112233'),
(11, 'Capture Instants',   'Photographe', 'hello@captureinstants.fr',    '0610213243'),
(12, 'Arts & Fleurs',      'Fleuriste',   'artfleurs@gmail.com',         '0721324354');

-- ------------------------------------------------------------
-- MARIAGE (15 lignes) — FK vers CLIENT et LIEU
-- ------------------------------------------------------------
INSERT INTO MARIAGE (id_mariage, date_mariage, budget, statut, id_lieu, id_client) VALUES
(1,  '2026-06-14', 25000.00, 'prévu',    1, 1),
(2,  '2026-07-22', 18000.00, 'prévu',    2, 2),
(3,  '2026-08-10', 30000.00, 'prévu',    3, 3),
(4,  '2026-09-05', 12000.00, 'prévu',    4, 4),
(5,  '2026-10-18', 22000.00, 'prévu',    5, 5),
(6,  '2026-11-02', 15000.00, 'prévu',    6, 6),
(7,  '2026-12-20', 28000.00, 'prévu',    7, 7),
(8,  '2027-01-15', 20000.00, 'prévu',    8, 8),
(9,  '2027-02-14', 35000.00, 'prévu',    1, 9),
(10, '2027-03-21', 16000.00, 'prévu',    2, 10),
(11, '2027-04-10', 19000.00, 'prévu',    3, 1),
(12, '2027-05-25', 24000.00, 'prévu',    4, 2),
(13, '2027-06-08', 31000.00, 'prévu',    5, 3),
(14, '2027-07-17', 14000.00, 'prévu',    6, 4),
(15, '2027-08-30', 27000.00, 'prévu',    7, 5);

-- ------------------------------------------------------------
-- CRENEAU (20 lignes) — FK vers MARIAGE
-- ------------------------------------------------------------
INSERT INTO CRENEAU (id_creneau, heure_debut, heure_fin, id_mariage) VALUES
(1,  '10:00', '12:00', 1),
(2,  '14:00', '18:00', 1),
(3,  '10:30', '12:30', 2),
(4,  '14:00', '17:00', 2),
(5,  '09:00', '11:00', 3),
(6,  '14:00', '19:00', 3),
(7,  '10:00', '12:00', 4),
(8,  '15:00', '18:00', 4),
(9,  '11:00', '13:00', 5),
(10, '15:00', '20:00', 5),
(11, '10:00', '12:00', 6),
(12, '14:00', '17:00', 6),
(13, '09:30', '11:30', 7),
(14, '14:00', '19:00', 7),
(15, '10:00', '12:00', 8),
(16, '14:00', '17:00', 8),
(17, '09:00', '11:00', 9),
(18, '15:00', '20:00', 9),
(19, '10:00', '12:00', 10),
(20, '14:00', '18:00', 10);

-- ------------------------------------------------------------
-- INVITE (40 lignes) — FK vers MARIAGE et INVITE (récursif)
-- Les invités sans accompagnant sont insérés en premier
-- ------------------------------------------------------------
INSERT INTO INVITE (id_invite, nom, prenom, email, telephone, rsvp, id_invite_1, id_mariage) VALUES
-- Mariage 1
(1,  'Fontaine', 'Luc',      'luc.fontaine@mail.fr',      '0601010101', 'confirmé',   NULL, 1),
(2,  'Renaud',   'Claire',   'claire.renaud@mail.fr',     '0601010102', 'confirmé',   NULL, 1),
(3,  'Blanc',    'Hugo',     'hugo.blanc@mail.fr',        '0601010103', 'en attente', NULL, 1),
-- Mariage 2
(4,  'Clement',  'Alice',    'alice.clement@mail.fr',     '0602020201', 'confirmé',   NULL, 2),
(5,  'Perrin',   'Marc',     'marc.perrin@mail.fr',       '0602020202', 'refusé',     NULL, 2),
(6,  'Girard',   'Sandra',   'sandra.girard@mail.fr',     '0602020203', 'confirmé',   NULL, 2),
-- Mariage 3
(7,  'Morel',    'Victor',   'victor.morel@mail.fr',      '0603030301', 'confirmé',   NULL, 3),
(8,  'Faure',    'Inès',     'ines.faure@mail.fr',        '0603030302', 'en attente', NULL, 3),
(9,  'Petit',    'Loic',     'loic.petit@mail.fr',        '0603030303', 'confirmé',   NULL, 3),
-- Mariage 4
(10, 'Caron',    'Lisa',     'lisa.caron@mail.fr',        '0604040401', 'confirmé',   NULL, 4),
(11, 'Denis',    'Julien',   'julien.denis@mail.fr',      '0604040402', 'en attente', NULL, 4),
(12, 'Mercier',  'Amandine', 'amandine.mercier@mail.fr',  '0604040403', 'refusé',     NULL, 4),
-- Mariage 5
(13, 'Masson',   'Théo',     'theo.masson@mail.fr',       '0605050501', 'confirmé',   NULL, 5),
(14, 'Arnaud',   'Pauline',  'pauline.arnaud@mail.fr',    '0605050502', 'confirmé',   NULL, 5),
(15, 'Picard',   'Romain',   'romain.picard@mail.fr',     '0605050503', 'en attente', NULL, 5),
-- Mariage 6
(16, 'Gautier',  'Laura',    'laura.gautier@mail.fr',     '0606060601', 'confirmé',   NULL, 6),
(17, 'Dumont',   'Mathieu',  'mathieu.dumont@mail.fr',    '0606060602', 'refusé',     NULL, 6),
(18, 'Legrand',  'Sabine',   'sabine.legrand@mail.fr',    '0606060603', 'confirmé',   NULL, 6),
-- Mariage 7
(19, 'Vasseur',  'Florian',  'florian.vasseur@mail.fr',   '0607070701', 'confirmé',   NULL, 7),
(20, 'Guerin',   'Audrey',   'audrey.guerin@mail.fr',     '0607070702', 'en attente', NULL, 7),
(21, 'Jacquet',  'Simon',    'simon.jacquet@mail.fr',     '0607070703', 'confirmé',   NULL, 7),
-- Mariage 8
(22, 'Prevost',  'Océane',   'oceane.prevost@mail.fr',    '0608080801', 'confirmé',   NULL, 8),
(23, 'Tessier',  'Quentin',  'quentin.tessier@mail.fr',   '0608080802', 'refusé',     NULL, 8),
(24, 'Ferrand',  'Amélie',   'amelie.ferrand@mail.fr',    '0608080803', 'confirmé',   NULL, 8),
-- Mariage 9
(25, 'Pons',     'Adrien',   'adrien.pons@mail.fr',       '0609090901', 'confirmé',   NULL, 9),
(26, 'Riviere',  'Charlotte','charlotte.riviere@mail.fr', '0609090902', 'en attente', NULL, 9),
(27, 'Schmitt',  'Guillaume','guillaume.schmitt@mail.fr', '0609090903', 'confirmé',   NULL, 9),
-- Mariage 10
(28, 'Royer',    'Eva',      'eva.royer@mail.fr',         '0610101001', 'confirmé',   NULL, 10),
(29, 'Leclerc',  'Maxime',   'maxime.leclerc@mail.fr',    '0610101002', 'refusé',     NULL, 10),
(30, 'Allard',   'Jade',     'jade.allard@mail.fr',       '0610101003', 'en attente', NULL, 10),
-- Mariage 11
(31, 'Brun',     'Zoé',      'zoe.brun@mail.fr',          '0611111101', 'confirmé',   NULL, 11),
(32, 'Vidal',    'Enzo',     'enzo.vidal@mail.fr',        '0611111102', 'confirmé',   NULL, 11),
-- Mariage 12
(33, 'Lacombe',  'Inès',     'ines.lacombe@mail.fr',      '0612121201', 'en attente', NULL, 12),
(34, 'Aubert',   'Raphaël',  'raphael.aubert@mail.fr',    '0612121202', 'confirmé',   NULL, 12),
-- Mariage 13
(35, 'Barreau',  'Océane',   'oceane.barreau@mail.fr',    '0613131301', 'confirmé',   NULL, 13),
(36, 'Coulon',   'Axel',     'axel.coulon@mail.fr',       '0613131302', 'refusé',     NULL, 13),
-- Mariage 14
(37, 'Turpin',   'Yasmine',  'yasmine.turpin@mail.fr',    '0614141401', 'confirmé',   NULL, 14),
(38, 'Joubert',  'Dorian',   'dorian.joubert@mail.fr',    '0614141402', 'en attente', NULL, 14),
-- Mariage 15
(39, 'Valentin', 'Mélanie',  'melanie.valentin@mail.fr',  '0615151501', 'confirmé',   NULL, 15),
(40, 'Pelletier','Corentin', 'corentin.pelletier@mail.fr','0615151502', 'en attente', NULL, 15);

-- Mise à jour des accompagnants (association récursive)
UPDATE INVITE SET id_invite_1 = 1  WHERE id_invite = 2;
UPDATE INVITE SET id_invite_1 = 4  WHERE id_invite = 6;
UPDATE INVITE SET id_invite_1 = 7  WHERE id_invite = 9;
UPDATE INVITE SET id_invite_1 = 10 WHERE id_invite = 11;
UPDATE INVITE SET id_invite_1 = 13 WHERE id_invite = 14;
UPDATE INVITE SET id_invite_1 = 19 WHERE id_invite = 20;
UPDATE INVITE SET id_invite_1 = 25 WHERE id_invite = 26;
UPDATE INVITE SET id_invite_1 = 28 WHERE id_invite = 30;

-- ------------------------------------------------------------
-- AFFECTER (20 lignes) — FK vers MARIAGE et PRESTATAIRE
-- ------------------------------------------------------------
INSERT INTO affecter (id_mariage, id_prestataire, cout_negocie) VALUES
(1,  1,  1200.00),
(1,  2,  5000.00),
(1,  3,  2000.00),
(2,  1,   900.00),
(2,  5,   800.00),
(3,  2,  6000.00),
(3,  3,  2500.00),
(3,  4,  1500.00),
(4,  6,  1000.00),
(4,  7,  1200.00),
(5,  2,  5500.00),
(5,  8,  2000.00),
(6,  9,  1100.00),
(7,  10, 6500.00),
(7,  11, 2200.00),
(8,  5,   750.00),
(9,  1,  1300.00),
(9,  3,  2800.00),
(10, 12,  900.00),
(11, 7,  1400.00);

-- ------------------------------------------------------------
-- PLANIFIER (15 lignes) — FK vers MARIAGE, PRESTATAIRE, CRENEAU
-- ------------------------------------------------------------
INSERT INTO planifier (id_mariage, id_prestataire, id_creneau, description) VALUES
(1,  1,  2,  'Animation musicale soirée'),
(1,  2,  1,  'Service du repas de mariage'),
(1,  3,  1,  'Séance photo cérémonie'),
(2,  1,  4,  'DJ set cocktail'),
(2,  5,  3,  'Décoration florale salle'),
(3,  2,  6,  'Buffet et repas assis'),
(3,  3,  5,  'Photos cérémonie extérieure'),
(3,  4,  6,  'Captation vidéo complète'),
(4,  6,  7,  'Animation jeux invités'),
(4,  7,  8,  'Concert quatuor à cordes'),
(5,  2,  9,  'Cocktail et dîner'),
(5,  8,  10, 'Installation décoration'),
(6,  9,  11, 'DJ set soirée dansante'),
(7,  10, 14, 'Grand banquet'),
(7,  11, 13, 'Reportage photographique');
