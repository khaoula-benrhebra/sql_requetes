CREATE DATABASE jeux_video;

use jeux_video;

CREATE TABLE Membre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pseudo VARCHAR(50) UNIQUE,
    email VARCHAR(60),
    date_inscription DATE
);


ALTER TABLE Membre ADD CONSTRAINT UNIQUE (email);


CREATE TABLE Jeu (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    titre VARCHAR(100) UNIQUE,
    studio_developpement VARCHAR(100),
    annee_sortie YEAR,
    genre VARCHAR(50),
    multijoueur BOOLEAN
);



CREATE TABLE Emprunter (
  id INT AUTO_INCREMENT PRIMARY KEY,
  membre_id INT,
  jeu_id INT,
  date_emprunt DATE,
  date_retour_prevue DATE,
  date_retour_reelle DATE,
  FOREIGN KEY (membre_id) REFERENCES Membre(id),
  FOREIGN KEY (jeu_id) REFERENCES Jeu(id)
);



CREATE TABLE Tournoi (
    id INT PRIMARY KEY AUTO_INCREMENT,
    jeu_id INT ,
    nom_tournoi VARCHAR(100),
    date_tournoi DATE,
    recompenses VARCHAR(200),
     FOREIGN KEY (jeu_id) REFERENCES jeu(id)
);


CREATE TABLE Participer (
  id INT PRIMARY KEY AUTO_INCREMENT,
  membre_id INT,
  tournoi_id INT,
  score INT,
  rang_final INT,
  FOREIGN KEY (membre_id) REFERENCES Membre(id),
  FOREIGN KEY (tournoi_id) REFERENCES Tournoi(id)
);



CREATE TABLE Abonnement (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_abonnement ENUM('mensuel', 'annuel') ,
    date_debut DATE,
    date_fin DATE,
    id_membre INT,
    FOREIGN KEY (id_membre) REFERENCES Membre(id)
);



INSERT INTO Membre (pseudo, email, date_inscription)
VALUES
('PlayerOne', 'player1@example.com', '2024-01-15'),
('GameMaster', 'gm@example.com', '2022-02-10'),
('SpeedyGamer', 'speedy@example.com', '2023-03-05'),
('PuzzleKing', 'puzzleking@example.com', '2024-04-01'),
('ArcadeQueen', 'arcadequeen@example.com', '2024-05-20'),
('RPGlover', 'rpglove@example.com', '2023-06-15'),
('ShooterPro', 'shooterpro@example.com', '2024-07-30'),
('RetroFan', 'retrofan@example.com', '2024-08-18'),
('SimMaster', 'simmaster@example.com', '2023-09-05'),
('AdventureSeeker', 'adventureseeker@example.com', '2024-10-12');



INSERT INTO Jeu (titre, studio_developpement, annee_sortie, genre, multijoueur)
VALUES
('Space Adventures', 'Galaxy Studios', 2023, 'Aventure', TRUE),
('Puzzle Quest', 'Mind Games Inc.', 2022, 'Puzzle', FALSE),
('RPG World', 'Fantasy Co.', 2021, 'RPG', TRUE),
('Shooter Elite', 'WarZone Inc.', 2023, 'Action', TRUE),
('Retro Revival', 'Oldies But Goodies', 2019, 'Platformer', FALSE),
('SimLife', 'LifeSim Studios', 2020, 'Simulation', FALSE),
('Arcade Frenzy', 'Arcadia Labs', 2022, 'Arcade', TRUE),
('Sports Master', 'ProSports Devs', 2023, 'Sports', TRUE),
('Mystery Mansion', 'Clue Studios', 2023, 'Mystère', FALSE),
('Zombie Apocalypse', 'Horror Games Ltd.', 2024, 'Horreur', TRUE);


INSERT INTO Emprunter (membre_id, jeu_id, date_emprunt, date_retour_prevue, date_retour_reelle)
VALUES
(1, 1, '2024-12-01', '2024-12-10', '2024-12-09'),
(2, 3, '2024-12-02', '2024-12-12', NULL),
(3, 2, '2024-12-03', '2024-12-13', NULL),
(4, 5, '2024-12-04', '2024-12-14', '2024-12-15'),
(5, 4, '2024-12-05', '2024-12-15', NULL),
(6, 6, '2024-12-06', '2024-12-16', NULL),
(7, 8, '2024-12-07', '2024-12-17', NULL),
(8, 7, '2024-12-08', '2024-12-18', '2024-12-19'),
(9, 9, '2024-12-09', '2024-12-19', NULL),
(10, 10, '2024-12-10', '2024-12-20', '2024-12-18');


INSERT INTO Tournoi (jeu_id, nom_tournoi, date_tournoi, recompenses)
VALUES
(1, 'Space Championship', '2024-12-15', '500€ et un trophée'),
(2, 'Puzzle League', '2024-12-18', '300€ et une médaille'),
(3, 'RPG Masters', '2024-12-20', '1,000€ et une statuette'),
(4, 'Shooter Cup', '2024-12-22', '800€ et un casque gaming'),
(5, 'Retro Battle', '2024-12-25', '100€ et un jeu rétro'),
(6, 'Sim Championship', '2024-12-30', 'Un abonnement d un an à SimLife'),
(7, 'Arcade Legends', '2024-12-28', 'Un bon cadeau de 200€'),
(8, 'Sports Frenzy', '2024-12-29', 'Un kit de sport'),
(9, 'Mystery Challenge', '2024-12-31', 'Un coffret de jeux de mystère'),
(10, 'Zombie Survival', '2025-01-01', 'Un set gaming complet');


INSERT INTO Participer (membre_id, tournoi_id, score, rang_final)
VALUES
(1, 1, 85, 2),
(2, 2, 95, 1),
(3, 3, 75, 4),
(4, 4, 80, 3),
(5, 5, 90, 2),
(6, 6, 85, 1),
(7, 7, 70, 4),
(8, 8, 60, 5),
(9, 9, 88, 3),
(10, 10, 92, 1);



INSERT INTO Abonnement (type_abonnement, date_debut, date_fin, id_membre)
VALUES
('mensuel', '2024-11-01', '2024-12-01', 1),
('annuel', '2024-01-01', '2024-12-31', 2),
('mensuel', '2024-11-05', '2024-12-05', 3),
('annuel', '2024-02-01', '2025-01-31', 4),
('mensuel', '2024-11-10', '2024-12-10', 5),
('annuel', '2024-03-01', '2025-02-28', 6),
('mensuel', '2024-11-15', '2024-12-15', 7),
('annuel', '2024-04-01', '2025-03-31', 8),
('mensuel', '2024-11-20', '2024-12-20', 9),
('annuel', '2024-05-01', '2025-04-30', 10);

