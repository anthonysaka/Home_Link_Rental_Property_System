package backend;

public class Publicacion {
	private int idPublicacion;
	private String titulo;
	private String fechaPublicacion;
	private String status;
	private int idPropiedad;
	private int idAdministrador;
	private float precio;
	
	
	public Publicacion(int idPublicacion, String titulo, String fechaPublicacion, String status, int idPropiedad, float precio) {
		super();
		this.idPublicacion = idPublicacion;
		this.setTitulo(titulo);
		this.fechaPublicacion = fechaPublicacion;
		this.status = status;
		this.idPropiedad = idPropiedad;
		//this.idAdministrador = (Integer) null; ??????????????????????????????????????????????????????????
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


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
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
	
	
	
	
	
	

}
