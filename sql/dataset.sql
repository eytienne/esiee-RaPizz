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
    ('naine', 0.66),
    ('humaine', 1),
    ('ogresse',1.33);

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

INSERT INTO Client(idClient)
VALUES
    (1),
    (2);

INSERT INTO Gerant(idGerant)
VALUES
    (3);

INSERT INTO Livreur(idLivreur)
VALUES
    (4);

INSERT INTO Vehicule (immatriculation, typeVehicule)
VALUES 
    ('AA-000-BB', 'voiture');
