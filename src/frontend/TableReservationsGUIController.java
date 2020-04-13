package frontend;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.Reserva;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

public class TableReservationsGUIController implements Initializable {

    @FXML
    private JFXButton btnClose;

    @FXML
    private TableView<Reserva> tablereservations;

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
    
    ObservableList<Reserva> listMyReservas = FXCollections.observableArrayList();
    
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
				
				Reserva auxReserva = new Reserva(reservaid, 0, 0, huespedes, inicio, fin);
				auxReserva.setTitulo(titulo);
				auxReserva.setPrecio(precio);

				listMyReservas.add(auxReserva);


			}
		} catch (Exception e) {
		}
		tablereservations.getItems().setAll(listMyReservas);
	}
	
	@FXML
    void close(ActionEvent event) {
    	Stage x = (Stage) btnClose.getScene().getWindow();
    	x.close();
		
    }

}
