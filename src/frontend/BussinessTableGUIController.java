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
import backend.Publicacion;
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
    private TableColumn<Reserva, String> columnPropertyId;

    @FXML
    private TableColumn<Reserva, String> columnPublicationId;

    @FXML
    private TableColumn<Reserva, String> columBillId;

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
		
	}
	
	
	public void initColumns() {
		columnPropertyId.setCellValueFactory(new PropertyValueFactory<>("idPropiedad"));
		columnPublicationId.setCellValueFactory(new PropertyValueFactory<>("idPublicacion"));
		columBillId.setCellValueFactory(new PropertyValueFactory<>("idFactura"));
		columnStartD.setCellValueFactory(new PropertyValueFactory<>("fechaInicio"));
		columnEndD.setCellValueFactory(new PropertyValueFactory<>("fechaFin"));
		columnIncome.setCellValueFactory(new PropertyValueFactory<>("precio"));
	}
	
	public void loadDataAutorizarPublicaciones() {
		
		ResultSet rs = null;

    	CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();	
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_tablaNegocios(?)}");
			mySqlStatement.setInt("pa_userid", HomeGUIController.usuarioActual.getId());
			rs = mySqlStatement.executeQuery();
			System.out.println("Los datos de sus publicaciones han sido cargados");
		
		} catch (SQLException e) {
			System.out.println("Error al cargar sus publicaciones!");
			e.printStackTrace();
		}
		try { /* RECORDAR LIMPIAR EL CODIGO DE TODO EL PROYECTO [Mucho codigo repetido]*/
			while(rs.next()){
				String tipo = rs.getString("type");
				String dir = rs.getString("Address_Property");
				String caract = rs.getString("Characteristic_Property");
				String feedback= rs.getString("rating");
				boolean status = rs.getBoolean("status");
				System.out.println("EL ESTATUS ES:"+status);
				
				if (status == true) {
					Propiedad auxPro = new Propiedad(tipo, dir, "Publicada", caract);
					auxPro.setFeedbacks(feedback);
				//	listPropiedad.add(auxPro);	
				}else {
					Propiedad auxPro = new Propiedad(tipo, dir, "Inactiva", caract);
					auxPro.setFeedbacks(feedback);
					//listPropiedad.add(auxPro);	
				}
				
				
			}
		} catch (Exception e) {
		}

		//tablapropiedades.getItems().setAll(listPropiedad);
		
		/* RECORDAR CAMBIAr NOMBRES DE LAS TABLAS, ya que la BD se va a crear 
		 * completa de nuevo, por mal convencion de nombre y logistica
		 
		Statement sentencia = null;
		ResultSet rs = null;
		String Query = "SELECT id, titulo, date, id_property, price, status FROM t_publication WHERE id_owner = "+HomeGUIController.usuarioActual.getId();
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			rs = sentencia.executeQuery(Query);
			System.out.println("TABLA PUBLICACIONES BIEN");
		} catch (Exception e) {
			System.out.println("TABLA PUBLICACIONES NO BIEN");
		}
		try { /* RECORDAR LIMPIAR EL CODIGO DE TODO EL PROYECTO [Mucho codigo repetido]
			while(rs.next()){
				

				listReservas.addAll();
			}
		} catch (Exception e) {
		}

		tableBussiness.getItems().setAll(listReservas);*/
	}
	
	
	
	
	
	
	
	
	
	
	@FXML
    void close(ActionEvent event) {
    	Stage x = (Stage) btnClose.getScene().getWindow();
    	x.close();
    }

}
