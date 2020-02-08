-- si retard remboursement si cadeau pas besoin si payee rien

-------------------------

CREATE OR REPLACE FUNCTION command()
  RETURNS TRIGGER AS
$$
DECLARE dispoSolde NUMERIC(6,2);
DECLARE toLock NUMERIC(6,2);
BEGIN

    SELECT pizzasPourFidelite >= 10 INTO NEW.offreFidelite
    FROM Client
    WHERE idClient = NEW.idClient;

    SELECT (c.solde - c.lockedSolde), p.prixDeBase * tp.coefficient 
    INTO dispoSolde, toLock
    FROM Client c, Pizza p, TaillePizza tp
    WHERE c.idClient = NEW.idClient
      AND p.idPizza = NEW.idPizza
      AND tp.idTaillePizza = NEW.idTaillePizza;

    IF NOT NEW.offreFidelite AND dispoSolde < toLock THEN
      RAISE 'Not enough solde to procede the command!';
    END IF;
    
    UPDATE Client 
    SET pizzasPourFidelite = (pizzasPourFidelite + 1) % 11, 
    lockedSolde = (CASE WHEN NEW.offreFidelite THEN lockedSolde
     ELSE lockedSolde + toLock END)
    WHERE idClient = NEW.idClient;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

BEGIN TRANSACTION;

DROP TRIGGER IF EXISTS command_trigger ON Commande;

CREATE TRIGGER command_trigger 
  BEFORE INSERT ON Commande FOR EACH ROW
  EXECUTE PROCEDURE command();

COMMIT;

