package business;

public class Commande {
	
	private int idCommande;
	private Client client;
	private Pizza pizza;
	private String taille;
	private Livreur livreur;
	private Vehicule vehicule;
	
	public Commande(Client client, Pizza pizza, String taille, Livreur livreur, Vehicule vehicule) {
		this.client = client;
		this.pizza = pizza;
		this.taille = taille;
		this.livreur = livreur;
		this.vehicule = vehicule;
	}

	public int getIdCommande() {
		return idCommande;
	}

	public Client getClient() {
		return client;
	}

	public Pizza getPizza() {
		return pizza;
	}

	public String getTaille() {
		return taille;
	}

	public Livreur getLivreur() {
		return livreur;
	}

	public Vehicule getVehicule() {
		return vehicule;
	}
	
	
}
