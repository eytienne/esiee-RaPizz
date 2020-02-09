package business;

import java.sql.Date;

public class Livreur extends Personne {

	public Livreur(int idPersonne, String nom, String prenom, Date dateNaissance, Adresse adresse) {
		super(idPersonne, nom, prenom, dateNaissance, adresse);
	}

}
