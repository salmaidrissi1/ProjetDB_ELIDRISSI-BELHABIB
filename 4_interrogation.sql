

-- ============================================================
-- PARTIE 1 : PROJECTIONS, SÉLECTIONS, TRI, DISTINCT, LIKE, IN, BETWEEN
-- ============================================================

-- Q1 : Liste de tous les clients triés par nom puis prénom
-- Sophie consulte l'annuaire complet des clients de l'agence.
SELECT nom, prenom, email, telephone
FROM CLIENT
ORDER BY nom ASC, prenom ASC; 

-- Q2 : Mariages avec un budget compris entre 15 000 et 25 000 €
-- Sophie filtre les mariages de gamme intermédiaire pour un rapport budgétaire.
SELECT id_mariage, date_mariage, budget, statut
FROM MARIAGE
WHERE budget BETWEEN 15000 AND 25000
ORDER BY date_mariage;

-- Q3 : Prestataires de type DJ ou Photographe uniquement
-- Sophie cherche les prestataires artistiques pour proposer à un nouveau client.
SELECT nom, type_prestataire, email, telephone
FROM PRESTATAIRE
WHERE type_prestataire IN ('DJ', 'Photographe')
ORDER BY type_prestataire, nom;

-- Q4 : Invités confirmés triés par nom
-- Sophie prépare la liste des confirmés pour le plan de table.
SELECT nom, prenom, email, rsvp
FROM INVITE
WHERE rsvp = 'confirmé'
ORDER BY nom, prenom;

-- Q5 : Lieux distincts avec une capacité supérieure à 150 personnes
-- Sophie cherche de grandes salles pour un mariage avec beaucoup d'invités.
SELECT DISTINCT nom_lieu, adresse, capacite, prix_location
FROM LIEU
WHERE capacite > 150
ORDER BY capacite DESC;

-- Q6 : Clients dont le nom commence par 'M'
-- Sophie recherche rapidement des clients par initiale.
SELECT nom, prenom, email
FROM CLIENT
WHERE nom LIKE 'M%';


-- ============================================================
-- PARTIE 2 : FONCTIONS D'AGRÉGATION, GROUP BY, HAVING
-- ============================================================

-- Q7 : Budget moyen, minimum, maximum et total de tous les mariages
-- Sophie produit un résumé financier global pour la direction.
SELECT
    ROUND(AVG(budget), 2) AS budget_moyen,
    MIN(budget)           AS budget_min,
    MAX(budget)           AS budget_max,
    SUM(budget)           AS budget_total
FROM MARIAGE;

-- Q8 : Nombre de mariages par lieu, trié du plus actif au moins actif
-- Sophie identifie les lieux les plus populaires de l'agence.
SELECT l.nom_lieu, COUNT(m.id_mariage) AS nb_mariages
FROM LIEU l
JOIN MARIAGE m ON l.id_lieu = m.id_lieu
GROUP BY l.id_lieu, l.nom_lieu
ORDER BY nb_mariages DESC;

-- Q9 : Nombre d'invités par statut RSVP
-- Sophie connaît en un coup d'œil l'état global des réponses.
SELECT rsvp, COUNT(*) AS nb_invites
FROM INVITE
GROUP BY rsvp
ORDER BY nb_invites DESC;

-- Q10 : Prestataires affectés à plus d'un mariage
-- Sophie identifie les prestataires les plus sollicités.
SELECT p.nom, p.type_prestataire, COUNT(a.id_mariage) AS nb_mariages
FROM PRESTATAIRE p
JOIN affecter a ON p.id_prestataire = a.id_prestataire
GROUP BY p.id_prestataire, p.nom, p.type_prestataire
HAVING COUNT(a.id_mariage) > 1
ORDER BY nb_mariages DESC;

-- Q11 : Coût total des prestataires par mariage et budget restant
-- Sophie compare les dépenses prestataires de chaque mariage.
SELECT m.id_mariage, m.date_mariage,
       SUM(a.cout_negocie)            AS total_prestataires,
       m.budget,
       m.budget - SUM(a.cout_negocie) AS budget_restant
FROM MARIAGE m
JOIN affecter a ON m.id_mariage = a.id_mariage
GROUP BY m.id_mariage, m.date_mariage, m.budget
ORDER BY total_prestataires DESC;

-- Q12 : Coût moyen négocié par type de prestataire
-- Sophie s'appuie sur ces données pour négocier les futurs contrats.
SELECT p.type_prestataire,
       COUNT(a.id_prestataire)        AS nb_contrats,
       ROUND(AVG(a.cout_negocie), 2)  AS cout_moyen,
       MIN(a.cout_negocie)            AS cout_min,
       MAX(a.cout_negocie)            AS cout_max
FROM PRESTATAIRE p
JOIN affecter a ON p.id_prestataire = a.id_prestataire
GROUP BY p.type_prestataire
ORDER BY cout_moyen DESC;


-- ============================================================
-- PARTIE 3 : JOINTURES (internes, externes, simples, multiples)
-- ============================================================

-- Q13 : Liste des mariages avec le nom du client et le nom du lieu
-- Sophie consulte la vue d'ensemble de tous les événements à venir.
SELECT m.id_mariage, m.date_mariage, m.budget, m.statut,
       c.nom AS client_nom, c.prenom AS client_prenom,
       l.nom_lieu, l.adresse
FROM MARIAGE m
JOIN CLIENT c ON m.id_client = c.id_client
JOIN LIEU   l ON m.id_lieu   = l.id_lieu
ORDER BY m.date_mariage;

-- Q14 : Prestataires affectés à chaque mariage avec leur coût
-- Sophie vérifie qui intervient sur quel mariage.
SELECT m.id_mariage, m.date_mariage,
       p.nom AS prestataire, p.type_prestataire,
       a.cout_negocie
FROM affecter a
JOIN MARIAGE     m ON a.id_mariage     = m.id_mariage
JOIN PRESTATAIRE p ON a.id_prestataire = p.id_prestataire
ORDER BY m.date_mariage, p.type_prestataire;

-- Q15 : Invités avec le nom de leur accompagnant (auto-jointure)
-- Sophie visualise les paires d'invités pour le plan de table.
SELECT i.nom AS invite_nom, i.prenom AS invite_prenom,
       i.rsvp,
       a.nom AS accompagnant_nom, a.prenom AS accompagnant_prenom
FROM INVITE i
LEFT JOIN INVITE a ON i.id_invite_1 = a.id_invite
ORDER BY i.id_mariage, i.nom;

-- Q16 : Lieux qui n'ont encore aucun mariage réservé
-- Sophie identifie les lieux disponibles à proposer à de nouveaux clients.
SELECT l.nom_lieu, l.adresse, l.capacite, l.prix_location
FROM LIEU l
LEFT JOIN MARIAGE m ON l.id_lieu = m.id_lieu
WHERE m.id_mariage IS NULL;

-- Q17 : Détail complet d'une planification : prestataire, mariage, créneau
-- Sophie prépare le conducteur de journée pour chaque mariage.
SELECT m.date_mariage,
       p.nom AS prestataire, p.type_prestataire,
       cr.heure_debut, cr.heure_fin,
       pl.description
FROM planifier pl
JOIN PRESTATAIRE p  ON pl.id_prestataire = p.id_prestataire
JOIN MARIAGE     m  ON pl.id_mariage     = m.id_mariage
JOIN CRENEAU     cr ON pl.id_creneau     = cr.id_creneau
ORDER BY m.date_mariage, cr.heure_debut;


-- ============================================================
-- PARTIE 4 : REQUÊTES IMBRIQUÉES — IN, NOT IN, EXISTS, NOT EXISTS, ANY, ALL
-- ============================================================

-- Q18 : Mariages qui ont au moins un prestataire de type 'Photographe' (IN)
-- Sophie vérifie que la couverture photo est bien assurée.
SELECT id_mariage, date_mariage, budget
FROM MARIAGE
WHERE id_mariage IN (
    SELECT a.id_mariage
    FROM affecter a
    JOIN PRESTATAIRE p ON a.id_prestataire = p.id_prestataire
    WHERE p.type_prestataire = 'Photographe'
);

-- Q19 : Mariages sans aucun prestataire affecté (NOT IN)
-- Sophie repère les mariages qui nécessitent encore une organisation.
SELECT id_mariage, date_mariage, statut
FROM MARIAGE
WHERE id_mariage NOT IN (
    SELECT DISTINCT id_mariage FROM affecter
);

-- Q20 : Invités dont le mariage se déroule dans un lieu de capacité > 200 (EXISTS)
-- Sophie prépare les communications pour les grands mariages.
SELECT i.nom, i.prenom, i.email, i.rsvp
FROM INVITE i
WHERE EXISTS (
    SELECT 1
    FROM MARIAGE m
    JOIN LIEU l ON m.id_lieu = l.id_lieu
    WHERE m.id_mariage = i.id_mariage
      AND l.capacite > 200
);

-- Q21 : Prestataires jamais planifiés sur un créneau (NOT EXISTS)
-- Sophie détecte les prestataires affectés sans créneau encore défini.
SELECT p.nom, p.type_prestataire
FROM PRESTATAIRE p
WHERE NOT EXISTS (
    SELECT 1
    FROM planifier pl
    WHERE pl.id_prestataire = p.id_prestataire
);

-- Q22 : Mariages dont le budget dépasse TOUS les mariages du lieu 6 (ALL)
-- Sophie compare les grands budgets par rapport aux mariages d'une petite salle.
SELECT id_mariage, date_mariage, budget
FROM MARIAGE
WHERE budget > ALL (
    SELECT budget FROM MARIAGE WHERE id_lieu = 6
)
AND id_lieu <> 6;

-- Q23 : Mariages dont le budget dépasse AU MOINS UN mariage du lieu 1 (ANY)
-- Sophie évalue les mariages comparables au lieu le plus prestigieux.
SELECT id_mariage, date_mariage, budget
FROM MARIAGE 
WHERE budget > ANY (
    SELECT budget FROM MARIAGE WHERE id_lieu = 1
)
AND id_lieu <> 1;
