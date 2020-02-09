package business;

import java.util.List;

public class Pizza {

	private int idPizza;
	private String nom;
	private float prixDeBase;
	private List<Ingredient> ingredients;

	public Pizza(int idPizza, String nom, float prixDeBase, List<Ingredient> ingredients) {
		this.idPizza = idPizza;
		this.nom = nom;
		this.prixDeBase = prixDeBase;
		this.ingredients = ingredients;
	}

	public int getIdPizza() {
		return idPizza;
	}

	public String getNom() {
		return nom;
	}

	public float getPrixDeBase() {
		return prixDeBase;
	}

	public List<Ingredient> getIngredients() {
		return ingredients;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder(this.nom + " : " + prixDeBase + "€");
		if (!ingredients.isEmpty()) {
			sb.append(" (");
			boolean first = true;
			for (Ingredient ingredient : ingredients) {
				if (!first)
					sb.append(", ");
				else
					first = false;
				sb.append(ingredient.getNom());
			}
			sb.append(")");
		}

		return sb.toString();
	}
}
