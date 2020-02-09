package business;

public class Adresse {

	private int idAdresse;
	private short numero;
	private String voie;
	private String codePostal;
	private String ville;
	
	public Adresse(int idAdresse, short numero, String voie, String codePostal, String ville) {
		this.idAdresse = idAdresse;
		this.numero = numero;
		this.voie = voie;
		this.codePostal = codePostal;
		this.ville = ville;
	}

	public int getIdAdresse() {
		return idAdresse;
	}

	public short getNumero() {
		return numero;
	}

	public String getVoie() {
		return voie;
	}

	public String getCodePostal() {
		return codePostal;
	}

	public String getVille() {
		return ville;
	}
	
}
