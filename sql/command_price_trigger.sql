-- si retard remboursement si cadeau pas besoin si payee rien
CREATE OR REPLACE PROCEDURE command_price_set(theCommandId INTEGER) LANGUAGE plpgsql AS $$
DECLARE pizzaDeFidelite BOOLEAN := FALSE;
SELECT
  CASE
    WHEN (livree - commandee) > 60 * 30 * 1000
    OR offreFidelite THEN 0
    ELSE p.prixDeBase * tp.coefficient
  END as prixCommande
from Commande c
INNER JOIN Pizza p USING(idPizza)
INNER JOIN TaillePizza tp USING(label)
where
  idCommande = theCommandId;
$$;