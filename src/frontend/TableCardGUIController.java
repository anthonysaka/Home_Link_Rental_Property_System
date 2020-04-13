package frontend;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import backend.ConnectionMySqlDB;
import backend.Tarjetas;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;

public class TableCardGUIController implements Initializable {

	@FXML
	private JFXButton btnAddCard;

	@FXML
	private JFXButton btnModifyCard;

	@FXML
	private Button btnClose;

	@FXML
	private JFXButton btnDeleteCard;

	@FXML
	private TableView<Tarjetas> table;

	@FXML
	private TableColumn<Tarjetas, String> tablenombre;

	@FXML
	private TableColumn<Tarjetas, String> tablenumero;

	@FXML
	private TableColumn<Tarjetas, String> tablefecha;

	@FXML
	private TableColumn<Tarjetas, String> tablecvv;
	
	private double xoffset = 0;
	private double yoffset = 0;
	ObservableList<Tarjetas> data = FXCollections.observableArrayList();

	/*****************************METODOS**************************/    


	@FXML
	void closeWindow(ActionEvent event) {
		Stage stage = (Stage) btnClose.getScene().getWindow();
		stage.close();  
		HomeGUIController.llenarCombo();
	}

	@FXML
	void AddNewCard(ActionEvent event) {

	}

	public void getcardData(){

		Statement sentencia = null;
		ResultSet resultado = null;
		String Query = "SELECT id id, holder_fullname, num_card, expiration_date, cvv FROM t_card WHERE user_owner = "+ "'"+ HomeGUIController.usuarioActual.getUsername()+"'";
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			resultado = sentencia.executeQuery(Query);
		

		} catch (Exception e) {
			
		}
		try {
			while (resultado.next()) {
			
				String numero = resultado.getString("num_card");
				String representante = resultado.getString("holder_fullname");
				String fecha = resultado.getString("expiration_date");
				int codigo = Integer.valueOf(resultado.getString("cvv"));
				Tarjetas datos = new Tarjetas(numero, representante, fecha, codigo);		
				data.add(datos);
				System.out.println("Datos de tarjetas guardadas obtenidos");
			}
			
		} catch (Exception e) {
			
			System.out.println("Error al cargar las tarjetas guardadas!");
			
		}

		table.getItems().setAll(data);

	}

	public void initColumns() {

		tablenombre.setCellValueFactory(new PropertyValueFactory<>("representante"));
		tablenumero.setCellValueFactory(new PropertyValueFactory<>("numeroTarjeta"));
		tablefecha.setCellValueFactory(new PropertyValueFactory<>("fechaVencimiento"));
		tablecvv.setCellValueFactory(new PropertyValueFactory<>("CVV"));


	}

	@FXML
	void insertCard(ActionEvent event) throws IOException {
		Parent rootRegister = FXMLLoader.load(getClass().getResource("../frontend/addCardGUI.fxml"));
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

	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		initColumns();
		getcardData();

	}

}
