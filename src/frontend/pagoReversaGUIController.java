package frontend;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextField;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.HomeLink_Controller;
import backend.PublicacionesParaVisualizar;
import backend.Tarjetas;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;

public class pagoReversaGUIController extends ViewPublicationGUI implements Initializable{

	@FXML
	private StackPane rootStackPane;
	@FXML
	private AnchorPane rootAnchorPane;
	@FXML
	private Label lblTitulo;
	@FXML
	private Label lblFullName;
	@FXML
	private Label lblInditificacion;
	@FXML
	private Label lblUsername;
	@FXML
	private Label lblEmail;
	@FXML
	private JFXComboBox<String> cbxTarjeta;
	@FXML
	private JFXTextField txtNumTarjeta;
	@FXML
	private JFXTextField txtCardholder;
	@FXML
	private JFXTextField txtCVV;
	@FXML
	private JFXTextField txtMonthCard;
	@FXML
	private JFXButton btnPagar;
	@FXML
	private JFXTextField txtYearCard;
	@FXML
	private Label lblDir;
	@FXML
	private Label lblCarac1;
	@FXML
	private Label lblTipo;
	@FXML
	private Label lblFechaPubli;
	@FXML
	private Label lblPrecio;
	@FXML
	private Label lblUsuarioDue;
	@FXML
	private Label lblCarac2;
	@FXML
	private Label lblCarac5;
	@FXML
	private Label lblCarac3;
	@FXML
	private Label lblCarac6;
	@FXML
	private Label lblCarac7;
	@FXML
	private Label lblCarac4;
	@FXML
	private Label lblCarac8;
	@FXML
	private Label lblCaracOtro;
	@FXML
	private Label lblFechaEstadia;
	@FXML
	private Label lblCantPersona;
	@FXML
	private Label lblFeeService;
	@FXML
	private Label lblPrecioTotal;
	@FXML
	private Label lblCantNoche;

	PublicacionesParaVisualizar publicacion = auxlist;
	ObservableList<Tarjetas> listCard = FXCollections.observableArrayList(llenarComboTarjeta());
	ObservableList<String> listNumCard = FXCollections.observableArrayList();
	private static float totalprice = 0;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		String caracteristicas = publicacion.getCaracterisitcas();
		String[] caracteSplited = caracteristicas.split(",");

		lblDir.setText(publicacion.getDireccion());
		lblTipo.setText(publicacion.getTipo());
		lblFechaPubli.setText(publicacion.getFechaPublicacion());
		lblUsuarioDue.setText(publicacion.getUsernamePublicador());

		lblCarac1.setText(caracteSplited[0]);
		lblCarac2.setText(caracteSplited[1]);
		lblCarac3.setText(caracteSplited[2]);
		lblCarac4.setText(caracteSplited[3]);
		lblCarac5.setText(caracteSplited[4]);
		lblCarac6.setText(caracteSplited[5]);
		lblCarac7.setText(caracteSplited[6]);
		lblCarac8.setText(caracteSplited[7]);
		lblCaracOtro.setText(caracteSplited[8]);

		lblPrecio.setText(String.valueOf(publicacion.getPrecio())); //Precio por noche.

		lblFechaEstadia.setText(dataIn + " - " + dataOut);
		lblCantPersona.setText(String.valueOf(cantGuest));
		lblCantNoche.setText(String.valueOf(cantNoche));

		float servicefee = (float) (0.03 * publicacion.getPrecio()); // calculo service fee

		lblFeeService.setText(String.valueOf(servicefee));

		totalprice = (cantNoche * publicacion.getPrecio() * cantGuest) + servicefee; //calculo precio total. publicacion.getPrecio() -> precio por noche.

		lblPrecioTotal.setText(String.valueOf(totalprice)); 


		lblUsername.setText(usuarioActual.getUsername());
		lblInditificacion.setText(String.valueOf(usuarioActual.getId()));
		lblEmail.setText(usuarioActual.getEmail());

		for (Tarjetas c : listCard) {
			listNumCard.add(c.getNumeroTarjeta());
		}

		cbxTarjeta.setItems(listNumCard);
	}


	public static ArrayList<Tarjetas> llenarComboTarjeta()
	{
		ArrayList<Tarjetas> listaTarjeta = new ArrayList<Tarjetas>();

		Statement sentencia = null;
		ResultSet rs = null;

		String Query = "SELECT * FROM t_card WHERE user_owner = " + "'"+usuarioActual.getUsername()+"';";
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			rs = sentencia.executeQuery(Query);
			System.out.println("TABLA BIEN");
		} catch (Exception e) {
			System.out.println("No Correcto");
		}
		try {
			while(rs.next()){
				int id = rs.getInt("id");
				String num = rs.getString("num_card");
				String date = rs.getString("expiration_date");
				String holdername = rs.getString("holder_fullname");
				int cvv = rs.getInt("cvv");
				Tarjetas auxTar = new Tarjetas(num, holdername, date, cvv);
				auxTar.setIdTarjeta(id);
				listaTarjeta.add(auxTar);
			}
		} catch (Exception e) {
		}

		return listaTarjeta;
	}

	@FXML
	void fillDataCard(ActionEvent event) {
		if (cbxTarjeta.getSelectionModel().getSelectedIndex() < 0) {
			txtCardholder.setDisable(false);
			txtMonthCard.setDisable(false);
			txtYearCard.setDisable(false);
			txtNumTarjeta.setDisable(false);
			txtCVV.setDisable(false);
		}
	}

	public int searchIdCard(String numCard) {
		int aux = 0;
		boolean found = false;
		int i = 0;

		while (!found && i < listCard.size()) {
			if(listCard.get(i).getNumeroTarjeta().equalsIgnoreCase(numCard)) {
				found = true;
				aux = listCard.get(i).getIdTarjeta();
			}
			i++;
		}
		return aux; //Retorna el id del num de tarjeta

	}

	@FXML
	void Pay(ActionEvent event) throws SQLException {
		/********************/
		int id =	searchIdCard(cbxTarjeta.getSelectionModel().getSelectedItem());
		CallableStatement mySqlStatement = null ; // call stored procedure
		CallableStatement mySqlStatement1 = null ;
		Connection myConnection = HomeLink_Controller.getConnectionMySqlDB();
		mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_insertReservation(?,?,?,?,?,?,?)}");
		mySqlStatement.setInt("pa_guests", cantGuest);
		mySqlStatement.setString("pa_inicio", dataIn);
		mySqlStatement.setString("pa_fin", dataOut);
		mySqlStatement.setInt("pa_userid", usuarioActual.getId());
		mySqlStatement.setInt("pa_publicationid", publicacion.getId());
		mySqlStatement.setInt("pa_cardid", id);
		mySqlStatement.setFloat("pa_precio",totalprice);
		if (mySqlStatement.executeQuery() != null) {
			System.out.println("reservacion insertada");
		}
		mySqlStatement1 = (CallableStatement) myConnection.prepareCall("{CALL sp_insertFactura(?,?)}");
		mySqlStatement1.setInt(1, getIdReservationFromDB());
		mySqlStatement1.setInt(2, (int) cantNoche);
		System.out.println(getIdReservationFromDB());
		if (mySqlStatement1.executeQuery() != null) {
			System.out.println("factura insertada");
		}
		JFXButton btnOk = new JFXButton("Ok!");
		PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Reservación y Factura realizada con exito!.", null);
		
		myConnection.close();
		/***********************/
	}

	public int getIdReservationFromDB() {

		Statement sentencia = null;
		ResultSet rs = null;
		int id = 0;
		String Query = "select num_reservation from t_reservation order by num_reservation desc limit 1;";
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			rs = sentencia.executeQuery(Query);
			System.out.println("TABLA BIEN");
		} catch (Exception e) {
			System.out.println("No Correcto");
		}
		try {
			while(rs.next()){
				id = rs.getInt("num_reservation");
			}
		} catch (Exception e) {
		}
		return id;
	}



}
