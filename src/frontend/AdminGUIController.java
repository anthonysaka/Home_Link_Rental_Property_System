package frontend;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

import backend.ConnectionMySqlDB;
import backend.Propiedad;
import backend.Publicacion;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

public class AdminGUIController implements Initializable {

	@FXML
    private TabPane tabpaneAdmin;
	/* ******************************************* */
    @FXML
    private TableView<Publicacion> tableAutoriPubli;
    @FXML
    private TableColumn<Publicacion, Integer> tb_au_publi_col_id;
    @FXML
    private TableColumn<Publicacion, String> tb_au_publi_col_titulo;
    @FXML
    private TableColumn<Publicacion, String> tb_au_publi_col_fecha;
    @FXML
    private TableColumn<Publicacion, Integer> tb_au_publi_col_propie;
    @FXML
    private TableColumn<Publicacion, Float> tb_au_publi_col_precio;
    @FXML
    private TableColumn<Publicacion, String> tb_au_publi_col_status;
    
    /*************************************************/
    @FXML
    private TableView<Propiedad> tableViewProperty;
    @FXML
    private TableColumn<Propiedad, Integer> tb_prop_col_id;
    @FXML
    private TableColumn<Propiedad, String> tb_prop_col_type;
    @FXML
    private TableColumn<Propiedad, String> tb_prop_col_address;
    @FXML
    private TableColumn<Propiedad, String> tb_prop_col_caract;
    @FXML
    private TableColumn<Propiedad, String> tb_prop_col_feed;
    @FXML
    private TableColumn<Propiedad, Integer> tb_prop_col_owner;
    @FXML
    private TableColumn<Propiedad, String> tb_prop_col_status;
    
    /************************************************/
    ObservableList<Propiedad> listPropiedad = FXCollections.observableArrayList();
    ObservableList<Publicacion> listAutoriPublicaciones = FXCollections.observableArrayList();
    /************************************************/
    
    
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		initColumns();
		loadDataPropiedad();
		loadDataAutorizarPublicaciones();
	}
	
	public void initColumns() {
		tb_prop_col_id.setCellValueFactory(new PropertyValueFactory<>("idPropiedad"));
		tb_prop_col_type.setCellValueFactory(new PropertyValueFactory<>("Tipo"));
		tb_prop_col_address.setCellValueFactory(new PropertyValueFactory<>("direccion"));
		tb_prop_col_caract.setCellValueFactory(new PropertyValueFactory<>("caracteristicas"));
		tb_prop_col_feed.setCellValueFactory(new PropertyValueFactory<>("feedbacks"));
		tb_prop_col_owner.setCellValueFactory(new PropertyValueFactory<>("idUserOwner"));
		tb_prop_col_status.setCellValueFactory(new PropertyValueFactory<>("estatus"));
		
		//Init Column Autorizar Publicaciones.
		tb_au_publi_col_id.setCellValueFactory(new PropertyValueFactory<>("idPublicacion"));
		tb_au_publi_col_titulo.setCellValueFactory(new PropertyValueFactory<>("titulo"));
		tb_au_publi_col_fecha.setCellValueFactory(new PropertyValueFactory<>("fechaPublicacion"));
		tb_au_publi_col_propie.setCellValueFactory(new PropertyValueFactory<>("idPropiedad"));
		tb_au_publi_col_precio.setCellValueFactory(new PropertyValueFactory<>("precio"));
		tb_au_publi_col_status.setCellValueFactory(new PropertyValueFactory<>("status"));
	}
	
	public void loadDataPropiedad() {
		
		Statement sentencia = null;
		ResultSet rs = null;
		String Query = "SELECT * FROM t_property";
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			rs = sentencia.executeQuery(Query);
			System.out.println("TABLA BIEN");
		} catch (Exception e) {
			System.out.println("No Correcto");
		}
		try { /* RECORDAR LIMPIAR EL CODIGO DE TODO EL PROYECTO [Mucho codigo repetido]*/
			while(rs.next()){
				Integer id = rs.getInt("id_property");
				String tipo = rs.getString("type_property");
				String dir = rs.getString("address");
				String caract = rs.getString("characteristic");
				String feedback= rs.getString("feedbacks");
				Integer dueno = rs.getInt("id_user_property");
				String status = rs.getString("status_property");		
				Propiedad auxPro = new Propiedad(tipo, dir, status, caract);
				auxPro.setIdPropiedad(id);
				auxPro.setIdUserOwner(dueno);
				auxPro.setFeedbacks(feedback);
				listPropiedad.add(auxPro);	
			}
		} catch (Exception e) {
		}
		
		tableViewProperty.getItems().setAll(listPropiedad);
	}

	public void loadDataAutorizarPublicaciones() {
		/* RECORDAR CAMBIAr NOMBRES DE LAS TABLAS, ya que la BD se va a crear 
		 * completa de nuevo, por mal convencion de nombre y logistica
		 */
		Statement sentencia = null;
		ResultSet rs = null;
		String Query = "SELECT * FROM t_publication WHERE status_publication LIKE %pendiente%";
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			rs = sentencia.executeQuery(Query);
			System.out.println("TABLA BIEN");
		} catch (Exception e) {
			System.out.println("No Correcto");
		}
		try { /* RECORDAR LIMPIAR EL CODIGO DE TODO EL PROYECTO [Mucho codigo repetido]*/
			while(rs.next()){
				Integer id = rs.getInt("id_publication");
				String titulo = rs.getString("titulo_publicacion");
				String fecha = rs.getString("publication_date");
				Integer propiedad = rs.getInt("id_property");
				Float precio = rs.getFloat("price");
				String status = rs.getString("status_publication");
				Publicacion auxPubli = new Publicacion(id, fecha, titulo, status, propiedad, precio);
				
				listAutoriPublicaciones.add(auxPubli);
			}
		} catch (Exception e) {
		}
		
		tableAutoriPubli.getItems().setAll(listAutoriPublicaciones);
	}
	
	/************* FIN *****************/
}
