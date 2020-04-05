package frontend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import com.mysql.cj.jdbc.CallableStatement;
import com.sun.org.apache.xpath.internal.objects.XObject;

import backend.ConnectionMySqlDB;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Hyperlink;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class LoginGUIController extends Application {

	@FXML
	private Hyperlink hlinkCreateAccount;
	@FXML
	private JFXTextField txtUsername;
	@FXML
	private JFXPasswordField txtPassword;
	@FXML
	private JFXButton btnLogin;
	@FXML
	private Button btnMinimize;
	@FXML
	private Button btnClose;


	private double xoffset = 0;
	private double yoffset = 0;

	@Override
	public void start(Stage stageLogin) throws Exception {

		Parent rootLogin = FXMLLoader.load(LoginGUIController.class.getResource("../frontend/loginGUI.fxml"));
		Scene sceneLogin = new Scene(rootLogin);

		stageLogin.getIcons().add(new Image(LoginGUIController.class.getResourceAsStream("../frontend/images/bg_home_link.png")));
		stageLogin.setScene(sceneLogin);
		stageLogin.setResizable(false);
		//stageLogin.setAlwaysOnTop(true);
		stageLogin.initStyle(StageStyle.TRANSPARENT);
		stageLogin.show();

		/*******
		 * EventHandler to Move Undecorated Window (Stage) Adapted from: StackOverflow
		 ******/
		rootLogin.setOnMousePressed(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				xoffset = stageLogin.getX() - event.getScreenX();
				yoffset = stageLogin.getY() - event.getScreenY();
			}
		});
		rootLogin.setOnMouseDragged(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				stageLogin.setX(event.getScreenX() + xoffset);
				stageLogin.setY(event.getScreenY() + yoffset);
			}
		});
		/***************************************************************/
	}

	/********
	 * Methods
	 * 
	 * @throws IOException
	 *******/
	@FXML
	public void openRegisterForm(ActionEvent event) throws IOException {

		Parent rootRegister = FXMLLoader.load(getClass().getResource("../frontend/AddcardGUIController.fxml"));
		Stage stageRegister = new Stage();
		Scene sceneRegister = new Scene(rootRegister);

		stageRegister.setScene(sceneRegister);
		stageRegister.setResizable(false);
		//stageRegister.setAlwaysOnTop(true);
		stageRegister.initStyle(StageStyle.TRANSPARENT);
		//	stageRegister.initModality(Modality.APPLICATION_MODAL);
		stageRegister.show();

		/*******
		 * EventHandler to Move Undecorated Window (Stage) Adapted from: StackOverflow
		 ******/
		rootRegister.setOnMousePressed(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				xoffset = stageRegister.getX() - event.getScreenX();
				yoffset = stageRegister.getY() - event.getScreenY();
			}
		});
		rootRegister.setOnMouseDragged(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				stageRegister.setX(event.getScreenX() + xoffset);
				stageRegister.setY(event.getScreenY() + yoffset);
			}
		});
		/***************************************************************/
	}

	@FXML
	boolean loginIn(ActionEvent event) throws IOException { //SAKA AQUI AYUDA
		/*
		Parent rootRegister = FXMLLoader.load(getClass().getResource("../frontend/HomeGUIController.fxml"));
		Stage stageRegister = new Stage();
		Scene sceneRegister = new Scene(rootRegister);
		stageRegister.setScene(sceneRegister);
		stageRegister.setResizable(false);
		//stageRegister.setAlwaysOnTop(true);
		stageRegister.initStyle(StageStyle.TRANSPARENT);
	//	stageRegister.initModality(Modality.APPLICATION_MODAL);
		stageRegister.show();
		 */
		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_loginIn(?,?)}");
			mySqlStatement.setString("pa_username", txtUsername.getText());
			mySqlStatement.setString("pa_password", txtPassword.getText());
			ConnectionMySqlDB.resultado = mySqlStatement.executeQuery();
			if (ConnectionMySqlDB.resultado.first()) {
				System.out.println("Iniciando sesion... Sesion iniciada con Exito!");	
			} else {
				System.out.println("Hubo un error, por favor verifique su User y Password");	
			}
			myConnection.close();
			return true;
		} catch (SQLException e) {
			System.out.println("Hubo un error con la base de datos");
			e.printStackTrace();
			return false;
		}
	}


	@FXML
	void closeWindow(ActionEvent event) {
		Stage stage = (Stage) btnClose.getScene().getWindow();
		stage.close();
	}

	@FXML
	void minimizeWindow(ActionEvent event) {
		Stage stage = (Stage) btnClose.getScene().getWindow();
		stage.setIconified(true);
	}


}


