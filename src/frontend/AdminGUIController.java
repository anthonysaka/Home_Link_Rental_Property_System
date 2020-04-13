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
import com.jfoenix.controls.JFXDatePicker;
import com.jfoenix.controls.JFXRadioButton;
import com.jfoenix.controls.JFXTextField;
import com.mysql.cj.jdbc.CallableStatement;
import com.mysql.cj.protocol.Resultset;

import backend.ConnectionMySqlDB;
import backend.HomeLink_Controller;
import backend.Propiedad;
import backend.Publicacion;
import backend.Reserva;
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
import javafx.scene.control.ToggleGroup;
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
	private TableColumn<Propiedad, Float> tb_prop_col_rating;
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
	@FXML
	private JFXButton btnOptReservaciones;
	@FXML
	private JFXRadioButton rbTipoPro;
	@FXML
	private JFXRadioButton rbNinguno;
	@FXML
	private ToggleGroup tgFilter;

	@FXML
	private JFXButton btnFiltrarProp;
	@FXML
	private JFXTextField txtDatFilterProp;

	@FXML
	private JFXTextField txtSearchTabPropie;
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
	@FXML
	private JFXTextField txtSearchTabAuPub;
	@FXML
	private JFXDatePicker datapickeCheckIn;
	@FXML
	private JFXDatePicker datapickeCheckOut;
	@FXML
	private Label lbl_hm_id;
	@FXML
	private Label lbl_hm_tipo;
	@FXML
	private Label lbl_hm_status;
	@FXML
	private Label lbl_hm_user;
	@FXML
	private Label lbl_hm_cantReservadas;

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
		searchDataPropiedad();
		searchDataAuPubli();
	}

	public void initColumns() {
		
		//Init column propiedadas.
		tb_prop_col_id.setCellValueFactory(new PropertyValueFactory<>("idPropiedad"));
		tb_prop_col_type.setCellValueFactory(new PropertyValueFactory<>("tipo"));
		tb_prop_col_address.setCellValueFactory(new PropertyValueFactory<>("direccion"));
		tb_prop_col_caract.setCellValueFactory(new PropertyValueFactory<>("caracteristicas"));
		tb_prop_col_rating.setCellValueFactory(new PropertyValueFactory<>("rating"));
		tb_prop_col_owner.setCellValueFactory(new PropertyValueFactory<>("username"));
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
		Connection myConnection = null;
		String Query = "SELECT * FROM vista_general_propiedad;";
		try {
			myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
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
				String dir = rs.getString("Address_Property");
				String caract = rs.getString("Characteristic_Property");
				Float rating = rs.getFloat("rating");
				String dueno = rs.getString("username");
				String status = rs.getString("status");		
				Propiedad auxPro = new Propiedad(tipo, dir, status, caract);
				auxPro.setIdPropiedad(id);
				auxPro.setUsername(dueno);
				auxPro.setRating(rating);
				listPropiedad.add(auxPro);	
			}
			myConnection.close();
		} catch (Exception e) {
		}

		tableViewProperty.getItems().setAll(listPropiedad);
	}


	public ResultSet loadDataPropiedadMasRentada(String checkIn, String checkOut) {
		ResultSet rs = null;
		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = HomeLink_Controller.getConnectionMySqlDB();
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_query_propiedad_mas_rentada(?,?)}");
			mySqlStatement.setString("pa_start_date", checkIn);
			mySqlStatement.setString("pa_end_date", checkOut);
			rs = mySqlStatement.executeQuery();
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@FXML
	void searchMasRentada(ActionEvent event) throws SQLException {
		if (datapickeCheckIn.getValue() != null & datapickeCheckOut.getValue() != null) {
			String in = datapickeCheckIn.getValue().toString();
			String out = datapickeCheckOut.getValue().toString();
			ResultSet rs = loadDataPropiedadMasRentada(in, out);
			if (rs.next()) {
				String id = rs.getString(1);
				String tipo = rs.getString(2);
				String user = rs.getString(3);
				String st = String.valueOf(rs.getBoolean(4));
				String cant = String.valueOf(rs.getInt(5));
				lbl_hm_id.setText(id);
				lbl_hm_tipo.setText(tipo);
				lbl_hm_user.setText(user);
				lbl_hm_status.setText(st);
				lbl_hm_cantReservadas.setText(cant);
			}else {
				JFXButton btnOk = new JFXButton("Ok!");
				PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"No hay reservaciones para estas fechas!.", null);
			}
			
		}

	}


	public void loadDataAutorizarPublicaciones() {
		Statement sentencia = null;
		ResultSet rs = null;
		Connection myConnection = null;
		String Query = "SELECT t_publication.id, t_publication.titulo, t_publication.`date`,\r\n" + 
				"				t_publication.id_property,\r\n" + 
				"      			  t_publication.price, t_publication.`status`,\r\n" + 
				"       			 t_user.username\r\n" + 
				"		FROM t_publication \r\n" + 
				"		INNER JOIN t_user ON t_publication.id_owner = t_user.id\r\n" + 
				"		WHERE t_publication.`status` = 0 AND t_publication.id_user_admin = 0";
		try {
			myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
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

				System.out.println("ADMIN STATUS ES: "+status);

				if (status == true) {
					Publicacion auxPubli = new Publicacion(id, fecha, titulo, "Autorizada", idpropiedad, precio, usernameOwner);
					listAutoriPublicaciones.add(auxPubli);
				} else {
					Publicacion auxPubli = new Publicacion(id, fecha, titulo, "No Autorizada", idpropiedad, precio, usernameOwner);
					listAutoriPublicaciones.add(auxPubli);
				}

			}
			myConnection.close();
		} catch (Exception e) {
		}

		tableAutoriPubli.getItems().setAll(listAutoriPublicaciones);
	}

	public void loadDataUser() {
		Statement sentencia = null;
		ResultSet rs = null;
		Connection myConnection = null;
		String Query = "SELECT * FROM vista_general_clientes";
		try {
			myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
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
				Boolean status = rs.getBoolean("status");
				User auxUser = new User(name, lastname, gender, user_type, username, email, null, fecha_crea);
				auxUser.setId(id);
				auxUser.setCountry_location(country);
				auxUser.setTelephone_number(tel_num);
				auxUser.setAmountReservation(amount_reservation);
				auxUser.setAmountPublication(amount_publication);
				auxUser.setStatus(status);

				listUser.add(auxUser);

			}
			myConnection.close();
		} catch (Exception e) {
		}

		tableUser.getItems().setAll(listUser);

	}

	public void searchDataPropiedad() {
		FilteredList<Propiedad> filterDataPro = new FilteredList<>(listPropiedad, b -> true);

		txtSearchTabPropie.textProperty().addListener((observable, oldValue, newValue) -> {
			filterDataPro.setPredicate(pro -> {
				if (newValue == null || newValue.isEmpty()) {
					return true;
				}

				String upperCaseFilter = newValue.toUpperCase();
				if (String.valueOf(pro.getIdPropiedad()).toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true;
				} else if (pro.getTipo().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				} else if(pro.getUsername().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				}else if(pro.getDireccion().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				}else {
					return false; // Not matches
				}
			});
		});

		SortedList<Propiedad> sortedDataPro = new SortedList<>(filterDataPro);
		sortedDataPro.comparatorProperty().bind(tableViewProperty.comparatorProperty());
		tableViewProperty.setItems(sortedDataPro);

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

	public void searchDataAuPubli ( ) {
		FilteredList<Publicacion> filterDataAuPub= new FilteredList<>(listAutoriPublicaciones, b -> true);

		txtSearchTabPropie.textProperty().addListener((observable, oldValue, newValue) -> {
			filterDataAuPub.setPredicate(auPu -> {
				if (newValue == null || newValue.isEmpty()) {
					return true;
				}

				String upperCaseFilter = newValue.toUpperCase();
				if (String.valueOf(auPu.getIdPublicacion()).toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true;
				} else if (auPu.getTitulo().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				} else if(auPu.getUsernameOwner().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				}else {
					return false; // Not matches
				}
			});
		});

		SortedList<Publicacion> sortedDataauP = new SortedList<>(filterDataAuPub);
		sortedDataauP.comparatorProperty().bind(tableAutoriPubli.comparatorProperty());
		tableAutoriPubli.setItems(sortedDataauP);
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
			listUser.clear();
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
	void openOptionReservaciones(ActionEvent event) throws IOException {
		Parent rootAdminPu = FXMLLoader.load(getClass().getResource("../frontend/reservationAdmin.fxml"));
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
		listUser.clear(); //UN COMENTARIO
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
		HomeGUIController.llenarCombo();
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
				myConnection.close();
			} catch (SQLException e) {
				System.out.println("autorizado sin exito!");
				e.printStackTrace();
			}
		}

		listAutoriPublicaciones.clear();
		loadDataAutorizarPublicaciones();
	}

	@FXML
	public void doFilter(ActionEvent event) {
		ResultSet rs = null;
		Connection myConnection = HomeLink_Controller.getConnectionMySqlDB();
		CallableStatement mySqlStatement = null ; // call stored procedure

		if (!txtDatFilterProp.getText().isEmpty()) {
			String data = txtDatFilterProp.getText();
			if (rbTipoPro.isSelected()) {
				try {
					mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_query_property_by_type(?)}");
					mySqlStatement.setString(1, data);
					rs=mySqlStatement.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				listPropiedad.clear();
				try {
					while(rs.next()){
						Integer id = rs.getInt("id");
						String tipo = rs.getString("type");
						String dir = rs.getString("Address_Property");
						String caract = rs.getString("Characteristic_Property");
						Float rating = rs.getFloat("rating");
						String dueno = rs.getString("username");
						String status = rs.getString("status");		
						Propiedad auxPro = new Propiedad(tipo, dir, status, caract);
						auxPro.setIdPropiedad(id);
						auxPro.setUsername(dueno);
						auxPro.setRating(rating);
						listPropiedad.add(auxPro);	
					}
					myConnection.close();
				} catch (SQLException e) {
				}
				tableViewProperty.getItems().setAll(listPropiedad);
			}else {
				JFXButton btnOk = new JFXButton("Ok!");
				PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Error!\n" 
						+ "Debe seleccionar una opcion de filtrado.", null);
			}
		}else if (txtDatFilterProp.getText().isEmpty() & rbNinguno.isSelected()) {
			listPropiedad.clear();
			loadDataPropiedad();
		}else {
			JFXButton btnOk = new JFXButton("Ok!");
			PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Error!\n" 
					+ "Debe introducir los datos del filtrado.", null);
		}
	}

	/************* FIN *****************/
}
