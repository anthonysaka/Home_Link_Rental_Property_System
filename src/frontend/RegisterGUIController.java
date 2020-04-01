package frontend;

import java.net.URL;
import java.time.LocalDate;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;

import backend.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.stage.Stage;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class RegisterGUIController implements Initializable {

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

	ObservableList<String> listGender = FXCollections.observableArrayList("Masculino","Femenino","Prefiero no decirlo");
	ObservableList<String> listTypeAccount = FXCollections.observableArrayList("Personal","Empresa");

	/*** METHODS ***/
	@FXML
	void closeWindow(ActionEvent event) {
		Stage stage = (Stage) btnClose.getScene().getWindow();
		stage.close();
	}

	@FXML
	void setRegister(ActionEvent event) {
		//User_sql_query userQuery = new User_sql_query();
		String name = txtName.getText();
		String lastname = txtLastname.getText();
		String gender = cbxGender.getSelectionModel().getSelectedItem().toString();
		String typeAccount = cbxCategoryAccount.getSelectionModel().getSelectedItem().toString();
		String username = txtUsername.getText();
		String email = txtEmail.getText();
		String password = txtPassword.getText();
		String confiPass = txtConfirmPass.getText();
		LocalDate today = LocalDate.now();

		if (confiPass.equals(password)) {
			User nUser = new User(name, lastname, gender, typeAccount, username, email, password, today.toString());
			if (User.create_add_user(nUser)) {
			System.out.println("con exito");
			}else {
				System.out.println("sin exito");
			}
		}
		else {
		System.out.println("contranse no coinciden");
		}
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		cbxGender.setItems(listGender);
		cbxCategoryAccount.setItems(listTypeAccount);

	}

}
