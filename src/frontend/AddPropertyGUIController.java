package frontend;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextField;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.Propiedad;
import backend.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;

import com.jfoenix.controls.JFXCheckBox;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextField;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Spinner;
import javafx.scene.control.SpinnerValueFactory;
import javafx.stage.Stage;

public class AddPropertyGUIController implements Initializable{

	@FXML
	private JFXTextField txtCity;

	@FXML
	private JFXTextField txtOthers;

	@FXML
	private JFXComboBox<String> cbxpropertyType;

	@FXML
	private Button btnSave;

	@FXML
	private Button btnCancel;

	@FXML
	private JFXComboBox<String> cbxCountry;

	@FXML
	private JFXTextField txtStreet;

	@FXML
	private Spinner<Integer> spnCapacity;

	@FXML
	private Spinner<Integer> spnRoom;

	@FXML
	private Spinner<Integer> spnBed;

	@FXML
	private Spinner<Integer> spnBathroom;

	@FXML
	private JFXCheckBox chkWifi;

	@FXML
	private JFXCheckBox chkAirCond;

	@FXML
	private JFXCheckBox chkKitchen;

	@FXML
	private JFXCheckBox chkPool;

	private ObservableList<String> list = FXCollections.observableArrayList(llenarCombobox2());

	private ObservableList<String> listTypeProperty= FXCollections.observableArrayList("Apartamento", "Villa", "Pent-House", "Hacienda", "Finca");


	String tipoPropiedad = null;
	String pais = null;
	String ciudad = null;
	String calle = null;
	int capacidad = 0;
	int habitaciones = 0;
	int camas = 0;
	int bathroom = 0;
	boolean wifi = false;
	boolean kitchen = false;
	boolean AirCond = false;
	boolean pool = false;
	String others = null;

	SpinnerValueFactory<Integer> valuecapacity = new SpinnerValueFactory.IntegerSpinnerValueFactory(1, 50, 1);
	SpinnerValueFactory<Integer> valueroom = new SpinnerValueFactory.IntegerSpinnerValueFactory(1, 20, 1);
	SpinnerValueFactory<Integer> valuebed = new SpinnerValueFactory.IntegerSpinnerValueFactory(1, 40, 1);
	SpinnerValueFactory<Integer> valuebathroom = new SpinnerValueFactory.IntegerSpinnerValueFactory(1, 25, 1);



	@FXML
	void close(ActionEvent event) {
		Stage x = (Stage) btnCancel.getScene().getWindow();
		x.close();
	}

	@FXML
	void saveProperty(ActionEvent event) {

		tipoPropiedad = cbxpropertyType.getSelectionModel().getSelectedItem().toString();
		pais = cbxCountry.getSelectionModel().getSelectedItem().toString();
		ciudad = txtCity.getText();
		calle = txtStreet.getText();
		capacidad = spnCapacity.getValue();
		habitaciones = spnRoom.getValue();
		camas = spnBed.getValue();
		bathroom = spnBathroom.getValue();
		wifi = chkWifi.isSelected();
		kitchen = chkKitchen.isSelected();
		AirCond = chkAirCond.isSelected();
		pool = chkPool.isSelected();
		others = txtOthers.getText();

		insertarDireccion(pais, ciudad, calle);
		insertarCaracteristica(capacidad, habitaciones, camas, bathroom, wifi, kitchen, AirCond, pool, others);

		CallableStatement mySqlStatement1 = null ; // call stored procedure
		try {
			Connection myConnection1 = ConnectionMySqlDB.getConnectionMySqlDB();	

			mySqlStatement1 = (CallableStatement) myConnection1.prepareCall("{CALL sp_insertProperty(?,?,?,?)}");
			mySqlStatement1.setString("pa_tipo", tipoPropiedad);
			mySqlStatement1.setInt("pa_idDireccion", idDireccion());
			mySqlStatement1.setInt("pa_idChar", idCaracteristicas());
			mySqlStatement1.setInt("id_user", HomeGUIController.usuarioActual.getId());
			mySqlStatement1.executeQuery();
			myConnection1.close();
			System.out.println("Su Propiedad ha sido guardad");

		} catch (SQLException e) {
			System.out.println("Error al guardar su propiedad");
			e.printStackTrace();

		}
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		cbxpropertyType.setItems(listTypeProperty);
		cbxCountry.setItems(list);
		spnBathroom.setValueFactory(valuebathroom);
		spnBed.setValueFactory(valuebed);
		spnCapacity.setValueFactory(valuecapacity);
		spnRoom.setValueFactory(valueroom);
	}


	public static ArrayList<String> llenarCombobox() {
		Statement sentencia = null;
		ResultSet resultado = null;
		ArrayList<String> lista = new ArrayList<String>();
		String Query = "SELECT DISTINCT id FROM t_property WHERE id_user_owner ="+ String.valueOf(HomeGUIController.usuarioActual.getId()+ "AND status = 0");
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			resultado = sentencia.executeQuery(Query);
			System.out.println("Correcto");
		} catch (Exception e) {
			System.out.println("No Correcto");
		}
		try {
			while(resultado.next()){
				lista.add(resultado.getString("id"));
			}
		} catch (Exception e) {
		}
		return lista;
	}

	public static ArrayList<String> llenarCombobox2() {
		Statement sentencia = null;
		ResultSet resultado = null;
		ArrayList<String> lista = new ArrayList<String>();
		String Query = "SELECT name nombres FROM t_country";
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			resultado = sentencia.executeQuery(Query);
			System.out.println("Paises cargados");
		} catch (Exception e) {
			System.out.println("Paises no cargados");
		}
		try {
			while(resultado.next()){
				lista.add(resultado.getString("nombres"));
			}
		} catch (Exception e) {
		}
		return lista;
	}

	public int idDireccion() {
		Statement sentencia = null;
		ResultSet resultado = null;
		int x = 0;
		String Query = "SELECT id_address id FROM t_address_property ORDER BY id_address DESC LIMIT 1";
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			resultado = sentencia.executeQuery(Query);


		} catch (Exception e) {

		}

		try {
			while (resultado.next()) {
				x = Integer.valueOf(resultado.getString("id"));
				System.out.println("ID DIRECCION CARGADO");	
			}
			
		} catch (Exception e) {
			System.out.println("ID DIRECCION no cargados");
		}
		System.out.println("EL ID DIRECCION ES:"+x);
		return x;
	}

	public int idCaracteristicas() {
		Statement sentencia = null;
		ResultSet resultado = null;
		int x = 0;
		String Query = "SELECT id_characteristic id FROM t_characteristic_property ORDER BY id_characteristic DESC LIMIT 1";
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			resultado = sentencia.executeQuery(Query);

		} catch (Exception e) {

		}

		try {
			while (resultado.next()) {
				x = Integer.valueOf(resultado.getString("id"));
				System.out.println("ID CARACTERISTICAS CARGADO");
			}
		} catch (Exception e) {
			System.out.println("ID CARACTERISTICAS no cargados");
		}
		System.out.println("EL ID CARACTERISTICAS ES:"+x);
		return x;
	}

	void insertarDireccion(String pais, String ciudad, String calle) {

		CallableStatement mySqlStatement1 = null ; // call stored procedure
		try {
			Connection myConnection1 = ConnectionMySqlDB.getConnectionMySqlDB();	

			mySqlStatement1 = (CallableStatement) myConnection1.prepareCall("{CALL sp_insertarDireccion(?,?,?)}");

			mySqlStatement1.setString("pa_pais", pais);
			mySqlStatement1.setString("pa_ciudad", ciudad);
			mySqlStatement1.setString("pa_calle", calle);


			mySqlStatement1.executeQuery();
			myConnection1.close();
			System.out.println("Su Direccion ha sido guardada");

		} catch (SQLException e) {
			System.out.println("Error al guardar su direccion");
			e.printStackTrace();

		}

	}

	void insertarCaracteristica(int capacidad, int habitaciones, int camas, int bathroom, boolean wifi, boolean kitchen, boolean AirCond, boolean pool, String others) {

		CallableStatement mySqlStatement1 = null ; // call stored procedure
		try {
			Connection myConnection1 = ConnectionMySqlDB.getConnectionMySqlDB();	

			mySqlStatement1 = (CallableStatement) myConnection1.prepareCall("{CALL sp_insertarCaracteristicas(?,?,?,?,?,?,?,?,?)}");

			mySqlStatement1.setInt("pa_capacidad", capacidad);
			mySqlStatement1.setInt("pa_habitaciones", habitaciones);
			mySqlStatement1.setInt("pa_camas", camas);
			mySqlStatement1.setInt("pa_bathroom", bathroom);
			mySqlStatement1.setBoolean("pa_wifi", wifi);
			mySqlStatement1.setBoolean("pa_kitchen", kitchen);
			mySqlStatement1.setBoolean("pa_AirCond", AirCond);
			mySqlStatement1.setBoolean("pa_pool", pool);
			mySqlStatement1.setString("pa_other", others);


			mySqlStatement1.executeQuery();
			myConnection1.close();
			System.out.println("Sus Caracteristicas han sido guardadas");

		} catch (SQLException e) {
			System.out.println("Error al guardar sus Caracteristicas");
			e.printStackTrace();

		}

	}

}







