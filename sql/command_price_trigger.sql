-- si retard remboursement si cadeau pas besoin si payee rien

CREATE OR REPLACE FUNCTION command_price ()
  RETURNS TRIGGER AS
$$
DECLARE theCommandId BOOLEAN := TG_ARGV[0];
BEGIN
  UPDATE Commande
  SET
    prix = (
      SELECT
        CASE WHEN (c.livree - c.commandee) > interval '00:30:00'
          OR c.offreFidelite THEN
          0
        ELSE
          p.prixDeBase * tp.coefficient
        END AS prixCommande
      FROM
        Commande c
        INNER JOIN Pizza p USING (idPizza)
        INNER JOIN TaillePizza tp USING (label)
      WHERE
        idCommande = theCommandId)
  WHERE
    idCommande = theCommandId;
END;
$$ LANGUAGE plpgsql;

BEGIN TRANSACTION;
DROP TRIGGER IF EXISTS command_price_trigger ON Commande;
CREATE TRIGGER command_price_trigger
  AFTER INSERT OR UPDATE ON Commande
  FOR EACH ROW
  WHEN (NEW.livree IS NOT NULL)
  EXECUTE PROCEDURE command_price (idCommande);
COMMIT;

