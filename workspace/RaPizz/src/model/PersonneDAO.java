package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import business.Personne;

public class PersonneDAO {

	public static Personne getFrom(ResultSet rs) throws SQLException {
		return new Personne(rs.getInt("idPersonne"), rs.getString("nom"), rs.getString("prenom"),
				rs.getDate("dateNaissance"), AdresseDAO.getFrom(rs));
	}
}
