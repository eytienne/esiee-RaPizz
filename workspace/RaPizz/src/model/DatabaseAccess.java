package model;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseAccess {
	public static final int MAX_TRIALS = 5;

	private static Connection connection;
	
	static {
		try {
			Class.forName("org.postgresql.Driver");
			int cpt = 0;
			while (connection == null && cpt < MAX_TRIALS) {
				Properties pp = new Properties();
				pp.load(new FileInputStream("rapizz.properties"));
				connection = DriverManager.getConnection(pp.getProperty("url"), pp.getProperty("user"),
						pp.getProperty("password"));
				cpt++;
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static Connection getConnection() throws Exception {
		return connection;
	}
	
	public static void closeConnection() throws SQLException {
		connection.close();
	}

	@Override
	protected void finalize() throws Throwable {
		closeConnection();
		super.finalize();
	}
}
