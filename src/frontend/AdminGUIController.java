package frontend;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import com.mysql.cj.jdbc.CallableStatement;
import backend.ConnectionMySqlDB;
import backend.HomeLink_Controller;
import backend.Propiedad;
import backend.Publicacion;
import backend.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class AdminGUIController implements Initializable {

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
	private TableColumn<Publicacion, Boolean> tb_au_publi_col_status;

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

	/*********************************************************/
	@FXML
	private TableView<User> tableUser;
	@FXML
	private TableColumn<User, Integer> tb_user_col_id;
	@FXML
	private TableColumn<User, String> tb_user_col_username;
	@FXML
	private TableColumn<User, String> tb_user_col_nombre;
	@FXML
	private TableColumn<User, String> tb_user_col_apellido;
	@FXML
	private TableColumn<User, String> tb_user_col_sexo;
	@FXML
	private TableColumn<User, String> tb_user_col_pais; //ojo
	@FXML
	private TableColumn<User, String> tb_user_col_tel;
	@FXML
	private TableColumn<User, String> tb_user_col_email;
	@FXML
	private TableColumn<User, Boolean> tb_user_col_status;
	@FXML
	private TableColumn<User, String> tb_user_col_fecha;
	@FXML
	private TableColumn<User, String> tb_au_publi_col_usuario;


	/************************************************/
	ObservableList<Propiedad> listPropiedad = FXCollections.observableArrayList();
	ObservableList<Publicacion> listAutoriPublicaciones = FXCollections.observableArrayList();
	ObservableList<User> listUser = FXCollections.observableArrayList();
	/************************************************/
	@FXML
	private Label lblFullName;
	@FXML
	private Label lblID;
	@FXML
	private Label lblUsername;
	@FXML
	private Label lblAmountReserva;
	@FXML
	private Label lblAmountPubli;
	@FXML
	private Text textAdminUserLogged;
	@FXML
	private JFXButton btnDelUser;
	@FXML
	private JFXButton btnRefreshTbUser;
	@FXML
	private Button btnClose;
	@FXML
	private Button btnMinimize;
	@FXML
	private JFXButton btnAutorizar;

	/**********************************/
	public static User auxUserList;
	public static Publicacion auxPubliList;
	@FXML
	private StackPane rootStackPane;
	@FXML
	private TabPane tabpaneAdmin;
	@FXML
	private AnchorPane rootAnchorPane;
	@FXML
	private JFXTextField txtSearchTabUsuario;
	private double xoffset = 0;
	private double yoffset = 0;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		textAdminUserLogged.setText(HomeGUIController.usuarioActual.getUsername());
		initColumns();
		loadDataPropiedad();
		loadDataAutorizarPublicaciones();
		loadDataUser();
		searchDataUser();	
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
		tb_au_publi_col_usuario.setCellValueFactory(new PropertyValueFactory<>("usernameOwner"));

		//Init Column User.
		tb_user_col_id.setCellValueFactory(new PropertyValueFactory<>("id"));
		tb_user_col_nombre.setCellValueFactory(new PropertyValueFactory<>("name"));
		tb_user_col_apellido.setCellValueFactory(new PropertyValueFactory<>("lastname"));
		tb_user_col_sexo.setCellValueFactory(new PropertyValueFactory<>("gender"));
		tb_user_col_username.setCellValueFactory(new PropertyValueFactory<>("username"));
		tb_user_col_email.setCellValueFactory(new PropertyValueFactory<>("email"));
		tb_user_col_status.setCellValueFactory(new PropertyValueFactory<>("status"));
		tb_user_col_pais.setCellValueFactory(new PropertyValueFactory<>("country_location"));
		tb_user_col_tel.setCellValueFactory(new PropertyValueFactory<>("telephone_number"));
		tb_user_col_fecha.setCellValueFactory(new PropertyValueFactory<>("created_date"));

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
				Integer id = rs.getInt("id");
				String tipo = rs.getString("type");
				String dir = rs.getString("address");
				String caract = rs.getString("characteristic");
				String feedback= rs.getString("rating");
				Integer dueno = rs.getInt("id_user_owner");
				String status = rs.getString("status");		
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
		Statement sentencia = null;
		ResultSet rs = null;
		String Query = "SELECT t_publication.id, t_publication.titulo, t_publication.`date`,\r\n" + 
				"				t_publication.id_property,\r\n" + 
				"      			  t_publication.price, t_publication.`status`,\r\n" + 
				"       			 t_user.username\r\n" + 
				"		FROM t_publication \r\n" + 
				"		INNER JOIN t_user ON t_publication.id_owner = t_user.id\r\n" + 
				"		WHERE t_publication.`status` = 0 AND t_publication.id_user_admin = 0;";
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
						Integer id = rs.getInt("id");
						String titulo = rs.getString("titulo");
						String fecha = rs.getString("date");
						Integer idpropiedad = rs.getInt("id_property");
						Float precio = rs.getFloat("price");
						Boolean status = rs.getBoolean("status");
						String usernameOwner = rs.getString("username");
						Publicacion auxPubli = new Publicacion(id, fecha, titulo, status, idpropiedad, precio, usernameOwner);
						listAutoriPublicaciones.add(auxPubli);
					}
				} catch (Exception e) {
				}

				tableAutoriPubli.getItems().setAll(listAutoriPublicaciones);
	}

	public void loadDataUser() {
		Statement sentencia = null;
		ResultSet rs = null;
		String Query = "SELECT * FROM vista_general_clientes";
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
				Integer id = rs.getInt("ID_User");
				String username = rs.getString("Username");
				String name = rs.getString("Name");
				String lastname = rs.getString("Lastname");
				String country = rs.getString("Country");
				String gender = rs.getString("Gender");
				String email = rs.getString("Email");
				String tel_num= rs.getString("Telephone_Number");
				String user_type = rs.getString("User_Type");
				String fecha_crea = rs.getString("Created_Date");
				Integer amount_publication = rs.getInt("Publication_Number");
				Integer amount_reservation = rs.getInt("Reservation_Number");
				User auxUser = new User(name, lastname, gender, user_type, username, email, null, fecha_crea);
				auxUser.setId(id);
				auxUser.setCountry_location(country);
				auxUser.setTelephone_number(tel_num);
				auxUser.setAmountReservation(amount_reservation);
				auxUser.setAmountPublication(amount_publication);

				listUser.add(auxUser);

			}
		} catch (Exception e) {
		}

		tableUser.getItems().setAll(listUser);

	}

	public void searchDataUser() {
		FilteredList<User> filterDataUser = new FilteredList<>(listUser, b -> true);

		txtSearchTabUsuario.textProperty().addListener((observable, oldValue, newValue) -> {
			filterDataUser.setPredicate(user -> {
				if (newValue == null || newValue.isEmpty()) {
					return true;
				}

				String upperCaseFilter = newValue.toUpperCase();
				if (user.getName().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; //Filter match name.
				} else if (user.getLastname().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; //Filter match lastname
				} else if(user.getUsername().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; // Filter match username
				}else {
					return false; // Not matches
				}
			});
		});

		SortedList<User> sortedDataUser = new SortedList<>(filterDataUser);
		sortedDataUser.comparatorProperty().bind(tableUser.comparatorProperty());
		tableUser.setItems(sortedDataUser);

	}

	@FXML
	public void clickOnUserTable(MouseEvent event) {

		auxUserList = tableUser.getSelectionModel().getSelectedItem();
		if (auxUserList != null) {
			lblFullName.setText(auxUserList.getName() + " " + auxUserList.getLastname());
			lblID.setText(String.valueOf(auxUserList.getId()));
			lblUsername.setText(auxUserList.getUsername());
			lblAmountReserva.setText(String.valueOf(auxUserList.getAmountReservation()));
			lblAmountPubli.setText(String.valueOf(auxUserList.getAmountPublication()));
		}
	}

	@FXML
	public void deleteUser(ActionEvent event) {
		auxUserList = tableUser.getSelectionModel().getSelectedItem();

		int auxId = auxUserList.getId();
		String auxUsername = auxUserList.getUsername();

		if (HomeLink_Controller.delete_user(auxId, auxUsername)) {
			loadDataUser();
			JFXButton btnOk = new JFXButton("Ok!");
			PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Usuario eliminado con exito.", null);
		}
	}
	@FXML
	public void openOptionPublicaciones(ActionEvent event) throws IOException {
		Parent rootAdminPu = FXMLLoader.load(getClass().getResource("../frontend/publicacionesAdmin.fxml"));
		Stage stageAdminPu = new Stage();
		Scene sceneAdminPu = new Scene(rootAdminPu);
		stageAdminPu.setScene(sceneAdminPu);
		stageAdminPu.show();
		/*******
		 * EventHandler to Move Undecorated Window (Stage) Adapted from: StackOverflow
		 ******/
		rootAdminPu.setOnMousePressed(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				xoffset = stageAdminPu.getX() - event.getScreenX();
				yoffset = stageAdminPu.getY() - event.getScreenY();
			}
		});
		rootAdminPu.setOnMouseDragged(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				stageAdminPu.setX(event.getScreenX() + xoffset);
				stageAdminPu.setY(event.getScreenY() + yoffset);
			}
		});
		/***************************************************************/
	}

	@FXML
	public void refreshTbUser(ActionEvent event) {
		listUser.clear();
		loadDataUser();
	}

	@FXML
	public void minimizeWindow(ActionEvent event) {
		Stage stage = (Stage) btnMinimize.getScene().getWindow();
		stage.setIconified(true);
	}

	@FXML
	public void closeWindow(ActionEvent event) {
		Stage stage = (Stage) btnMinimize.getScene().getWindow();
		stage.close();
	}

	@FXML
	public void autorizarPublicacion(ActionEvent event) {

		auxPubliList = tableAutoriPubli.getSelectionModel().getSelectedItem();
		if (auxPubliList != null) {
			CallableStatement mySqlStatement = null ; // call stored procedure
			try {
				Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
				mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_authorize_publication(?,?)}");

				mySqlStatement.setInt("pa_id", auxPubliList.getIdPublicacion());
				mySqlStatement.setInt("pa_iduseradmin", HomeGUIController.usuarioActual.getId());
				mySqlStatement.executeQuery();
				myConnection.close();
				System.out.println("autorizado con exito!");
				JFXButton btnOk = new JFXButton("Ok!");
				PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Publicación autorizada con exito.", null);

			} catch (SQLException e) {
				System.out.println("autorizado sin exito!");
				e.printStackTrace();
			}
		}

		listAutoriPublicaciones.clear();
		loadDataAutorizarPublicaciones();
	}

	/************* FIN *****************/
}
