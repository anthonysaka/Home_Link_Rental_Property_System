package backend;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.CallableStatement;

public class PublicacionesParaVisualizar extends ConnectionMySqlDB {
	
	private String tipo;
	private String direccion;
	private String feedback;
	private String caracterisitcas;
	private String usernamePublicador;
	private String fechaPublicacion;
	private float precio;
	
	
	public PublicacionesParaVisualizar(String tipo, String direccion, String feedback, String caracterisitcas,
			String usernamePublicador, String fechaPublicacion, float precio) {
		super();
		this.tipo = tipo;
		this.direccion = direccion;
		this.feedback = feedback;
		this.caracterisitcas = caracterisitcas;
		this.usernamePublicador = usernamePublicador;
		this.fechaPublicacion = fechaPublicacion;
		this.precio = precio;
	}

	public String getTipo() {
		return tipo;
	}

	public String getDireccion() {
		return direccion;
	}

	public String getFeedback() {
		return feedback;
	}

	public String getCaracterisitcas() {
		return caracterisitcas;
	}

	public String getUsernamePublicador() {
		return usernamePublicador;
	}

	public String getFechaPublicacion() {
		return fechaPublicacion;
	}

	public float getPrecio() {
		return precio;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public void setCaracterisitcas(String caracterisitcas) {
		this.caracterisitcas = caracterisitcas;
	}

	public void setUsernamePublicador(String usernamePublicador) {
		this.usernamePublicador = usernamePublicador;
	}

	public void setFechaPublicacion(String fechaPublicacion) {
		this.fechaPublicacion = fechaPublicacion;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}





	/*********************************************/
	public static ResultSet loadPublication(String address_to_search)
	{
		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = getConnectionMySqlDB();
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_search_publication_by_dir(?)}");
			mySqlStatement.setString("pa_direccion", address_to_search);
			ResultSet rs = mySqlStatement.executeQuery();
			System.out.println("Busquedad con exito!");
			return rs;
			
		} catch (SQLException e) {
			System.out.println("Busquedad sin exito!");
			e.printStackTrace();
			return null;
		}
	}
	
	
	/********************************************/
	

	

}
