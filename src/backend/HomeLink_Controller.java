package backend;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.CallableStatement;

public class HomeLink_Controller extends ConnectionMySqlDB {

	private ArrayList<User> usuarios;
	private ArrayList<Propiedad> propiedades;
	private ArrayList<PublicacionesParaVisualizar> publicaciones;
	private ArrayList<Reserva> reservas;
	
	public HomeLink_Controller() {
		super();

		new ArrayList<User>();
		new ArrayList<Publicacion>();

		new ArrayList<Tarjetas>();
		new ArrayList<PublicacionesParaVisualizar>();

		new ArrayList<Reserva>();
		new ArrayList<Propiedad>();
	}

	public ArrayList<User> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(ArrayList<User> usuarios) {
		this.usuarios = usuarios;
	}

	public ArrayList<Propiedad> getPropiedades() {
		return propiedades;
	}

	public void setPropiedades(ArrayList<Propiedad> propiedades) {
		this.propiedades = propiedades;
	}

	public ArrayList<PublicacionesParaVisualizar> getPublicaciones() {
		return publicaciones;
	}

	public void setPublicaciones(ArrayList<PublicacionesParaVisualizar> publicaciones) {
		this.publicaciones = publicaciones;
	}

	public ArrayList<Reserva> getReservas() {
		return reservas;
	}

	public void setReservas(ArrayList<Reserva> reservas) {
		this.reservas = reservas;
	}
	
	
	// Method to create user. Send parameters to Database.
		public static boolean create_add_user(User pUser) {
			CallableStatement mySqlStatement = null ; // call stored procedure
			try {
				Connection myConnection = getConnectionMySqlDB();
				mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_createUser(?,?,?,?,?,?,?,?,?,?,?)}");

				mySqlStatement.setString("pa_username", pUser.getUsername());
				mySqlStatement.setString("pa_email", pUser.getEmail());
				mySqlStatement.setString("pa_password", pUser.getPassword());
				mySqlStatement.setString("pa_name", pUser.getName());
				mySqlStatement.setString("pa_lastname", pUser.getLastname());
				mySqlStatement.setString("pa_gender", pUser.getGender());
				mySqlStatement.setString("pa_type", pUser.getType());
				mySqlStatement.setBoolean("pa_status", true);
				mySqlStatement.setString("pa_created_date", pUser.getCreated_date());
				mySqlStatement.setString("pa_telephone", pUser.getTelephone_number());
				mySqlStatement.setString("pa_location", pUser.getCountry_location());
				mySqlStatement.executeQuery();
				myConnection.close();
			//	System.out.println("User creado con exito!");
				return true;

			} catch (SQLException e) {
			//	System.out.println("User no creado con exito!");
				e.printStackTrace();
				return false;
			}
		}
		
		public static boolean delete_user(int pId, String pUsername) {
			CallableStatement mySqlStatement = null ; // call stored procedure
			try {
				Connection myConnection = getConnectionMySqlDB();
				mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_delete_user(?,?)}");

				mySqlStatement.setString("pa_username", pUsername);
				mySqlStatement.setInt("pa_id",pId );
				mySqlStatement.executeQuery();
				myConnection.close();
			//	System.out.println("User eliminado con exito!");
				return true;
			} catch (SQLException e) {
			//	System.out.println("User no eliminado con exito!");
				e.printStackTrace();
				return false;
			}
		}
		
		public static boolean delete_publication(int pId) {
			CallableStatement mySqlStatement = null ; // call stored procedure
			try {
				Connection myConnection = getConnectionMySqlDB();
				mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_delete_publicacion(?)}");
				mySqlStatement.setInt("pa_id",pId );
				mySqlStatement.executeQuery();
				myConnection.close();
			//	System.out.println("Publicacion eliminado con exito!");
				return true;
			} catch (SQLException e) {
			//	System.out.println("Publicacion no eliminado con exito!");
				e.printStackTrace();
				return false;
			}
		}
		
		
		
		
		///////////METODO BUSCA ID_AMD
	
		

}
