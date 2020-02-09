package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import business.Client;

public class ClientDAO {

	public static Client getById(int idClient) {
		try {
			Connection con = DatabaseAccess.getConnection();
			PreparedStatement ps = con
					.prepareStatement("SELECT * " + "FROM Client " + "INNER JOIN Personne ON idClient = idPersonne"
							+ "INNER JOIN Adresse USING(idAdresse)" + "WHERE idClient = ?");
			ps.setInt(1, idClient);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new Client(PersonneDAO.getFrom(rs), rs.getInt("pizzasPourFidelite"), rs.getFloat("solde"),
						rs.getFloat("lockedSolde"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
