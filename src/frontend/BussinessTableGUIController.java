package frontend;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.mysql.cj.jdbc.CallableStatement;
import com.sun.org.apache.bcel.internal.generic.CPInstruction;

import backend.ConnectionMySqlDB;
import backend.Propiedad;
import backend.Reserva;
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

public class BussinessTableGUIController implements Initializable{

	@FXML
	private JFXButton btnClose;

	@FXML
	private TableView<Reserva> tableBussiness;

	@FXML
	private TableColumn<Reserva, String> columntype;

	@FXML
	private TableColumn<Reserva, String> columnPropertyId;

	@FXML
	private TableColumn<Reserva, String> columnPublicationId;


	@FXML
	private TableColumn<Reserva, String> columnStartD;

	@FXML
	private TableColumn<Reserva, String> columnEndD;

	@FXML
	private TableColumn<Reserva, String> columnIncome;

	ObservableList<Reserva> listReservas = FXCollections.observableArrayList();

	/******************************************************METHODS*******************************************************************************/


	@Override
	public void initialize(URL location, ResourceBundle resources) {
		initColumns();
		loadDataBussiness();
	}


	public void initColumns() {
		columnPropertyId.setCellValueFactory(new PropertyValueFactory<>("idPropiedad"));
		columnPublicationId.setCellValueFactory(new PropertyValueFactory<>("titulo"));
		columntype.setCellValueFactory(new PropertyValueFactory<>("tipoPropiedad"));
		columnStartD.setCellValueFactory(new PropertyValueFactory<>("fechaInicio"));
		columnEndD.setCellValueFactory(new PropertyValueFactory<>("fechaFin"));
		columnIncome.setCellValueFactory(new PropertyValueFactory<>("precio"));
	}

	public void loadDataBussiness() {

		ResultSet rs = null;

		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();	
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_tablaNegocios(?)}");
			mySqlStatement.setInt("pa_userid", HomeGUIController.usuarioActual.getId());
			rs = mySqlStatement.executeQuery();
		//	System.out.println("Los datos de sus Reservas han sido cargados");

		} catch (SQLException e) {
		//	System.out.println("Error al cargar sus Reservas!");
			e.printStackTrace();
		}
		try { /* RECORDAR LIMPIAR EL CODIGO DE TODO EL PROYECTO [Mucho codigo repetido]*/
			while(rs.next()){
				int propiedadid = rs.getInt("idpropiedad");//
				String titulo = rs.getString("titulo");
				String inicio = rs.getString("inicio");//
				String fin= rs.getString("fin");//
				String tipo= rs.getString("tipo");
				float precio = rs.getFloat("precio");

				//Reserva auxReserva = new Reserva(0, 0, 0, 0, inicio, fin,null,0);
				Reserva aux = new Reserva(0, 0, 0, 0, inicio, fin,null, precio);
				
				aux.setTitulo(titulo);
				aux.setTipoPropiedad(tipo);
				aux.setPrecio(precio);

				listReservas.add(aux);


			}
		} catch (Exception e) {
		}
		tableBussiness.getItems().setAll(listReservas);
	}


	@FXML
	void close(ActionEvent event) {
		Stage x = (Stage) btnClose.getScene().getWindow();
		x.close();
	}

}
