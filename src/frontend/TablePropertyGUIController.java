package frontend;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.Propiedad;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

public class TablePropertyGUIController implements Initializable {

    @FXML
    private JFXButton btnAddProperty;

    @FXML
    private JFXButton btnModifyProperty;

    @FXML
    private JFXButton btnDeleteProperty;

    @FXML
    private Button btnClose;

    @FXML
    public TableView<Propiedad> tablapropiedades;

    @FXML
    private TableColumn<Propiedad, String> columnatipo;

    @FXML
    private TableColumn<Propiedad, String> columnastatus;

    @FXML
    private TableColumn<Propiedad, String> columnarating;

    @FXML
    private TableColumn<Propiedad, String> columnadireccion;

    @FXML
    private TableColumn<Propiedad, String> columnacaracteristicas;
    
    ObservableList<Propiedad> listPropiedad = FXCollections.observableArrayList();
    
    private double xoffset = 0;
	private double yoffset = 0;

    /***************************************METHODS***************************************************************************************************/
    
    public void initColumns() {
    	
    	
    	columnatipo.setCellValueFactory(new PropertyValueFactory<>("tipo"));
		columnastatus.setCellValueFactory(new PropertyValueFactory<>("estatus"));
		columnarating.setCellValueFactory(new PropertyValueFactory<>("feedbacks"));
		columnadireccion.setCellValueFactory(new PropertyValueFactory<>("direccion"));
		columnacaracteristicas.setCellValueFactory(new PropertyValueFactory<>("caracteristicas"));
		
    	
    }
    
    @FXML
    void insertProperty(ActionEvent event) throws IOException {
    	Parent rootAdmin = FXMLLoader.load(getClass().getResource("../frontend/AddPropertyGUIController.fxml"));
		Stage stageAdmin = new Stage();
		Scene sceneAdmin = new Scene(rootAdmin);

		stageAdmin.setScene(sceneAdmin);
		//stageAdmin.setResizable(false);
		//stageRegister.setAlwaysOnTop(true);
	//	stageAdmin.initStyle(StageStyle.TRANSPARENT);
		//	stageRegister.initModality(Modality.APPLICATION_MODAL);
		stageAdmin.show();

		/*******
		 * EventHandler to Move Undecorated Window (Stage) Adapted from: StackOverflow
		 ******/
		rootAdmin.setOnMousePressed(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				xoffset = stageAdmin.getX() - event.getScreenX();
				yoffset = stageAdmin.getY() - event.getScreenY();
			}
		});
		rootAdmin.setOnMouseDragged(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				stageAdmin.setX(event.getScreenX() + xoffset);
				stageAdmin.setY(event.getScreenY() + yoffset);
			}
		});
    }
    
    public void loadDataPropiedad() {
    	
    	tablapropiedades.getItems().clear();
    	
    	
    	ResultSet rs = null;

    	CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();	
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_tablaPropiedades(?)}");
			mySqlStatement.setInt("pa_idOwner", HomeGUIController.usuarioActual.getId());
			rs = mySqlStatement.executeQuery();
			System.out.println("Los datos de sus propiedades han sido cargados");
		
		} catch (SQLException e) {
			System.out.println("Error al cargar sus propiedades!");
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
				//	auxPro.setFeedbacks(feedback);
					listPropiedad.removeAll(auxPro);
					listPropiedad.add(auxPro);	
					
				}else {
					Propiedad auxPro = new Propiedad(tipo, dir, "Inactiva", caract);
			//		auxPro.setFeedbacks(feedback);
					listPropiedad.removeAll(auxPro);
					listPropiedad.add(auxPro);	
				}
				
				
			}
		} catch (Exception e) {
		}
		tablapropiedades.getItems().setAll(listPropiedad);
		
	}
    
    @FXML
    void refresh(ActionEvent event) {
    	
    	loadDataPropiedad();
    	
    	
    }
    
    
    @FXML
    void CloseWindow(ActionEvent event) {
    	
    	Stage x = (Stage) btnClose.getScene().getWindow();
    	x.close();

    }



	@Override
	public void initialize(URL location, ResourceBundle resources) {
		initColumns();
		loadDataPropiedad();
	}

}
