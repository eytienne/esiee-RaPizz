package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseAccess {
	static {
		try {
			Class.forName("postgresql.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}	
	}
	
	public static Connection getConnection() throws SQLException {		
		return DriverManager.getConnection("jdbc:postgresql://localhost/rapizz","postgres","postgres");
	}
}
