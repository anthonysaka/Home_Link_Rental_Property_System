package frontend;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.Reserva;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class TableReservationsGUIController implements Initializable {
	
	@FXML
    private StackPane rootStackPane;

    @FXML
    private AnchorPane rootAnchorPane;

    @FXML
    private JFXButton btnClose;

    @FXML
    private TableView<Reserva> tablereservations;
    
    @FXML
    private JFXButton btnRate;
    
    @FXML
    private TableColumn<Reserva, String> columnreservationId;

    @FXML
    private TableColumn<Reserva, String> columntitle;
    
    @FXML
    private TableColumn<Reserva, String> columnguest;

    @FXML
    private TableColumn<Reserva, String> columnstart;

    @FXML
    private TableColumn<Reserva, String> columnend;

    @FXML
    private TableColumn<Reserva, String> columnprice;
    
    private double xoffset = 0;
	private double yoffset = 0;
    
	public static int index = 0;
	public  Reserva auxReserva;
    
    ObservableList<Reserva> listMyReservas = FXCollections.observableArrayList();
   
    
    public  int idpropiedad = 0;
    
    /*******************************************************METHODS**********************************************************************************/

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		initColumns();
		loadDataMyReservations();
		
	}
	
	public void initColumns() {
		columnreservationId.setCellValueFactory(new PropertyValueFactory<>("idReserva"));
		columntitle.setCellValueFactory(new PropertyValueFactory<>("titulo"));
		columnstart.setCellValueFactory(new PropertyValueFactory<>("fechaInicio"));
		columnend.setCellValueFactory(new PropertyValueFactory<>("fechaFin"));
		columnguest.setCellValueFactory(new PropertyValueFactory<>("huespedes"));
		columnprice.setCellValueFactory(new PropertyValueFactory<>("precio"));
	}
	
	public void loadDataMyReservations(){

		ResultSet rs = null;

		CallableStatement mySqlStatement = null; 
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();	
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_tablaReservas(?)}");
			mySqlStatement.setInt("pa_userid", HomeGUIController.usuarioActual.getId());
			rs = mySqlStatement.executeQuery();
			System.out.println("Los datos de sus Reservas han sido cargados");

		} catch (SQLException e) {
			System.out.println("Error al cargar sus Reservas!");
			e.printStackTrace();
		}
		try { 
			while(rs.next()){
				int reservaid = rs.getInt("id");
				String titulo = rs.getString("titulo");
				String inicio = rs.getString("start");
				String fin= rs.getString("end");
				int huespedes= rs.getInt("huespedes");
				float precio = rs.getFloat("precio");
				System.out.println("datos: "+ reservaid + "  "+ titulo+ " "+ inicio);
				idpropiedad = rs.getInt("id_property");
				auxReserva = new Reserva(reservaid, 0, 0, huespedes, inicio, fin, "", precio);
				auxReserva.setIdPropiedad(idpropiedad);
				auxReserva.setTitulo(titulo);
				auxReserva.setPrecio(precio);
				
				listMyReservas.add(auxReserva);


			}
		} catch (Exception e) {
		}
		tablereservations.getItems().setAll(listMyReservas);
	}
	
	@FXML
    void rating(ActionEvent event) throws IOException {
		
			index = tablereservations.getSelectionModel().getSelectedItem().getIdPropiedad();
			System.out.println("ESTE INDEX ES: "+index);
			
			Parent rootRegister = FXMLLoader.load(getClass().getResource("../frontend/ratingGUI.fxml"));
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
	
	@FXML
    void close(ActionEvent event) {
    	Stage x = (Stage) btnClose.getScene().getWindow();
    	x.close();
		
    }

}
