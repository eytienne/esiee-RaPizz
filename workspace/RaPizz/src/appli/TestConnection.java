package appli;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;

import business.IngredientUnits;
import model.CommandeUtil;
import model.DatabaseAccess;

public class TestConnection {

	public static void main(String[] args) {
		for (String tn : Arrays.asList("Commande")) {
			printFullTable(tn);
		}
		System.out.println(IngredientUnits.getUnits());
	}

	public static void printFullTable(String tableName) {
		try {
			Connection dbc = DatabaseAccess.getConnection();
			Statement stm = dbc.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM " + tableName);
			CommandeUtil.printFull(rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
