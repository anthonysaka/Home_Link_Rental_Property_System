package backend;

public class Reserva {
	
	private int idReserva; 
	private int huespedes;
	private String fechaInicio;
	private String fechaFin;
	private String idUsuario;
	private String idTarjeta;
	private String idPropiedad;
	
	
	public Reserva(int idReserva, int huespedes, String fechaInicio, String fechaFin, String metodoPago,
			String idUsuario, String idTarjeta, String idPropiedad) {
		super();
		this.idReserva = idReserva;
		this.huespedes = huespedes;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.idUsuario = idUsuario;
		this.idTarjeta = idTarjeta;
		this.idPropiedad = idPropiedad;
	}


	public int getIdReserva() {
		return idReserva;
	}


	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
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


	public String getIdUsuario() {
		return idUsuario;
	}


	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}


	public String getIdTarjeta() {
		return idTarjeta;
	}


	public void setIdTarjeta(String idTarjeta) {
		this.idTarjeta = idTarjeta;
	}


	public String getIdFactura() {
		return idPropiedad;
	}


	public void setIdFactura(String idFactura) {
		this.idPropiedad = idFactura;
	}
	
	
	
	
	
	
	
	

}
