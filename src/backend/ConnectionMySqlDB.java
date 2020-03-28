package backend;

import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class ConnectionMySqlDB {

	/*** Attributes - Variables ***/ 
	private final String name_db = "home_link_db";
	private final String user_db = "root";
	private final String password_db = "nose@MySql99";
	private final String url_db = "jdbc:mysql://localhost:3306/" + name_db;

	private ConnectionMySqlDB connection = null;

	/* Method to get database connection */
	public ConnectionMySqlDB getConnectionMySqlDB()
	{
		try {
			connection = (ConnectionMySqlDB) DriverManager.getConnection(this.url_db, this.user_db, this.password_db);
			if (connection != null) {
				System.out.println("[success] Connected to the database: "+name_db);
			}
		} catch (SQLException e) {
			System.out.println("[failed] An error occurred. Database Connection Failed!");
			e.printStackTrace();
		}
		return connection; //Return an instance of database connection
	}


}
