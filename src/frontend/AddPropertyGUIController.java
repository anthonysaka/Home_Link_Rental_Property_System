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

public class AddPropertyGUIController implements Initializable{

	@FXML
	private JFXTextField txtAddress;

	@FXML
	private JFXTextField txtCharacteristics;

	@FXML
	private JFXComboBox<String> cbxpropertyType;

	@FXML
	private Button btnSave;

	@FXML
	private Button btnCancel;

	ObservableList<String> listTypeProperty= FXCollections.observableArrayList("Apartamento", "Villa", "Pent-House", "Hacienda", "Finca");
	
	

	@FXML
	void saveProperty(ActionEvent event) {

		String address = txtAddress.getText();
		String characteristics = txtCharacteristics.getText();
		String type = cbxpropertyType.getSelectionModel().getSelectedItem().toString();
		String status = "Inactiva";

		Propiedad property = new Propiedad(type, address, status, characteristics);

		User.insertarPropiedades(property);
	}

	@FXML
	void close(ActionEvent event) {

	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		cbxpropertyType.setItems(listTypeProperty);
		
	}
	
	
	




}

