package backend;

public class Reserva {
	
	private int idReserva; 
	private int idPublicacion;
	private int idUsuario;
	private int idFactura;
	private int huespedes;
	private String fechaInicio;
	private String fechaFin;
	private float precio;
	private String tipoPropiedad;
	private String titulo;
	
	
	
	public Reserva(int idReserva, int idPropiedad, int idUsuario, int huespedes, String fechaInicio, String fechaFin) {
		super();
		this.idReserva = idReserva;
		this.idPublicacion = idPropiedad;
		this.idUsuario = idUsuario;
		this.huespedes = huespedes;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
	}


	public int getIdReserva() {
		return idReserva;
	}


	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}


	public int getIdPropiedad() {
		return idPublicacion;
	}


	public void setIdPropiedad(int idPropiedad) {
		this.idPublicacion = idPropiedad;
	}


	public int getIdUsuario() {
		return idUsuario;
	}


	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}


	public int getHuespedes() {
		return huespedes;
	}


	public void setHuespedes(int huespedes) {
		this.huespedes = huespedes;
	}


	public String getFechaInicio() {
		return fechaInicio;
	}


	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}


	public String getFechaFin() {
		return fechaFin;
	}


	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}


	public float getPrecio() {
		return precio;
	}


	public void setPrecio(float precio) {
		this.precio = precio;
	}


	public int getIdFactura() {
		return idFactura;
	}


	public void setIdFactura(int idFactura) {
		this.idFactura = idFactura;
	}


	public String getTipoPropiedad() {
		return tipoPropiedad;
	}


	public void setTipoPropiedad(String tipoPropiedad) {
		this.tipoPropiedad = tipoPropiedad;
	}


	public String getTitulo() {
		return titulo;
	}


	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	



}
	
	
	
	
	
	