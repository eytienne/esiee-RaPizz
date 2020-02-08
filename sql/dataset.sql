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
  ('Calzone', 12);

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
    (1, 8, 20, 20),
    (2, 0, 0, 0);

INSERT INTO Gerant(idGerant)
VALUES
    (3);

INSERT INTO Livreur(idLivreur)
VALUES
    (4);

INSERT INTO Vehicule (immatriculation, typeVehicule)
VALUES 
    ('AA-000-BB', 'voiture');

SELECT * FROM Pizza;


INSERT INTO Commande(
        idPizza, label, idClient, 
        idLivreur, idVehicule, 
        commandee, livree, offreFidelite
    )
VALUES 
    (1, 'ogresse', 1, 4, 1, 
    '2020-01-01 15:00:00.000', '2020-01-01 15:25:00.000', FALSE);
SELECT * FROM Commande WHERE idClient = 1;
SELECT * FROM Client WHERE idClient = 1;
SELECT * FROM History WHERE idClient = 1;

INSERT INTO Commande(
        idPizza, label, idClient, 
        idLivreur, idVehicule, 
        commandee, livree, offreFidelite
    )
VALUES
    (1, 'naine', 1, 4, 1, 
    '2020-01-02 15:00:00.000', '2020-01-02 15:35:00.000', FALSE);
SELECT * FROM Commande WHERE idClient = 1;
SELECT * FROM Client WHERE idClient = 1;
SELECT * FROM History WHERE idClient = 1;


INSERT INTO Commande(
        idPizza, label, idClient, 
        idLivreur, idVehicule, 
        commandee, livree, offreFidelite
    )
VALUES
    (1, 'humaine', 1, 4, 1, 
    '2020-01-02 15:00:00.000', '2020-01-02 15:15:00.000', FALSE);
SELECT * FROM Commande WHERE idClient = 1;
SELECT * FROM Client WHERE idClient = 1;
SELECT * FROM History WHERE idClient = 1;
