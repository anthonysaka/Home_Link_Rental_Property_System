package backend;

public class Reserva {
	
	private int idReserva; 
	private int idPropiedad;
	private int idUsuario;
	private int huespedes;
	private String fechaInicio;
	private String fechaFin;
	
	
	public Reserva(int idReserva, int idPropiedad, int idUsuario, int huespedes, String fechaInicio, String fechaFin) {
		super();
		this.idReserva = idReserva;
		this.idPropiedad = idPropiedad;
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
		return idPropiedad;
	}


	public void setIdPropiedad(int idPropiedad) {
		this.idPropiedad = idPropiedad;
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
	



}
	
	
	
	
	
	