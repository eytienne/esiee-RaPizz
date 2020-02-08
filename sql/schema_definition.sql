-- produit
--

CREATE TYPE uniteIngredient AS ENUM ('gramme', 'unité', 'litre');

CREATE TABLE Ingredient (
  idIngredient SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL CONSTRAINT UQ_Ingredient_nom UNIQUE,
  unite uniteIngredient
);
CREATE TABLE Pizza (
  idPizza SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL CONSTRAINT UQ_Pizza_nom UNIQUE,
  prixDeBase NUMERIC(6, 2) NOT NULL
);
CREATE TABLE Composition (
  idPizza SERIAL CONSTRAINT FK_Composition_Pizza REFERENCES Pizza (idPizza),
  idIngredient SERIAL CONSTRAINT FK_Composition_Ingredient REFERENCES Ingredient (idIngredient),
  quantite REAL,
  CONSTRAINT PK_Composition PRIMARY KEY (idPizza, idIngredient)
);
CREATE TABLE TaillePizza (
  idTaillePizza SERIAL PRIMARY KEY,
  label VARCHAR(255) CONSTRAINT UQ_TaillePizza_label UNIQUE,
  coefficient REAL NOT NULL
);
-- rôles utilisateurs
--
CREATE TABLE Adresse (
  idAdresse SERIAL PRIMARY KEY,
  numero SMALLINT NOT NULL,
  voie VARCHAR(255) NOT NULL,
  codePostal CHAR(5) NOT NULL,
  ville VARCHAR(255) NOT NULL
);
CREATE TABLE Personne (
  idPersonne SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL,
  prenom VARCHAR(255) NOT NULL,
  dateNaissance DATE,
  idAdresse SERIAL CONSTRAINT FK_Personne_Adresse REFERENCES Adresse (idAdresse)
);
CREATE TABLE Gerant (
  idGerant SERIAL PRIMARY KEY,
  CONSTRAINT FK_Gerant_Personne FOREIGN KEY (idGerant) REFERENCES Personne (idPersonne)
);
CREATE TABLE Client (
  idClient SERIAL PRIMARY KEY,
  pizzasPourFidelite INTEGER NOT NULL DEFAULT 0,
  solde NUMERIC(6,2) NOT NULL DEFAULT 0,
  lockedSolde NUMERIC(6,2) NOT NULL DEFAULT 0,
  CONSTRAINT FK_Client_Personne FOREIGN KEY (idClient) REFERENCES Personne (idPersonne)
);
CREATE TABLE Livreur (
  idLivreur SERIAL PRIMARY KEY,
  CONSTRAINT FK_Livreur_Personne FOREIGN KEY (idLivreur) REFERENCES Personne (idPersonne)
);
-- logistique
--
CREATE TABLE History (
  idOperation SERIAL PRIMARY KEY,
  idClient SERIAL NOT NULL CONSTRAINT FK_History_Client REFERENCES Client (idClient),
  montant NUMERIC(6, 2) NOT NULL,
  dateOperation TIMESTAMP NOT NULL
);

CREATE TYPE typeDeVehicule AS ENUM ('voiture', 'moto');

CREATE TABLE Vehicule (
  idVehicule SERIAL PRIMARY KEY,
  immatriculation VARCHAR(12) UNIQUE,
  typeVehicule typeDeVehicule,
  CONSTRAINT CK_Vehicule_immatriculation_format CHECK (
    immatriculation ~ $$(^[a-zA-Z]{1,2}( |-)[0-9]{2,3}( |-)[a-zA-Z]{1,2}$|^[0-9]{1,4}( |-)[a-zA-Z]{1,3}( |-)[0-9a-zA-Z]{2,3}$)$$
  )
);

CREATE TABLE Commande (
  idCommande SERIAL PRIMARY KEY,
  idPizza SERIAL NOT NULL CONSTRAINT FK_Commande_Pizza REFERENCES Pizza (idPizza),
  idTaillePizza SERIAL NOT NULL CONSTRAINT FK_Commande_Taille REFERENCES TaillePizza (idTaillePizza),
  idClient SERIAL NOT NULL CONSTRAINT FK_Commande_Client REFERENCES Client (idClient),
  idLivreur SERIAL NOT NULL CONSTRAINT FK_Commande_Livreur REFERENCES Livreur (idLivreur),
  idVehicule SERIAL NOT NULL CONSTRAINT FK_Commande_Vehicule REFERENCES Vehicule (idVehicule),
  commandee TIMESTAMP,
  livree TIMESTAMP,
  offreFidelite BOOLEAN NOT NULL DEFAULT FALSE,
  prix NUMERIC(6,2)
);