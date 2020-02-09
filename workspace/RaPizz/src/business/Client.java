package business;

import java.sql.Date;

public class Client extends Personne {

	private int pizzasPourFidelite;
	private float solde;
	private float lockedSolde;

	public int getPizzasPourFidelite() {
		return pizzasPourFidelite;
	}

	public float getSolde() {
		return solde;
	}

	public float getLockedSolde() {
		return lockedSolde;
	}

	public Client(int idPersonne, String nom, String prenom, Date dateNaissance, Adresse adresse,
			int pizzasPourFidelite, float solde, float lockedSolde) {
		super(idPersonne, nom, prenom, dateNaissance, adresse);
		this.pizzasPourFidelite = pizzasPourFidelite;
		this.solde = solde;
		this.lockedSolde = solde;
	}

	public Client(Personne p, int pizzasPourFidelite, float solde, float lockedSolde) {
		this(p.getIdPersonne(), p.getNom(), p.getPrenom(), p.getDateNaissance(), p.getAdresse(), pizzasPourFidelite,
				solde, lockedSolde);
	}

}
