package backend;

public class Propiedad extends ConnectionMySqlDB {
	
		private int idPropiedad;
		private String tipo;
		private String direccion;
		private String estatus;
		private float rating;
		private String caracteristicas;
		private int idUserOwner;
		private String username;
		private String numRe;
		private int cantReservaciones;
	
	public Propiedad( String tipo, String direccion, String estatus, String caracteristicas) {
		super();
		//this.idPropiedad = idPropiedad;
		this.tipo = tipo;
		this.direccion = direccion;
		this.estatus = estatus;
	//	this.feedbacks = feedbacks;
		this.caracteristicas = caracteristicas;
	//	this.idUserOwner = idUserOwner;
	}

	public int getIdPropiedad() {
		return idPropiedad;
	}

	public void setIdPropiedad(int idPropiedad) {
		this.idPropiedad = idPropiedad;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	

	public String getCaracteristicas() {
		return caracteristicas;
	}

	public void setCaracteristicas(String caracteristicas) {
		this.caracteristicas = caracteristicas;
	}

	public int getIdUserOwner() {
		return idUserOwner;
	}

	public void setIdUserOwner(int idUserOwner) {
		this.idUserOwner = idUserOwner;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNumRe() {
		return numRe;
	}

	public void setNumRe(String numRe) {
		this.numRe = numRe;
	}

	public int getCantReservaciones() {
		return cantReservaciones;
	}

	public void setCantReservaciones(int cantReservaciones) {
		this.cantReservaciones = cantReservaciones;
	}
	

}
