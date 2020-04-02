package backend;

import java.util.ArrayList;

public class HomeLink_Controller {

	private ArrayList<User> usuarios;
	private ArrayList<Propiedad> propiedades;
	private ArrayList<Publicaciones> publicaciones;
	private ArrayList<Reserva> reservas;
	
	public HomeLink_Controller() {
		super();
		new ArrayList<User>();
		new ArrayList<Publicaciones>();
		new ArrayList<Reserva>();
		new ArrayList<Propiedad>();
	}

	public ArrayList<User> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(ArrayList<User> usuarios) {
		this.usuarios = usuarios;
	}

	public ArrayList<Propiedad> getPropiedades() {
		return propiedades;
	}

	public void setPropiedades(ArrayList<Propiedad> propiedades) {
		this.propiedades = propiedades;
	}

	public ArrayList<Publicaciones> getPublicaciones() {
		return publicaciones;
	}

	public void setPublicaciones(ArrayList<Publicaciones> publicaciones) {
		this.publicaciones = publicaciones;
	}

	public ArrayList<Reserva> getReservas() {
		return reservas;
	}

	public void setReservas(ArrayList<Reserva> reservas) {
		this.reservas = reservas;
	}
	

}
