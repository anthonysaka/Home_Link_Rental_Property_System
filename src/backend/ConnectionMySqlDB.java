package backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class ConnectionMySqlDB {

	/*** Attributes - Variables ***/ 
	private final static String name_db = "home_link_db";
	private final static String user_db = "root";
	private final static String password_db = "nose@MySql99";
	private final static String url_db = "jdbc:mysql://localhost:3306/" + name_db;

	private static Connection connect = null;

	/* Method to get database connection */
	public static Connection getConnectionMySqlDB()
	{
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection(url_db, user_db, password_db);
			if (connect != null) {
				System.out.println("[success] Connected to the database: "+ name_db);
			}
		} catch (SQLException e) {
			System.out.println("[failed] An error occurred. Database Connection Failed!");
			e.printStackTrace();
		}
		return connect; //Return an instance of database connection
	}
	


}
