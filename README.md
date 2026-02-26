# Mini-Projet Base de Données — Wedding Planner (Partie 1)


# 1) Présentation du domaine

Ce projet concerne le domaine de l’organisation de mariages (*Wedding Planning*) 
Une agence de wedding planner accompagne des couples dans la planification, l’organisation et la gestion complète de leur mariage.

L’agence est responsable de plusieurs aspects importants :

- la gestion des clients (les couples),
- l’organisation des mariages,
- la réservation des lieux de réception,
- la gestion des prestataires (DJ, traiteur, photographe, etc.),
- la gestion des invités,
- la planification des prestations,
- la gestion des créneaux horaires,
- le suivi des coûts et du budget.

Afin de gérer efficacement toutes ces informations, il est nécessaire de concevoir une base de données structurée.

La conception de cette base de données est réalisée en utilisant la méthode MERISE, à travers la création d’un Modèle Conceptuel de Données (MCD).



# 2) Objectif du mini-projet

L’objectif de ce mini-projet est de concevoir la structure d’une base de données pour une agence de wedding planner.

Plus précisément, ce projet consiste à :

- analyser les besoins du système,
- identifier les données à stocker,
- définir les règles métier,
- construire un Modèle Conceptuel de Données (MCD),
- préparer la future implémentation dans une base de données relationnelle.

Le modèle respectera les règles de normalisation (3ème forme normale) afin d’éviter les redondances et garantir la cohérence des données.



# 3) Prompt final utilisé

Le prompt utilisé pour générer les règles métier et le dictionnaire de données est disponible dans le fichier :
[Prompt_Projet_Wedding.txt](Prompt_Projet_Wedding.txt)

# 4) Règles métier

Les règles métier suivantes ont été identifiées :

- Un client peut organiser 0, 1 ou plusieurs mariages.
- Un mariage est organisé par un seul client.
- Un mariage se déroule dans un seul lieu.
- Un lieu peut accueillir 0, 1 ou plusieurs mariages.
- Un mariage peut faire appel à 0, 1 ou plusieurs prestataires.
- Un prestataire peut intervenir dans 0, 1 ou plusieurs mariages.
- Pour chaque couple (mariage, prestataire), un coût négocié est défini.
- Un mariage possède 1 ou plusieurs invités.
- Un invité appartient à un seul mariage.
- Chaque invité possède un statut RSVP (confirmé, refusé ou en attente).
- Un invité peut accompagner un autre invité (association récursive).
- Chaque mariage possède une date unique.
- Chaque mariage possède un budget.
- Chaque prestataire possède un type de prestation (DJ, traiteur, photographe, etc.).
- Chaque lieu possède une capacité maximale.
- Un mariage possède 1 ou plusieurs créneaux horaires.
- Un créneau horaire appartient à un seul mariage.
- Un prestataire peut être planifié sur un créneau horaire pour un mariage donné.
 
  # 5) Dictionnaire de données
Le tableau suivant présente le dictionnaire de données du système Wedding Planner :
| Entité      | Nom de la donnée | Signification                               | Type    | Taille |
| ----------- | ---------------- | ------------------------------------------- | ------- | ------ |
| CLIENT      | id_client        | Identifiant unique du client                | Entier  | 11     |
| CLIENT      | nom              | Nom du client                               | Texte   | 50     |
| CLIENT      | prenom           | Prénom du client                            | Texte   | 50     |
| CLIENT      | email            | Adresse email du client                     | Texte   | 100    |
| CLIENT      | telephone        | Numéro de téléphone du client               | Texte   | 20     |
| MARIAGE     | id_mariage       | Identifiant unique du mariage               | Entier  | 11     |
| MARIAGE     | date_mariage     | Date du mariage                             | Date    | —      |
| MARIAGE     | budget           | Budget du mariage                           | Décimal | 10,2   |
| MARIAGE     | statut           | Statut du mariage (prévu, terminé, etc.)    | Texte   | 20     |
| LIEU        | id_lieu          | Identifiant unique du lieu                  | Entier  | 11     |
| LIEU        | nom_lieu         | Nom du lieu                                 | Texte   | 100    |
| LIEU        | adresse          | Adresse du lieu                             | Texte   | 150    |
| LIEU        | capacite         | Capacité maximale du lieu                   | Entier  | 11     |
| LIEU        | prix_location    | Prix de location du lieu                    | Décimal | 10,2   |
| PRESTATAIRE | id_prestataire   | Identifiant unique du prestataire           | Entier  | 11     |
| PRESTATAIRE | nom              | Nom du prestataire                          | Texte   | 100    |
| PRESTATAIRE | type_prestataire | Type de prestation (DJ, traiteur, etc.)     | Texte   | 50     |
| PRESTATAIRE | email            | Adresse email du prestataire                | Texte   | 100    |
| PRESTATAIRE | telephone        | Numéro de téléphone du prestataire          | Texte   | 20     |
| INVITE      | id_invite        | Identifiant unique de l’invité              | Entier  | 11     |
| INVITE      | nom              | Nom de l’invité                             | Texte   | 50     |
| INVITE      | prenom           | Prénom de l’invité                          | Texte   | 50     |
| INVITE      | email            | Adresse email de l’invité                   | Texte   | 100    |
| INVITE      | telephone        | Numéro de téléphone de l’invité             | Texte   | 20     |
| INVITE      | rsvp             | Statut de confirmation de présence          | Texte   | 20     |
| CRENEAU     | id_creneau       | Identifiant unique du créneau               | Entier  | 11     |
| CRENEAU     | heure_debut      | Heure de début du créneau                   | Heure   | —      |
| CRENEAU     | heure_fin        | Heure de fin du créneau                     | Heure   | —      |
| AFFECTER    | cout_negocie     | Coût négocié du prestataire pour un mariage | Décimal | 10,2   |
| PLANIFIER   | description      | Description de la prestation planifiée      | Texte   | 150    |

# 6) Modèle Conceptuel de Données (MCD)

Le Modèle Conceptuel de Données a été réalisé avec le logiciel Looping en utilisant la méthode MERISE.
Il contient :
- les entités principales,
- les associations,
- une association récursive,
- une association n-aire,
- les identifiants,
- les attributs,
- les cardinalités.

Image du MCD:

![MCD](mcd.png)

# 7) Outils utilisés
Les outils suivants ont été utilisés :

- Looping (modélisation MERISE)
- GitHub (gestion du projet)
- Intelligence Artificielle Générative (ChatGPT)

   # 8) Fichiers fournis
Le dépôt contient les fichiers suivants :
- Mini-Projet_Partie1.zip  
   Archive contenant les fichiers source du projet.
 Prompt_Projet_Wedding.txt
   Prompt utilisé pour générer les règles métier et le dictionnaire de données.
- wedding_planner.loo  
  Fichier source Looping contenant le Modèle Conceptuel de Donnée
- mcd_wedding_planner.png
   Image du Modèle Conceptuel de Données réalisée avec Looping.
- README.md
   Documentation complète du projet.

  # 10) Conclusion

  Ce projet a permis d’appliquer la méthode MERISE afin de concevoir le Modèle Conceptuel de Données d’un système d’information dédié à la gestion des mariages pour une agence de wedding planner.
  L’analyse des besoins a permis d’identifier les entités principales du système, les relations entre elles ainsi que les règles métier associées. Un dictionnaire de données structuré a également été défini afin de préparer la conception de la base de données relationnelle.
  Le Modèle Conceptuel de Données réalisé constitue une étape essentielle dans le processus de conception d’un système d’information. Il servira de base pour les prochaines étapes du projet, notamment la création du Modèle Logique de Données (MLD) et l’implémentation de la base de données dans un système de gestion de bases de données relationnelles tel que MySQL.
