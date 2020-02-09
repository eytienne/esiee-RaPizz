-- Menu

CREATE OR REPLACE VIEW Menu AS
SELECT p.nom, p.prixDeBase, array_agg(i.nom) as ingredients
FROM Pizza p LEFT JOIN Composition c ON p.idPizza = c.idPizza 
    LEFT JOIN Ingredient i ON c.idIngredient = i.idIngredient 
GROUP BY 1,2;

-- Fiche de livraison

CREATE OR REPLACE VIEW FicheLivraison AS
SELECT co.idCommande, l.nom as nomLivreur, v.typeVehicule, cl.nom as nomClient, co.commandee, 
    CASE WHEN (co.livree - co.commandee) > interval '00:30:00' 
        THEN (co.livree - co.commandee) - interval '00:30:00' 
        ELSE interval '00:00:00'
    END as retard,
    p.nom as nomPizza, p.prixDeBase
FROM Commande co LEFT JOIN Pizza p ON p.idPizza = co.idPizza
    LEFT JOIN Personne l ON l.idPersonne = co.idLivreur
    LEFT JOIN Personne cl ON cl.idPersonne = idClient
    LEFT JOIN Vehicule v ON v.idVehicule = co.idVehicule;

-- Stats

-- Véhicules inutilisés

SELECT *
FROM Vehicule
WHERE idVehicule NOT IN (
    SELECT idVehicule FROM Commande
);

-- Nombre de commandes par client

CREATE OR REPLACE VIEW nbCommandesParClient AS
SELECT avg(cpc) as avgcpc
FROM (
    SELECT cl.idClient, count(co.*) AS cpc 
    FROM client cl LEFT JOIN commande co USING(idClient) 
    GROUP BY 1
) as nbcpc;

-- Prix moyen par commande

SELECT avg(prix)
FROM Commande
WHERE livree IS NOT NULL;

-- Clients ayant commandé plus que la moyenne

SELECT cl.idClient, count(co.*) AS cpc 
FROM client cl LEFT JOIN commande co USING(idClient) 
GROUP BY 1
HAVING count(co.*) > (SELECT avgcpc FROM nbCommandesParClient);