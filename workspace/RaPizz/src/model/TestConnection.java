package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;

public class TestConnection {

	public static void main(String[] args) {
		for (String tn : Arrays.asList("Commande")) {
			printFullTable(tn);
		}
	}

	public static void printFullTable(String tableName) {
		try {
			Connection dbc = DatabaseAccess.getConnection();
			Statement stm = dbc.createStatement();
			ResultSet rs = stm.executeQuery("SELECT * FROM " + tableName);
			int nbColumns = rs.getMetaData().getColumnCount();
			while (rs.next()) {
				for (int i = 1; i <= nbColumns; i++) {
					System.out.print("|" + rs.getString(i));					
				}
				System.out.println();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
