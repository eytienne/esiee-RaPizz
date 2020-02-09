package business;

public class Vehicule {

	private int idVehicule;
	private String immatriculation;
	private String type;

	public Vehicule(int idVehicule, String immatriculation, String type) {
		this.idVehicule = idVehicule;
		this.immatriculation = immatriculation;
		this.type = type;
	}
	
	public int getIdVehicule() {
		return idVehicule;
	}
	
	public String getImmatriculation() {
		return immatriculation;
	}
	
	public String getType() {
		return type;
	}

}
