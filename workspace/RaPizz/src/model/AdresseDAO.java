package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import business.Adresse;

public class AdresseDAO {

	public static Adresse getById(int idAdresse) {
		try {
			Connection con = DatabaseAccess.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * " + "FROM Adresse " + "WHERE idAdresse = ?");
			ps.setInt(1, idAdresse);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Adresse getFrom(ResultSet rs) throws SQLException {
		return new Adresse(rs.getInt("idAdresse"), rs.getShort("numero"), rs.getString("voie"), rs.getString("codePostal"),
				rs.getString("ville"));
	}
}
