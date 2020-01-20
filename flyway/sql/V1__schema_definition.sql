-- produit
--
CREATE Ingredient (
  idIngredient SERIAL PRIMARY KEY,
  nom VARCHAR(255) CONSTRAINT UQ_Ingredient_nom UNIQUE,
  unite VARCHAR(32),
);
CREATE Pizza (
  idPizza SERIAL PRIMARY KEY,
  nom VARCHAR(255) CONSTRAINT UQ_Ingredient_nom UNIQUE,
  prixDeBase NUMERIC(6, 2)
);
CREATE Composition (
  idPizza SERIAL CONSTRAINT FK_Composition_Pizza REFERENCES Pizza (idPizza),
  idIngredient SERIAL CONSTRAINT FK_Composition_Ingredient REFERENCES Ingredient (idIngredient),
  quantite SMALLINT,
  CONSTRAINT PK_Composition PRIMARY KEY (idPizza, idIngredient)
);
CREATE TaillePizza (
  label VARCHAR(255) PRIMARY KEY,
  coefficient REAL
);
-- rôles utilisateurs
--
CREATE Adresse (
  idAdresse SERIAL PRIMARY KEY,
  numero SMALLINT,
  voie VARCHAR(255),
  codePostal CHAR(5),
  ville VARCHAR(255)
);
CREATE Personne (
  idPersonne SERIAL PRIMARY KEY,
  nom VARCHAR(255),
  prenom VARCHAR(255),
  dateNaissance DATE,
  idAdresse SERIAL CONSTRAINT FK_Personne_Adresse REFERENCES Adresse (idAdresse)
);
CREATE Gerant (
  idGerant SERIAL PRIMARY KEY,
  CONSTRAINT FK_Gerant_Personne REFERENCES Personne (idPersonne)
);
CREATE Client (
  idClient SERIAL PRIMARY KEY,
  CONSTRAINT FK_Client_Personne REFERENCES Personne (idPersonne)
);
CREATE Livreur (
  idLivreur SERIAL PRIMARY KEY,
  CONSTRAINT FK_Livreur_Personne REFERENCES Personne (idPersonne)
);
-- logistique
--
CREATE History (
  idOperation SERIAL PRIMARY KEY,
  idClient SERIAL CONSTRAINT FK_History_Client REFERENCES Client (idClient),
  montant NUMERIC(6, 2),
  dateOperation DATE
);
CREATE Vehicule (
  immatriculation VARCHAR(12),
  CONSTRAINT CK_Vehicule_immatriculation_format SIMILAR TO '(^[a-z]{1,2}( |-)[0-9]{2,3}( |-)[a-z]{1,2}$|^[0-9]{1,4}( |-)[a-z]{1,3}( |-)[0-9a-z]{2,3}$)'
);
CREATE Commande (
  idCommande SERIAL PRIMARY KEY,
  idPizza SERIAL CONSTRAINT FK_Commande_Pizza REFERENCES Pizza (idPizza),
  label VARCAHR(255) CONSTRAINT FK_Commande_Taille REFERENCES TaillePizza (label),
  idClient SERIAL CONSTRAINT FK_Commande_Client REFERENCES Client (idClient),
  idLivreur SERIAL CONSTRAINT FK_Commande_Livreur REFERENCES Livreur (idLivreur),
  idVehicule SERIAL CONSTRAINT FK_Commande_Vehicule REFERENCES Vehicule (idVehicule),
  commandee TIMESTAMP,
  livree TIMESTAMP
);
SELECT
  idCommande,
  CASE
    WHEN (livree - commandee) > 60 * 30 * 1000 THEN 0
    WHEN ...
    ELSE p.prixDeBase * tp.coefficient
  END
from Commande c
INNER JOIN Pizza p USING(idPizza)
INNER JOIN TaillePizza tp USING(label)
where
  idCommande = ?;