package model;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import business.Ingredient;
import business.Pizza;

public class CommandeUtil {

	public static List<Pizza> getMenu() {
		List<Pizza> pizze = new LinkedList<>();
		try {
			Connection con = DatabaseAccess.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM Menu");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				LinkedList<Ingredient> ingList = new LinkedList<Ingredient>();
				Array ingSQL = rs.getArray("ingredients");
				String[] ings = (String[]) ingSQL.getArray();
				for (String nom : ings) {
					if (nom != null)
						ingList.add(new Ingredient(nom));
				}
				pizze.add(new Pizza(-1, rs.getString("nom"), rs.getFloat("prixDeBase"), ingList));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pizze;
	}

	public static void printFicheLivraison(int commandeId) {
		try {
			Connection con = DatabaseAccess.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM FicheLivraison WHERE idCommande = ?");
			ps.setInt(1, commandeId);
			ResultSet rs = ps.executeQuery();
			printFull(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void printFull(ResultSet rs) throws SQLException {
		int nbColumns = rs.getMetaData().getColumnCount();
		while (rs.next()) {
			for (int i = 1; i <= nbColumns; i++) {
				System.out.print("|" + rs.getString(i));
			}
			System.out.println();
		}
	}

	public static void printBestClients() {
		try {
			Connection con = DatabaseAccess.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT p.*, cl.*, count(co.*) AS cpc "
					+ "FROM Personne p inner join client cl on p.idPersonne = cl.idClient "
					+ "LEFT JOIN commande co USING(idClient) " 
					+ "GROUP BY 1, cl.idclient "
					+ "HAVING count(co.*) > (SELECT avgcpc FROM nbCommandesParClient);");
			ResultSet rs = ps.executeQuery();
			printFull(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
