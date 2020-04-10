package frontend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import com.mysql.cj.jdbc.CallableStatement;
import com.mysql.cj.xdevapi.Result;
import com.sun.org.apache.xpath.internal.objects.XObject;

import backend.ConnectionMySqlDB;
import backend.User;
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
	private  JFXTextField txtUsername;
	@FXML
	private  JFXPasswordField txtPassword;
	@FXML
	private JFXButton btnLogin;
	@FXML
	private Button btnMinimize;
	@FXML
	private Button btnClose;
	
	public static User loggedUser = null;
	
	public ResultSet resulter;
	public static int x = 0;
	private static double xoffset = 0;
	private static double yoffset = 0;

	@Override
	public void start(Stage stageLogin) throws Exception {

		Parent rootLogin = FXMLLoader.load(LoginGUIController.class.getResource("../frontend/loginGUI.fxml")); /** cambie temporal*/
		Scene sceneLogin = new Scene(rootLogin);

		stageLogin.getIcons().add(new Image(LoginGUIController.class.getResourceAsStream("../frontend/images/bg_home_link.png")));
		stageLogin.setScene(sceneLogin);
		stageLogin.setResizable(false);
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

		Parent rootRegister = FXMLLoader.load(getClass().getResource("../frontend/registerGUI.fxml"));
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
	public int loginIn(ActionEvent event) throws IOException { //SAKA AQUI AYUDA
		
		 x = 0;
		
		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_loginIn(?,?)}");
			mySqlStatement.setString("pa_username", txtUsername.getText());
			mySqlStatement.setString("pa_password", txtPassword.getText());
			resulter = mySqlStatement.executeQuery();
			if (resulter.first()) {
				
				loggedUser = new User(resulter.getString("name"), resulter.getString("lastname"), resulter.getString("gender"), resulter.getString("type"), resulter.getString("username"), resulter.getString("email"), resulter.getString("password"), resulter.getString("created_date"));	

				//loggedUser.setCountry_location(resulter.getString("country_location_id")); //arreglar esto
				//loggedUser.setCountry_location_id(resulter.getInt("country_location_id"));
				loggedUser.setTelephone_number(resulter.getString("telephone_number"));
				loggedUser.setStatus(resulter.getBoolean("status"));
				loggedUser.setId(Integer.valueOf(resulter.getString("id")));
				
				System.out.println("Iniciando sesion... Sesion iniciada con Exito!");
				
				HomeGUIController.usuarioActual = loggedUser;
				
				Stage stage = (Stage) btnClose.getScene().getWindow();
				stage.close();

				Parent rootRegister = FXMLLoader.load(getClass().getResource("../frontend/homeGUI.fxml")); /* cambie temporalmente el loading */
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
				x = loggedUser.getId();

				
			} else {
				System.out.println("Hubo un error, por favor verifique su User y Password");	
				myConnection.close();
				return 0;
			}
			
		} catch (SQLException e) {
			System.out.println("Hubo un error con la base de datos");
			e.printStackTrace();
			
		}
	
		return x;
	}


	@FXML
	void closeWindow(ActionEvent event) {
		//Stage stage = (Stage) btnClose.getScene().getWindow();
		//stage.close();
		System.exit(0);
	}

	@FXML
	void minimizeWindow(ActionEvent event) {
		Stage stage = (Stage) btnClose.getScene().getWindow();
		stage.setIconified(true);
	}


}


