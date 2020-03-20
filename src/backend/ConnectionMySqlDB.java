package backend;

import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class ConnectionMySqlDB {
	

	/*** Attributes - Variables ***/ 
	private static final String name_db = "home_link_db";
	private static final String user_db = "root";
	private static final String password_db = "nose@MySQL99";
	private static final String host_server_db = "localhost";
	private static final String port_server_db = "3306";
	private static final String url_db = "jdbc:mysql://" + host_server_db + ":" + port_server_db + "/" + name_db;
										// "jdbc:mysql://localhost:3306/home_link_db"
	private ConnectionMySqlDB connection = null;
	
	
	/* Method to get database connection */
	public ConnectionMySqlDB getConnectionMySqlDB()
	{
		try {
			connection = (ConnectionMySqlDB) DriverManager.getConnection(url_db, user_db, password_db);
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
