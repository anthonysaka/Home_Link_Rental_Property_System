package backend;

public class Reserva {
	
	private int idReserva; 
	private int idPublicacion;
	private int idUsuario;
	private int idPropiedad;
	private int huespedes;
	private String fechaInicio;
	private String fechaFin;
	private float precio;
	private String tipoPropiedad;
	private String titulo;
	
	private String username;
	private String num_card;
	private String tipo;
	private String dir;
	
	
	public Reserva(int idReserva, int idPublicacion, int idUsuario, int huespedes, String fechaInicio, String fechaFin, String num_card, Float price) {
		super();
		this.idReserva = idReserva;
		this.setIdPublicacion(idPublicacion);
		this.idUsuario = idUsuario;
		this.huespedes = huespedes;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.setNum_card(num_card);
		this.precio = price;

	}


	public int getIdReserva() {
		return idReserva;
	}


	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
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


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getNum_card() {
		return num_card;
	}


	public void setNum_card(String num_card) {
		this.num_card = num_card;
	}


	public int getIdPublicacion() {
		return idPublicacion;
	}


	public void setIdPublicacion(int idPublicacion) {
		this.idPublicacion = idPublicacion;
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


	public String getDir() {
		return dir;
	}


	public void setDir(String dir) {
		this.dir = dir;
	}
	



}
	
	
	
	
	
	