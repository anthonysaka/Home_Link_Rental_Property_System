package backend;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.CallableStatement;

import javafx.scene.image.Image;



public class PublicacionesParaVisualizar extends ConnectionMySqlDB {
	private Integer id;
	private String tipo;
	private String direccion;
	private String feedback;
	private String caracterisitcas;
	private String usernamePublicador;
	private String fechaPublicacion;
	private String titulo;
	private float precio;
	private Image imagePreviewHouse;
	
	
	public PublicacionesParaVisualizar(Integer id, String titulo, String tipo, String direccion, String feedback, String caracterisitcas,
			String usernamePublicador, String fechaPublicacion, float precio, Image preImaHouse) {
		super();
		this.setTitulo(titulo);
		this.tipo = tipo;
		this.direccion = direccion;
		this.feedback = feedback;
		this.caracterisitcas = caracterisitcas;
		this.usernamePublicador = usernamePublicador;
		this.fechaPublicacion = fechaPublicacion;
		this.precio = precio;
		this.imagePreviewHouse = preImaHouse;
		this.setId(id);
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
	public Image getImagePreviewHouse() {
		return imagePreviewHouse;
	}

	public void setImagePreviewHouse(Image imagePreviewHouse) {
		this.imagePreviewHouse = imagePreviewHouse;
	}

	/********************************************/
	public static ResultSet loadPublication(String city, String country, int capacity, String iniDate, String finDate)
	{
		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = getConnectionMySqlDB();
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_search_publication_by_dir(?,?,?,?,?)}");
			mySqlStatement.setString("pa_country", country);
			mySqlStatement.setString("pa_city", city);
			mySqlStatement.setInt("pa_capacity", capacity);
			mySqlStatement.setString("pa_start_date", iniDate);
			mySqlStatement.setString("pa_end_date", finDate);
			ResultSet rs = mySqlStatement.executeQuery();
			System.out.println("Busqueda con exito!");
			return rs;
			
		} catch (SQLException e) {
			System.out.println("Busqueda sin exito!");
			e.printStackTrace();
			return null;
		}
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	
	/********************************************/
	

	

}
