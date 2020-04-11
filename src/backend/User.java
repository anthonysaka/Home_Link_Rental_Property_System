package backend;


import java.sql.Connection;
import java.sql.SQLException;

import com.mysql.cj.jdbc.CallableStatement;

import frontend.HomeGUIController;
import frontend.LoginGUIController;

import java.util.ArrayList;


/**
 * @developed_by Anthony Sakamoto
 *
 */
public class User extends ConnectionMySqlDB {
	/**
	 * This class, represent user table on database
	 */

	private int id;
	private String name;
	private String lastname;
	private String gender;
	private String type;
	private String username;
	private String email;
	private String password;
	private Boolean status;
	private String country_location;
	private String telephone_number;
	private String created_date;
	private static ArrayList<Tarjetas> tarjetas = new ArrayList<Tarjetas>();
	private ArrayList<PublicacionesParaVisualizar> publicaciones = new ArrayList<PublicacionesParaVisualizar>();
	private ArrayList<Publicacion> publicacionesBDD = new ArrayList<Publicacion>();
	private ArrayList<Reserva> reservas = new ArrayList<Reserva>();
	private ArrayList<Propiedad> propiedades = new ArrayList<Propiedad>();

	private int amountReservation = 0;
	private int amountPublication = 0;


	public User(String name, String lastname, String gender, String type, String username, String email,
			String password,String created_date) {
		super();
	//	this.id = id;
		this.name = name;
		this.lastname = lastname;
		this.gender = gender;
		this.type = type;
		this.username = username;
		this.email = email;
		this.password = password;
	//	this.status = status;
		//	this.country_location = country_location;
		//	this.telephone_number = telephone_number;
		this.created_date = created_date;
	//	this.tarjetas = new ArrayList<Tarjetas>();
		//this.propiedades = new ArrayList<Propiedad>();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getCountry_location() {
		return country_location;
	}

	public void setCountry_location(String country_location_id) {
		this.country_location = country_location_id;
	}

	public String getTelephone_number() {
		return telephone_number;
	}

	public void setTelephone_number(String telephone_number) {
		this.telephone_number = telephone_number;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}


	public ArrayList<Tarjetas> getTarjetas() {
		return tarjetas;
	}


	public void setTarjetas(ArrayList<Tarjetas> tarjetas) {
		this.tarjetas = tarjetas;
	}

	public ArrayList<PublicacionesParaVisualizar> getPublicaciones() {
		return publicaciones;
	}

	public void setPublicaciones(ArrayList<PublicacionesParaVisualizar> publicaciones) {
		this.publicaciones = publicaciones;
	}

	public ArrayList<Reserva> getReserva() {
		return reservas;
	}

	public void setReserva(ArrayList<Reserva> reservas) {
		this.reservas = reservas;
	}

	public ArrayList<Reserva> getReservas() {
		return reservas;
	}

	public void setReservas(ArrayList<Reserva> reservas) {
		this.reservas = reservas;
	}

	public ArrayList<Propiedad> getPropiedades() {
		return propiedades;
	}

	public void setPropiedades(ArrayList<Propiedad> propiedades) {
		this.propiedades = propiedades;
	}

	/*******************************************************************   METHODS    **********************************************************************************************************/

	public static boolean insertarTarjetas(Tarjetas tarjeta) {

		CallableStatement mySqlStatement = null ; // call stored procedure
		try {

			Connection myConnection = getConnectionMySqlDB();	

			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_insert_card(?,?,?,?,?)}");
			mySqlStatement.setString("pa_numCard", tarjeta.getNumeroTarjeta());
			mySqlStatement.setString("pa_userOwner", HomeGUIController.usuarioActual.getUsername());
			mySqlStatement.setString("pa_representante", tarjeta.getRepresentante());
			mySqlStatement.setString("pa_expirationDate", tarjeta.getFechaVencimiento());
			mySqlStatement.setInt("pa_cvv",tarjeta.getCVV());
			mySqlStatement.executeQuery();
			myConnection.close();
			System.out.println("Su tarjeta ha sido guardada!");
			return true;
		} catch (SQLException e) {
			System.out.println("Error al guardar su tarjeta!");
			e.printStackTrace();
			return false;
		}


	}


	public static boolean insertarPropiedades(Propiedad property) {


		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = getConnectionMySqlDB();	
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_insertProperty(?,?,?,?,?)}");
			mySqlStatement.setString("pa_typeProperty", property.getTipo());
			mySqlStatement.setString("pa_address", property.getDireccion());
			mySqlStatement.setString("pa_status", property.getEstatus());
			mySqlStatement.setString("pa_characteristic",property.getCaracteristicas());
			mySqlStatement.setInt("pa_userID", LoginGUIController.x);
			mySqlStatement.executeQuery();
			myConnection.close();
			System.out.println("Su propiedad ha sido guardada!");
			return true;
		} catch (SQLException e) {
			System.out.println("Error al guardar su propiedad!");
			e.printStackTrace();
			return false;
		}
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public static boolean insertarPublicaciones(Publicacion publication) {
		CallableStatement mySqlStatement = null ; // call stored procedure

		try {
			Connection myConnection = getConnectionMySqlDB();	
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_insert_publicacion(?,?)}");

			mySqlStatement.setInt("pa_idPropiedad", publication.getIdPropiedad() ); //se seleccionara de un cbx
			mySqlStatement.setFloat("pa_precio", publication.getPrecio());
			mySqlStatement.executeQuery();
			myConnection.close();
			System.out.println("Su publicacion ha sido guardada!");
			return true;
		} catch (SQLException e) {
			System.out.println("Error al insertar su publicacion!");
			e.printStackTrace();
			return false;
		}		

	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public int getAmountReservation() {
		return amountReservation;
	}

	public void setAmountReservation(int amountReservation) {
		this.amountReservation = amountReservation;
	}

	public int getAmountPublication() {
		return amountPublication;
	}

	public void setAmountPublication(int amountPublication) {
		this.amountPublication = amountPublication;
	}


}
