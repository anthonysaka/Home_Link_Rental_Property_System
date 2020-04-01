package backend;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.CallableStatement;

public class Publicaciones extends Propiedad {
	
	private int idPublicacion;
	private String fechaPublicacion;
	private float precio;
	
	
	public Publicaciones(int idPropiedad, String tipo, String direccion, String estatus, String feedbacks,
			String caracteristicas, int idUserOwner, int idPublicacion, String fechaPublicacion, float precio) {
		super(idPropiedad, tipo, direccion, estatus, feedbacks, caracteristicas, idUserOwner);
		this.idPublicacion = idPublicacion;
		this.fechaPublicacion = fechaPublicacion;
		this.precio = precio;
	}


	public int getIdPublicacion() {
		return idPublicacion;
	}


	public void setIdPublicacion(int idPublicacion) {
		this.idPublicacion = idPublicacion;
	}


	public String getFechaPublicacion() {
		return fechaPublicacion;
	}


	public void setFechaPublicacion(String fechaPublicacion) {
		this.fechaPublicacion = fechaPublicacion;
	}


	public float getPrecio() {
		return precio;
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
			myConnection.close();
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
