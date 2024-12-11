-----------------------------requtes de base--------------------

SELECT pseudo, email, date_inscription FROM Membre;

SELECT titre, genre, studio_developpement FROM Jeu;


SELECT * FROM Tournoi WHERE nom_tournoi = 'nom du tpurnoi';

SELECT Membre.pseudo, jeu.titre
FROM Emprunter
JOIN Membre ON Emprunter.membre_id = Membre.id
JOIN jeu ON Emprunter.jeu_id = jeu.id
WHERE Emprunter.date_retour_reelle IS NULL;

----------------------------Requêtes avec Jointures---------------------
SELECT Membre.pseudo, Tournoi.nom_tournoi, Participer.rang_final
FROM Participer
JOIN Membre ON Participer.membre_id = Membre.id
JOIN Tournoi ON Participer.tournoi_id = Tournoi.id;


SELECT Membre.pseudo, Abonnement.type_abonnement
FROM Abonnement
JOIN Membre ON Abonnement.id_membre = Membre.id
WHERE Abonnement.type_abonnement = 'annuel';

SELECT Jeu.titre
FROM Emprunter
JOIN Membre ON Emprunter.membre_id = Membre.id
JOIN Jeu ON Emprunter.jeu_id = Jeu.id
WHERE Membre.pseudo = 'Pseudo du membre';

SELECT 
    Membre.pseudo, 
    Jeu.titre, 
    Jeu.studio_developpement, 
FROM Emprunter
JOIN Membre ON Emprunter.membre_id = Membre.id
JOIN Jeu ON Emprunter.jeu_id = Jeu.id;


SELECT 
    Membre.pseudo, 
    Abonnement.type_abonnement, 
FROM Membre
LEFT JOIN Abonnement ON Membre.id = Abonnement.id_membre;

-------------------------------------Requêtes avec Agrégation-------------------------------------

SELECT genre, COUNT(*) as nombre_jeux 
FROM Jeu 
GROUP BY genre;


SELECT Tournoi.nom_tournoi, COUNT(*) AS nb_participants
FROM Participer
JOIN Tournoi ON Participer.tournoi_id = Tournoi.id
GROUP BY Tournoi.nom_tournoi
ORDER BY total_participants DESC
LIMIT 1;

SELECT Membre.pseudo, COUNT(*) AS nb_emprunts
FROM Emprunter
JOIN Membre ON Emprunter.membre_ide = Membre.id
GROUP BY Membre.pseudo;
    


-------------------------------Requêtes avec Filtres et Tri------------------------------------------------   

SELECT titre, annee_sortie 
FROM Jeu 
WHERE annee_sortie > 2022 
ORDER BY titre;


SELECT Membre.pseudo
FROM Emprunter
JOIN Membre ON Emprunter.membre_id = Membre.id
WHERE Emprunter.date_retour_reelle IS NULL;


SELECT nom_tournoi 
FROM Tournoi 
WHERE date_tournoi BETWEEN '2024-12-15' AND '2024-12-31';


SELECT Membre.pseudo, COUNT(*) AS emprunts_actifs
FROM Emprunter
JOIN Membre ON Emprunter.membre_id = Membre.id
WHERE Emprunter.date_retour_reelle IS NULL
GROUP BY Membre.pseudo
HAVING emprunts_actifs > 1;