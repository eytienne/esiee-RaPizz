package business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DatabaseAccess;

public final class IngredientUnits {

	private static List<String> units;
	static {
		Connection con = DatabaseAccess.getConnection();
		units = new ArrayList<>();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT unnest(enum_range(NULL::uniteIngredient))");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				units.add(rs.getString(1));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private IngredientUnits() {
	}

	public static List<String> getUnits() {
		return units;
	}

}
