package frontend;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXRadioButton;
import com.jfoenix.controls.JFXTextField;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.HomeLink_Controller;
import backend.Reserva;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.collections.transformation.SortedList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.ToggleGroup;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class ReservationAdminGUIController implements Initializable {

	@FXML
	private StackPane rootStackPane;
	@FXML
	private AnchorPane rootAnchorPane;
	@FXML
	private TableView<Reserva> tableReserva;
	@FXML
	private TableColumn<Reserva, Integer> tb_reser_col_num_reser;
	@FXML
	private TableColumn<Reserva, Integer> tb_reser_col_guest;
	@FXML
	private TableColumn<Reserva, String> tb_reser_col_checkIn;
	@FXML
	private TableColumn<Reserva, String> tb_reser_col_checkOut;
	@FXML
	private TableColumn<Reserva, String> tb_reser_col_username;
	@FXML
	private TableColumn<Reserva, Integer> tb_reser_col_idPubli;
	@FXML
	private TableColumn<Reserva, String> tb_reser_col_tipo;
	@FXML
	private TableColumn<Reserva, String> tb_reser_col_dir;
	@FXML
	private TableColumn<Reserva, String> tb_reser_col_tarjeta;
	@FXML
	private TableColumn<Reserva, Float> tb_reser_col_price;
	
	public int reservationID = 0;

	@FXML
	private Text textAdminUserLogged;
	@FXML
	private Button btnMinimize;
	
	@FXML
    private JFXButton btndelete;
	
	@FXML
	private Button btnClose;
	@FXML
	private JFXTextField txtSearchTabReservation;
	@FXML
	private JFXButton btnRefreshTbReserva;
	@FXML
	private JFXComboBox<String> cbxFilter;
	@FXML
	private JFXTextField txtDatFilter;
	@FXML
	private JFXRadioButton rbTipo;
	@FXML
	private JFXRadioButton rbCiudad;
	@FXML
	private JFXRadioButton rbMes;
	@FXML
	private JFXRadioButton rbAno;
	@FXML
	private JFXRadioButton rbNinguno;
	@FXML
	private ToggleGroup tgFilter;

	ObservableList<Reserva> listReservas = FXCollections.observableArrayList();

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		initColumns();
		loadDataReservationOrderByFecha();
		searchReservation();


	}
	
	@FXML
    void deleteReservation(ActionEvent event) {
		
		reservationID = tableReserva.getSelectionModel().getSelectedItem().getIdReserva();
		
		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();	
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_delete_reservation(?)}");
			mySqlStatement.setInt("pa_num_reservation", reservationID);
			mySqlStatement.executeQuery();
			System.out.println("RESERVA BORRADA EXITOSAMENTE");

		} catch (SQLException e) {
			System.out.println("HUBO UN ERROR AL BORRAR LA RESERVA");
			e.printStackTrace();
		}
		
		listReservas.clear();
		loadDataReservationOrderByFecha();

    }

	public void initColumns() {
		tb_reser_col_num_reser.setCellValueFactory(new PropertyValueFactory<>("idReserva"));
		tb_reser_col_guest.setCellValueFactory(new PropertyValueFactory<>("huespedes"));
		tb_reser_col_checkIn.setCellValueFactory(new PropertyValueFactory<>("fechaInicio"));
		tb_reser_col_checkOut.setCellValueFactory(new PropertyValueFactory<>("fechaFin"));
		tb_reser_col_username.setCellValueFactory(new PropertyValueFactory<>("username"));
		tb_reser_col_idPubli.setCellValueFactory(new PropertyValueFactory<>("idPublicacion"));
		tb_reser_col_tipo.setCellValueFactory(new PropertyValueFactory<>("tipo"));
		tb_reser_col_dir.setCellValueFactory(new PropertyValueFactory<>("dir"));
		tb_reser_col_tarjeta.setCellValueFactory(new PropertyValueFactory<>("num_card"));
		tb_reser_col_price.setCellValueFactory(new PropertyValueFactory<>("precio"));

	}



	public void loadDataReservationOrderByFecha() {
		Statement sentencia = null;
		ResultSet rs = null;
		Connection myConnection = null;
		String Query = "select * from vista_reservas_por_fecha;";
		try {
			myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			rs = sentencia.executeQuery(Query);
			System.out.println("TABLA BIEN");
		} catch (Exception e) {
			System.out.println("No Correcto");
		}
		try {
			while(rs.next()){
				int num = rs.getInt("num_reservation");
				int cantguest = rs.getInt("amount_guest");
				String checkIn = rs.getString("start_date");
				String checkOut = rs.getString("end_date");
				String username = rs.getString("username");
				int idPu = rs.getInt("id_publication");
				String tipo = rs.getString("type");
				String dir = rs.getString("Address_Property");
				String cardNum = rs.getString("num_card");
				Float price = rs.getFloat("price_reservation");

				Reserva auxRe = new Reserva(num, idPu, 0, cantguest, checkIn, checkOut,cardNum,price);
				auxRe.setUsername(username);
				auxRe.setTipo(tipo);
				auxRe.setDir(dir);

				listReservas.add(auxRe);
			}
			myConnection.close();
		} catch (Exception e) {
		}
		tableReserva.getItems().setAll(listReservas);
	}

	public void searchReservation () {
		FilteredList<Reserva> filterDataRe = new FilteredList<>(listReservas, b -> true);

		txtSearchTabReservation.textProperty().addListener((observable, oldValue, newValue) -> {
			filterDataRe.setPredicate(re -> {
				if (newValue == null || newValue.isEmpty()) {
					return true;
				}

				String upperCaseFilter = newValue.toUpperCase();
				if (String.valueOf(re.getIdReserva()).toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				} else if (String.valueOf(re.getIdPublicacion()).toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				} else if(String.valueOf(re.getPrecio()).toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				} else if(re.getUsername().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				} else if(re.getNum_card().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				} else if(re.getDir().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				} else if(re.getTipo().toUpperCase().indexOf(upperCaseFilter) != -1) {
					return true; 
				}else {
					return false; // Not matches
				}
			});
		});

		SortedList<Reserva> sortedDataUser = new SortedList<>(filterDataRe);
		sortedDataUser.comparatorProperty().bind(tableReserva.comparatorProperty());
		tableReserva.setItems(sortedDataUser);
	}

	//Do Filter.
	@FXML
	public void doFilter(ActionEvent event) {
		ResultSet rs = null;
		Connection myConnection = HomeLink_Controller.getConnectionMySqlDB();
		CallableStatement mySqlStatement = null ; // call stored procedure

		if (!txtDatFilter.getText().isEmpty()) {
			String data = txtDatFilter.getText();
			if (rbTipo.isSelected()) {
				try {
					mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_query_reservation_typeProperty(?)}");
					mySqlStatement.setString(1, data);
					rs=mySqlStatement.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				listReservas.clear();
				try {
					while(rs.next()){
						int num = rs.getInt("num_reservation");
						int cantguest = rs.getInt("amount_guest");
						String checkIn = rs.getString("start_date");
						String checkOut = rs.getString("end_date");
						String username = rs.getString("username");
						int idPu = rs.getInt("id_publication");
						String tipo = rs.getString("type");
						String dir = rs.getString("Address_Property");
						String cardNum = rs.getString("num_card");
						Float price = rs.getFloat("price_reservation");
						Reserva auxRe = new Reserva(num, idPu, 0, cantguest, checkIn, checkOut,cardNum,price);
						auxRe.setUsername(username);
						auxRe.setTipo(tipo);
						auxRe.setDir(dir);
						listReservas.add(auxRe);
					}
					myConnection.close();
				} catch (SQLException e) {
				}
				tableReserva.getItems().setAll(listReservas);	
			} else if (rbCiudad.isSelected()) {

				try {
					mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_query_reservation_city(?)}");
					mySqlStatement.setString(1, data);
					rs=mySqlStatement.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				listReservas.clear();
				try {
					while(rs.next()){
						int num = rs.getInt("num_reservation");
						int cantguest = rs.getInt("amount_guest");
						String checkIn = rs.getString("start_date");
						String checkOut = rs.getString("end_date");
						String username = rs.getString("username");
						int idPu = rs.getInt("id_publication");
						String tipo = rs.getString("type");
						String dir = rs.getString("Address_Property");
						String cardNum = rs.getString("num_card");
						Float price = rs.getFloat("price_reservation");
						Reserva auxRe = new Reserva(num, idPu, 0, cantguest, checkIn, checkOut,cardNum,price);
						auxRe.setUsername(username);
						auxRe.setTipo(tipo);
						auxRe.setDir(dir);
						listReservas.add(auxRe);
					}
					myConnection.close();
				} catch (SQLException e) {
				}
				tableReserva.getItems().setAll(listReservas);		
			
			} else if (rbMes.isSelected()) {
				try {
					mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_query_reservation_month(?)}");
					mySqlStatement.setString(1, data);
					rs=mySqlStatement.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
						listReservas.clear();
				try {
					while(rs.next()){
						int num = rs.getInt("num_reservation");
						int cantguest = rs.getInt("amount_guest");
						String checkIn = rs.getString("start_date");
						String checkOut = rs.getString("end_date");
						String username = rs.getString("username");
						int idPu = rs.getInt("id_publication");
						String tipo = rs.getString("type");
						String dir = rs.getString("Address_Property");
						String cardNum = rs.getString("num_card");
						Float price = rs.getFloat("price_reservation");
						Reserva auxRe = new Reserva(num, idPu, 0, cantguest, checkIn, checkOut,cardNum,price);
						auxRe.setUsername(username);
						auxRe.setTipo(tipo);
						auxRe.setDir(dir);
						listReservas.add(auxRe);
					}
					myConnection.close();
				} catch (SQLException e) {
				}
				tableReserva.getItems().setAll(listReservas);		
				
			} else if (rbAno.isSelected()) {
				try {
					mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_query_reservation_year(?)}");
					mySqlStatement.setString(1, data);
					rs=mySqlStatement.executeQuery();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				listReservas.clear();
				try {
					while(rs.next()){
						int num = rs.getInt("num_reservation");
						int cantguest = rs.getInt("amount_guest");
						String checkIn = rs.getString("start_date");
						String checkOut = rs.getString("end_date");
						String username = rs.getString("username");
						int idPu = rs.getInt("id_publication");
						String tipo = rs.getString("type");
						String dir = rs.getString("Address_Property");
						String cardNum = rs.getString("num_card");
						Float price = rs.getFloat("price_reservation");
						Reserva auxRe = new Reserva(num, idPu, 0, cantguest, checkIn, checkOut,cardNum,price);
						auxRe.setUsername(username);
						auxRe.setTipo(tipo);
						auxRe.setDir(dir);
						listReservas.add(auxRe);
					}
					myConnection.close();
				} catch (SQLException e) {
				}
				tableReserva.getItems().setAll(listReservas);
		
				
			} else {
				JFXButton btnOk = new JFXButton("Ok!");
				PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Error!\n" 
						+ "Debe seleccionar una opcion de filtrado.", null);
			}
		} else if (txtDatFilter.getText().isEmpty() & rbNinguno.isSelected()) {
			listReservas.clear();
			loadDataReservationOrderByFecha();
		}else {
			JFXButton btnOk = new JFXButton("Ok!");
			PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Error!\n" 
					+ "Debe introducir los datos del filtrado.", null);
		}



			
	}

	@FXML
	void closeWindow(ActionEvent event) {
		Stage stage = (Stage) btnMinimize.getScene().getWindow();
		stage.close();
	}

	@FXML
	void minimizeWindow(ActionEvent event) {
		Stage stage = (Stage) btnMinimize.getScene().getWindow();
		stage.setIconified(true);
	}



}
