package frontend;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;

import backend.ConnectionMySqlDB;
import backend.HomeLink_Controller;
import backend.Publicacion;
import backend.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class PublicacionAdminGUIController implements Initializable {

	/*********************************************/
	@FXML
	private TableView<Publicacion> tablePubli;
	@FXML
	private TableColumn<Publicacion, Integer> tb_publi_col_id;
	@FXML
	private TableColumn<Publicacion, String> tb_publi_col_titulo;
	@FXML
	private TableColumn<Publicacion, String> tb_publi_col_fecha;
	@FXML
	private TableColumn<Publicacion, String> tb_publi_col_useradmin;
	@FXML
	private TableColumn<Publicacion, Float> tb_publi_col_precio;
	@FXML
	private TableColumn<Publicacion, Boolean> tb_publi_col_status;
	@FXML
	private TableColumn<Publicacion, Integer> tb_publi_tiempo;
	/**********************************************/
	@FXML
	private Text textAdminUserLogged;
	@FXML
	private Button btnMinimize;
	@FXML
	private Button btnClose;
	@FXML
	private JFXTextField txtSearchTabPublicacion;
	@FXML
	private Label lblUsernamePropietarioPubli;
	@FXML
	private Label lblDirPropiePubli;
	@FXML
	private Label lblTipoPropiePubli;
	@FXML
	private JFXButton btnDelpubli;
	@FXML
	private JFXButton btnRefreshTbPubli;
    @FXML
    private StackPane rootStackPane;
    @FXML
    private AnchorPane rootAnchorPane;

	/*************************************************/
	ObservableList<Publicacion> listPublicaciones = FXCollections.observableArrayList();
	/***************************************************/
	public static Publicacion auxPubliList;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		initColumns();
		loadDataPublicaciones();

	}

	public void initColumns() {
		//Init ColumnPublicaciones.
		tb_publi_col_id.setCellValueFactory(new PropertyValueFactory<>("idPublicacion"));
		tb_publi_col_titulo.setCellValueFactory(new PropertyValueFactory<>("titulo"));
		tb_publi_col_fecha.setCellValueFactory(new PropertyValueFactory<>("fechaPublicacion"));
		tb_publi_col_useradmin.setCellValueFactory(new PropertyValueFactory<>("usernameAdmin"));
		tb_publi_col_precio.setCellValueFactory(new PropertyValueFactory<>("precio"));
		tb_publi_col_status.setCellValueFactory(new PropertyValueFactory<>("status"));
		tb_publi_tiempo.setCellValueFactory(new PropertyValueFactory<>("tiempoexistente"));
	}

	public void loadDataPublicaciones() {
		Statement sentencia = null;
		ResultSet rs = null;
		String Query = "SELECT * FROM vista_general_publicaciones;";

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
				Integer id = rs.getInt("ID_Publication");
				String titulo = rs.getString("Title");
				String useradmin = rs.getString("Confirmed_Admin");
				String fecha = rs.getString("Date");
				Boolean status = rs.getBoolean("status");
				Float precio = rs.getFloat("Price");
				String tiempoexistente = rs.getString("Publication_Days");
				String userowner = rs.getString("UserName_Owner");
				String dirPropiedad = rs.getString("Address_Property");
				String tipoPropiedad = rs.getString("Type_Property");
				
				if (status == true) {
					Publicacion auxPubli = new Publicacion(id, titulo, fecha, "Autorizada",0 , precio, userowner); //0 porque no tenia el idproperty y no me interesa ene ste caso.
					auxPubli.setTiempoexistente(tiempoexistente);
					auxPubli.setDirPropiedadCorrespondiente(dirPropiedad);
					auxPubli.setTipoPropiedadCorrespondiente(tipoPropiedad);
					auxPubli.setUsernameAdmin(useradmin);

					listPublicaciones.add(auxPubli);
					
				} else {
					
					Publicacion auxPubli = new Publicacion(id, titulo, fecha, "No Autorizada",0 , precio, userowner); //0 porque no tenia el idproperty y no me interesa ene ste caso.
					auxPubli.setTiempoexistente(tiempoexistente);
					auxPubli.setDirPropiedadCorrespondiente(dirPropiedad);
					auxPubli.setTipoPropiedadCorrespondiente(tipoPropiedad);
					auxPubli.setUsernameAdmin(useradmin);

					listPublicaciones.add(auxPubli);
					
				}

				
			}
		} catch (Exception e) {
		}

		tablePubli.getItems().setAll(listPublicaciones);
	}

	@FXML
	public void clickOnTablePublicaciones(MouseEvent event) {
		auxPubliList = tablePubli.getSelectionModel().getSelectedItem();

		if (auxPubliList!= null) {
			lblUsernamePropietarioPubli.setText(auxPubliList.getUsernameOwner());
			lblDirPropiePubli.setText(auxPubliList.getDirPropiedadCorrespondiente());
			lblTipoPropiePubli.setText(auxPubliList.getTipoPropiedadCorrespondiente());
		}
	}

	@FXML
	void closeWindow(ActionEvent event) {
		Stage stage = (Stage) btnMinimize.getScene().getWindow();
		stage.close();
	}

	@FXML
	public void deletePublicacionByAdmin(ActionEvent event) {
		auxPubliList = tablePubli.getSelectionModel().getSelectedItem();
		int auxId = auxPubliList.getIdPublicacion();
		if (HomeLink_Controller.delete_publication(auxId)) {
			
			JFXButton btnOk = new JFXButton("Ok!");
			PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Publicacion eliminada con exito.", null);
		}
		loadDataPublicaciones();
	}

	@FXML
	public void minimizeWindow(ActionEvent event) {
		Stage stage = (Stage) btnMinimize.getScene().getWindow();
		stage.setIconified(true);
	}

	@FXML
	public void refreshTbUser(ActionEvent event) {
		listPublicaciones.clear();
		loadDataPublicaciones();
	}



}