package frontend;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;

import backend.ConnectionMySqlDB;
import backend.Publicacion;
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
import javafx.stage.StageStyle;

public class TablePublicationGUIController implements Initializable {

    @FXML
    private JFXButton btnAddPublication;

    @FXML
    private JFXButton btnModifyPublication;

    @FXML
    private JFXButton btnDeletePublication;

    @FXML
    private Button btnClose;

    @FXML
    private TableView<Publicacion> tablaPublicacion;

    @FXML
    private TableColumn<Publicacion, String> columnaId;

    @FXML
    private TableColumn<Publicacion, String> columnatitulo;

    @FXML
    private TableColumn<Publicacion, String> columnafecha;

    @FXML
    private TableColumn<Publicacion, String> columnaidPropiedad;

    @FXML
    private TableColumn<Publicacion, String> columnaprecio;

    @FXML
    private TableColumn<Publicacion, String> columnastatus;
    
    private double xoffset = 0;
	private double yoffset = 0;
	
	ObservableList<Publicacion> listPublicaciones = FXCollections.observableArrayList();
    
    /*****************************************************************METHODS*************************************************************************************************/
    
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		initColumns();
		loadDataAutorizarPublicaciones();
		
	}
	
	public void initColumns() {
		columnaId.setCellValueFactory(new PropertyValueFactory<>("idPublicacion"));
		columnatitulo.setCellValueFactory(new PropertyValueFactory<>("titulo"));
		columnafecha.setCellValueFactory(new PropertyValueFactory<>("fechaPublicacion"));
		columnaidPropiedad.setCellValueFactory(new PropertyValueFactory<>("idPropiedad"));
		columnaprecio.setCellValueFactory(new PropertyValueFactory<>("precio"));
		columnastatus.setCellValueFactory(new PropertyValueFactory<>("status"));
	}
	
	
	
	public void loadDataAutorizarPublicaciones() {
		/* RECORDAR CAMBIAr NOMBRES DE LAS TABLAS, ya que la BD se va a crear 
		 * completa de nuevo, por mal convencion de nombre y logistica
		 */
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
		try { /* RECORDAR LIMPIAR EL CODIGO DE TODO EL PROYECTO [Mucho codigo repetido]*/
			while(rs.next()){
				Integer id = rs.getInt("id");
				String titulo = rs.getString("titulo");
				String fecha = rs.getString("date");
				Integer propiedad = rs.getInt("id_property");
				Float precio = rs.getFloat("price");
				String status = rs.getString("status");
				Publicacion auxPubli = new Publicacion(id, titulo, fecha,  status, propiedad, precio);

				listPublicaciones.add(auxPubli);
			}
		} catch (Exception e) {
		}

		tablaPublicacion.getItems().setAll(listPublicaciones);
	}
	
    @FXML
    void insertPublication(ActionEvent event) throws IOException {
    	Parent rootRegister = FXMLLoader.load(getClass().getResource("../frontend/publicationGUI.fxml"));
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
    void CloseWindow(ActionEvent event) {
    	Stage x = (Stage) btnClose.getScene().getWindow();
    	x.close();
    }

	

}
