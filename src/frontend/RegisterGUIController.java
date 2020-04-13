package frontend;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;

import backend.ConnectionMySqlDB;
import backend.HomeLink_Controller;
import backend.User;
import de.jensd.fx.glyphs.materialdesignicons.MaterialDesignIconView;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class RegisterGUIController implements Initializable {

	@FXML
	private StackPane rootStackPane;

	@FXML
    private MaterialDesignIconView iconoCategory;
	
	@FXML
	private AnchorPane rootAnchorPane;
	@FXML
	private JFXTextField txtName;
	@FXML
	private JFXTextField txtLastname;
	@FXML
	private JFXTextField txtUsername;
	@FXML
	private JFXTextField txtEmail;
	@FXML
	private JFXPasswordField txtPassword;
	@FXML
	private JFXPasswordField txtConfirmPass;
	@FXML
	private JFXButton btnSignUp;
	@FXML
	private Button btnClose;
	@FXML
	private JFXComboBox<String> cbxGender;
	@FXML
	private JFXComboBox<String> cbxCategoryAccount;
	
	@FXML
    private JFXComboBox<String> cbxLocation;

    @FXML
    private JFXTextField txtnumber;
    
    private ObservableList<String> list = FXCollections.observableArrayList(llenarCombobox2());
    
	ObservableList<String> listGender = FXCollections.observableArrayList("Masculino","Femenino","Prefiero no decirlo");
	ObservableList<String> listTypeAccount = FXCollections.observableArrayList("Personal","Empresa");

	/*** METHODS ***/

	@FXML
	void closeWindow(ActionEvent event) {
		Stage stage = (Stage) btnClose.getScene().getWindow();
		stage.close();
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

	@FXML
	void setRegister(ActionEvent event) {
		//User_sql_query userQuery = new User_sql_query();
		
		if (AdminGUIController.admin != 1) {
			
			String name = txtName.getText();
			String lastname = txtLastname.getText();
			String gender = cbxGender.getSelectionModel().getSelectedItem().toString();
			String typeAccount = cbxCategoryAccount.getSelectionModel().getSelectedItem().toString();
			String username = txtUsername.getText();
			String email = txtEmail.getText();
			String password = txtPassword.getText();
			String confiPass = txtConfirmPass.getText();
			LocalDate today = LocalDate.now();
			String location = cbxLocation.getSelectionModel().getSelectedItem().toString();
			String telephone = txtnumber.getText();

			if (confiPass.equals(password)) {
				User nUser = new User(name, lastname, gender, typeAccount, username, email, password, today.toString());
				nUser.setTelephone_number(telephone);
				nUser.setCountry_location(location);
				if (HomeLink_Controller.create_add_user(nUser)) {
					System.out.println("con exito");
					JFXButton btnOk = new JFXButton("Ok!");
					PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Usuario registrado con exito.", null);
				}else {
					System.out.println("sin exito");
				}
			}
			else {
				
				JFXButton btnOk = new JFXButton("Ok!");
				PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Contraseñas no coinciden", null);
				System.out.println("contranse no coinciden");
			}
			
		}else {
			
			
			String name = txtName.getText();
			String lastname = txtLastname.getText();
			String gender = cbxGender.getSelectionModel().getSelectedItem().toString();
			String typeAccount = "Admin";
			String username = txtUsername.getText();
			String email = txtEmail.getText();
			String password = txtPassword.getText();
			String confiPass = txtConfirmPass.getText();
			LocalDate today = LocalDate.now();
			String location = cbxLocation.getSelectionModel().getSelectedItem().toString();
			String telephone = txtnumber.getText();

			if (confiPass.equals(password)) {
				User nUser = new User(name, lastname, gender, typeAccount, username, email, password, today.toString());
				nUser.setTelephone_number(telephone);
				nUser.setCountry_location(location);
				if (HomeLink_Controller.create_add_user(nUser)) {
					System.out.println("con exito");
					JFXButton btnOk = new JFXButton("Ok!");
					PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Usuario registrado con exito.", null);
				}else {
					System.out.println("sin exito");
				}
			}
			else {
				
				JFXButton btnOk = new JFXButton("Ok!");
				PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Contraseñas no coinciden", null);
				System.out.println("contranse no coinciden");
			}
			
			
			
			
			
			
		}
		
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		
		if (AdminGUIController.admin != 1) {
			cbxGender.setItems(listGender);
			cbxCategoryAccount.setItems(listTypeAccount);
			cbxLocation.setItems(list);
		} else {
			cbxGender.setItems(listGender);
			cbxLocation.setItems(list);
			cbxCategoryAccount.setVisible(false);
			iconoCategory.setVisible(false);
		}
		
		
		
		
		
	}

}
