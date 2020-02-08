-- si retard remboursement si cadeau pas besoin si payee rien

-------------------------

CREATE OR REPLACE FUNCTION command()
  RETURNS TRIGGER AS
$$
BEGIN
    SELECT pizzasPourFidelite >= 10 INTO NEW.offreFidelite
    FROM Client
    WHERE idClient = NEW.idClient;
    
    UPDATE Client 
    SET pizzasPourFidelite = (pizzasPourFidelite+1)%11
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

