package backend;

public class Publicacion {
	private int idPublicacion;
	private String titulo;
	private String fechaPublicacion;
	private Boolean status;
	private int idPropiedad;
	private int idAdministrador;
	private String usernameAdmin; //se creo despues auxiliar
	private float precio;
	private String usernameOwner;
	private String tiempoexistente;
	
	/*** auxiliar para mostrar una vista de la base de datos **/
	private String dirPropiedadCorrespondiente;
	private String tipoPropiedadCorrespondiente;
	
	public Publicacion(int idPublicacion, String titulo, String fechaPublicacion, Boolean status, int idPropiedad, float precio, String usernameOwner) {
		super();
		this.idPublicacion = idPublicacion;
		this.setTitulo(titulo);
		this.fechaPublicacion = fechaPublicacion;
		this.status = status;
		this.idPropiedad = idPropiedad;
		this.idAdministrador = 0; //cero significa que nadie la ha autorizado, por default esta asi.
		this.precio = precio;
		this.usernameOwner = usernameOwner;
		
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
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public int getIdPropiedad() {
		return idPropiedad;
	}
	public void setIdPropiedad(int idPropiedad) {
		this.idPropiedad = idPropiedad;
	}
	public int getIdAdministrador() {
		return idAdministrador;
	}
	public void setIdAdministrador(int idAdministrador) {
		this.idAdministrador = idAdministrador;
	}
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getUsernameOwner() {
		return usernameOwner;
	}
	public void setUsernameOwner(String usernameOwner) {
		this.usernameOwner = usernameOwner;
	}



	public String getUsernameAdmin() {
		return usernameAdmin;
	}



	public void setUsernameAdmin(String usernameAdmin) {
		this.usernameAdmin = usernameAdmin;
	}



	public String getTiempoexistente() {
		return tiempoexistente;
	}



	public void setTiempoexistente(String tiempoexistente) {
		this.tiempoexistente = tiempoexistente;
	}



	public String getDirPropiedadCorrespondiente() {
		return dirPropiedadCorrespondiente;
	}



	public void setDirPropiedadCorrespondiente(String dirPropiedadCorrespondiente) {
		this.dirPropiedadCorrespondiente = dirPropiedadCorrespondiente;
	}



	public String getTipoPropiedadCorrespondiente() {
		return tipoPropiedadCorrespondiente;
	}



	public void setTipoPropiedadCorrespondiente(String tipoPropiedadCorrespondiente) {
		this.tipoPropiedadCorrespondiente = tipoPropiedadCorrespondiente;
	}



	
	

}
