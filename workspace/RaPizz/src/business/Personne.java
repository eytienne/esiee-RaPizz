package business;

import java.sql.Date;

public class Personne {

	private int idPersonne;
	private String nom;
	private String prenom;
	private Date dateNaissance;
	private Adresse adresse;
	
	public Personne(int idPersonne, String nom, String prenom, Date dateNaissance, Adresse adresse) {
		this.idPersonne = idPersonne;
		this.nom = nom;
		this.prenom = prenom;
		this.dateNaissance = dateNaissance;
		this.adresse = adresse;
	}

	public int getIdPersonne() {
		return idPersonne;
	}

	public String getNom() {
		return nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public Date getDateNaissance() {
		return dateNaissance;
	}

	public Adresse getAdresse() {
		return adresse;
	}
	
}
