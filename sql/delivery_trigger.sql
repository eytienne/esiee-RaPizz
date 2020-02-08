-- si retard remboursement si cadeau pas besoin si payee rien

CREATE OR REPLACE FUNCTION delivery()
  RETURNS TRIGGER AS
$$
DECLARE tempPrix NUMERIC(6,2);
BEGIN
  IF(NEW.livree IS NOT NULL AND NEW.prix IS NULL) THEN
    
    SELECT
      (CASE WHEN (NEW.livree - NEW.commandee) > interval '00:30:00'
        OR NEW.offreFidelite THEN
        0
      ELSE
        pp.prixDeBase * tp.coefficient
      END), pp.prixDeBase*tp.coefficient INTO NEW.prix, tempPrix
    FROM
      Pizza pp, TaillePizza tp
    WHERE pp.idPizza = NEW.idPizza AND tp.idTaillePizza = NEW.idTaillePizza;
    
    IF(NOT NEW.offreFidelite) THEN
      UPDATE Client 
        SET solde = solde - tempPrix, lockedSolde = lockedSolde - tempPrix 
        WHERE idClient = NEW.idClient;
      IF(tempPrix > 0) THEN
        INSERT INTO History (idClient, montant, dateOperation) 
          VALUES (NEW.idClient, -1 * tempPrix, now());
      END IF;
    END IF;

  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

BEGIN TRANSACTION;

DROP TRIGGER IF EXISTS delivery_trigger ON Commande;

CREATE TRIGGER delivery_trigger 
  BEFORE INSERT OR UPDATE ON Commande FOR EACH ROW
  EXECUTE PROCEDURE delivery();

COMMIT;

