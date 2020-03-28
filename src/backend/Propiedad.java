package backend;

public class Propiedad {
	
	private int idPropiedad;
	private String tipo;
	private String direccion;
	private String estatus;
	private String feedbacks;
	private float precio;
	private String caracteristicas;
	private int idUserOwner;
	
	public Propiedad(int idPropiedad, String tipo, String direccion, String estatus, String feedbacks, float precio,
			String caracteristicas, int idUserOwner) {
		super();
		this.idPropiedad = idPropiedad;
		this.tipo = tipo;
		this.direccion = direccion;
		this.estatus = estatus;
		this.feedbacks = feedbacks;
		this.precio = precio;
		this.caracteristicas = caracteristicas;
		this.idUserOwner = idUserOwner;
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

	public String getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(String feedbacks) {
		this.feedbacks = feedbacks;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
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
	

}