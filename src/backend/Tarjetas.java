package backend;

public class Tarjetas {
	
	private int idTarjeta;
	private String numeroTarjeta;
	private String representante;
	private String   fechaVencimiento;
	private int CVV;
	
	public Tarjetas(String numeroTarjeta, String representante, String fechaVencimiento, int CVV) {
		super();
		//this.idTarjeta = idTarjeta;
		this.numeroTarjeta = numeroTarjeta;
		this.representante = representante;
		this.fechaVencimiento = fechaVencimiento;
		this.CVV =  CVV;
	}

	public int getIdTarjeta() {
		return idTarjeta;
	}

	public void setIdTarjeta(int idTarjeta) {
		this.idTarjeta = idTarjeta;
	}

	public String getNumeroTarjeta() {
		return numeroTarjeta;
	}

	public void setNumeroTarjeta(String numeroTarjeta) {
		this.numeroTarjeta = numeroTarjeta;
	}

	public String getRepresentante() {
		return representante;
	}

	public void setRepresentante(String representante) {
		this.representante = representante;
	}

	public String getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(String fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public int getCVV() {
		return CVV;
	}

	public void setCVV(int cVV) {
		CVV = cVV;
	}
	

}
