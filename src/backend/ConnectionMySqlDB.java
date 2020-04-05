package backend;
/*
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.xdevapi.Statement;
 */
import java.sql.*;
import java.util.ArrayList;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class ConnectionMySqlDB {

	/*** Attributes - Variables ***/ 

	/*********************************************************/
	public static Connection conexion = null;
	public static Statement sentencia;
	public static ResultSet resultado;


	/*********************************************************/

	private final static String name_db = "home_link_db";
	private final static String user_db = "root";

	private final static String password_db = "gilcia8099126262";
	
	private final static String url_db = "jdbc:mysql://localhost:3306/" + name_db;

	private static Connection connect = null;

	/* Method to get database connection */
	public static Connection getConnectionMySqlDB()
	{
		try {
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

	public static void conectar(){
		String ruta="jdbc:mysql://localhost:3306/" + name_db;
		String user="root";
		String pass="nose@MySql99";
		try {
			//Class.forName("com.mysql.jdbc.Driver");
			conexion=DriverManager.getConnection(ruta,user,pass); 
			sentencia= conexion.createStatement();
			System.out.println("Conectado");
		} catch (Exception e) {
			System.out.println("No conectado");
		}
	}

	public static ArrayList<String> llenarCombo(){

		conectar();

		ArrayList<String> lista = new ArrayList<String>();

		String Query = "SELECT * FROM t_property";

		try {
			resultado = sentencia.executeQuery(Query);
			System.out.println("Correcto");
		} catch (Exception e) {
			System.out.println("No Correcto");

		}
		try {
			while(resultado.next()){
				lista.add(resultado.getString("Address"));
			}
		} catch (Exception e) {
		}
		return lista;
	}


}
