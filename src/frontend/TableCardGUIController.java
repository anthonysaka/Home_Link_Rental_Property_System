package frontend;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;

import backend.ConnectionMySqlDB;
import backend.Tarjetas;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.cell.PropertyValueFactory;

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
    private TableColumn<Tarjetas, String> tablenombre;

    @FXML
    private TableColumn<?, ?> tablenumero;

    @FXML
    private TableColumn<?, ?> tablefecha;

    @FXML
    private TableColumn<?, ?> tablecvv;
    
    ObservableList<String> data;

    @FXML
    void AddNewCard(ActionEvent event) {

    }

    @FXML
    void closeWindow(ActionEvent event) {

    }
    
    public ObservableList<String> getcardData(){
    	
    		
    		Statement sentencia = null;
    		ResultSet resultado = null;
    		ArrayList<String> lista = new ArrayList<String>();
    		String Query = "SELECT  holder_fullname, num_card, expiration_date, cvv FROM t_card WHERE id ="+HomeGUIController.usuarioActual.getId();
    		try {
    			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
    			sentencia = myConnection.createStatement();
    			resultado = sentencia.executeQuery(Query);
    			
    			while (resultado.next()) {
    				data.addAll(resultado.getString("holder_fullname"), resultado.getString("num_card"), resultado.getString("expiration_date"), resultado.getString("cvv"));
    				System.out.println("Datos de tarjetas guardadas obtenidos");
    			}
    			
    		} catch (Exception e) {
    			System.out.println("Error al cargar las tarjetas guardadas!");
    		}
    	return data;
    }

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		
		//tablenombre.setCellFactory(new PropertyValueFactory<>(getcardData().get(1).toString());
		
	}

}
