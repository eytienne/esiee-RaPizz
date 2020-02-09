INSERT INTO Ingredient (nom, unite)
VALUES
  ('buche de chèvre', 'gramme'),
  ('miel', 'litre'),
  ('sauce tomate', 'litre'),
  ('chorizo', 'gramme'),
  ('oeuf', 'unité');
  
INSERT INTO Pizza (nom, prixDeBase)
VALUES
  ('Chèvre-miel', 10),
  ('Calzone', 12),
  ('Surprise', 9);

INSERT INTO TaillePizza (label, coefficient)
VALUES
    ('naine', 2./3),
    ('humaine', 1),
    ('ogresse', 4./3);

INSERT INTO Composition (idPizza, idIngredient, quantite)
VALUES
  (1, 1, 100),
  (1, 2, 0.01),
  (2, 3, 0.1),
  (2, 4, 30),
  (2, 5, 1);
  
INSERT INTO Adresse(numero, voie, codePostal, ville)
VALUES
    (1, 'rue Jean d''Zay', '78500', 'Limay'),
    (2, 'rue Jean d''Zay', '78500', 'Limay'),
    (3, 'rue Jean d''Zay', '78500', 'Limay'),
    (4, 'rue Jean d''Zay', '78500', 'Limay');

INSERT INTO Personne(nom, prenom, dateNaissance, idAdresse)
VALUES
    ('Henri', 'Charles', '1999-01-01', 1),
    ('Abcd', 'Etienne', '1999-01-01', 2),
    ('Boss', 'Hugo', '1999-01-01', 3),
    ('Himmler', 'Adolf', '1999-01-01', 4);

INSERT INTO Client(idClient, pizzasPourFidelite, solde, lockedSolde)
VALUES
    (1, 8, 20, 0),
    (2, 0, 0, 0);

INSERT INTO Gerant(idGerant)
VALUES
    (3);

INSERT INTO Livreur(idLivreur)
VALUES
    (4);

INSERT INTO Vehicule (immatriculation, typeVehicule)
VALUES 
    ('AA-000-BB', 'voiture'),
    ('YY-123-ZZ', 'moto'),
    ('RB-777-RB', 'moto');

SELECT * FROM Pizza;

SELECT '9th';

INSERT INTO Commande(
        idPizza, idTaillePizza, idClient, 
        idLivreur, idVehicule, 
        commandee, livree, offreFidelite
    )
VALUES 
    (1, 3, 1, 4, 1, 
    '2020-01-01 15:00:00.000', '2020-01-01 15:25:00.000', FALSE);
SELECT * FROM Commande WHERE idClient = 1;
SELECT * FROM Client WHERE idClient = 1;
SELECT * FROM History WHERE idClient = 1;


SELECT '10th';

INSERT INTO Commande(
        idPizza, idTaillePizza, idClient, 
        idLivreur, idVehicule, 
        commandee, livree, offreFidelite
    )
VALUES
    (1, 1, 1, 4, 1, 
    '2020-01-02 16:00:00.000', '2020-01-02 16:35:00.000', FALSE);
SELECT * FROM Commande WHERE idClient = 1;
SELECT * FROM Client WHERE idClient = 1;
SELECT * FROM History WHERE idClient = 1;


SELECT 'given';

INSERT INTO Commande(
        idPizza, idTaillePizza, idClient, 
        idLivreur, idVehicule, 
        commandee, livree, offreFidelite
    )
VALUES
    (1, 2, 1, 4, 1, 
    '2020-01-02 17:00:00.000', '2020-01-02 17:15:00.000', FALSE);
SELECT * FROM Commande WHERE idClient = 1;
SELECT * FROM Client WHERE idClient = 1;
SELECT * FROM History WHERE idClient = 1;


SELECT 'refused';

INSERT INTO Commande(
        idPizza, idTaillePizza, idClient, 
        idLivreur, idVehicule, 
        commandee, livree, offreFidelite
    )
VALUES
    (1, 2, 1, 4, 1, 
    '2020-01-02 18:00:00.000', '2020-01-02 18:15:00.000', FALSE);
SELECT * FROM Commande WHERE idClient = 1;
SELECT * FROM Client WHERE idClient = 1;
SELECT * FROM History WHERE idClient = 1;


SELECT '1st';

UPDATE Client SET solde = 20 WHERE idClient = 1;

INSERT INTO Commande(
        idPizza, idTaillePizza, idClient, 
        idLivreur, idVehicule, 
        commandee, livree, offreFidelite
    )
VALUES
    (1, 2, 1, 4, 1, 
    '2020-01-02 19:00:00.000', '2020-01-02 18:19:00.000', FALSE);
SELECT * FROM Commande WHERE idClient = 1;
SELECT * FROM Client WHERE idClient = 1;
SELECT * FROM History WHERE idClient = 1;

UPDATE Client set solde = 30 where idclient = 2;
INSERT INTO Commande(
        idPizza, idTaillePizza, idClient, 
        idLivreur, idVehicule, 
        commandee, livree, offreFidelite
    )
VALUES
    (1, 2, 2, 4, 1, 
    '2020-01-02 19:00:00.000', '2020-01-02 18:19:00.000', FALSE);