package backend;

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
	
	

	

}
