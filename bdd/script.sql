CREATE DATABASE biblio;

USE biblio;

-- Table des auteurs
CREATE TABLE auteur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Table des livres
CREATE TABLE livre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    nbpages INT,
    FOREIGN KEY (auteur_id) REFERENCES auteur(id),
    FOREIGN KEY (categorie_id) REFERENCES categorie(id)
);

-- Table des catégories
CREATE TABLE categorie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(255) NOT NULL
);

/*

le bon:
SI chaque tâche doit obligatoirement avoir un type (type_id NOT NULL).
type 1,1 ------------- Associé ------------- 1,N tache




si une tâche peut exister sans type (type_id NULL autorisé).
type 1,1 ------------- Associé ------------- 0,N tache

*/



#ajout type 
INSERT INTO type(libelle) VALUES ("sport");
INSERT INTO type(libelle) VALUES ("ecole");
INSERT INTO type(libelle) VALUES ("menage");
INSERT INTO type(libelle) VALUES ("course");


#requete select
select  tache.titre, tache.date_creation, type.libelle from tache, type where type_id = type.id;
#requete select par ordre ascendant 
select  tache.titre, tache.date_creation, type.libelle from tache, type where type_id = type.id ORDER by date_creation ASC;
#requete select par ordre descendant
select  tache.titre, tache.date_creation, type.libelle from tache, type where type_id = type.id ORDER by date_creation DESC;


#nombre de tache qui a le type sport
SELECT COUNT(*)
FROM tache
JOIN type ON tache.type_id = type.id
WHERE type.libelle = 'sport';

#nombre de tache qui a le type course
SELECT COUNT(*)
FROM tache
JOIN type ON tache.type_id = type.id
WHERE type.libelle = 'course';

#nombre de tache qui a le type ecole
SELECT COUNT(*)
FROM tache
JOIN type ON tache.type_id = type.id
WHERE type.libelle = 'ecole';

#nombre de tache qui a le type menage
SELECT COUNT(*)
FROM tache
JOIN type ON tache.type_id = type.id
WHERE type.libelle = 'menage';