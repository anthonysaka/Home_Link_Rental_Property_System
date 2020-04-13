package frontend;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.Reserva;
import backend.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

public class TableProfileGUIController implements Initializable {

    @FXML
    private JFXButton btnclose;

    @FXML
    private JFXButton btnupdate;

    @FXML
    private JFXButton btnrefresh;

    @FXML
    private TableView<User> tableprofile;

    @FXML
    private TableColumn<User, String> columnnuser;

    @FXML
    private TableColumn<User, String> columnmail;

    @FXML
    private TableColumn<User, String> columnpass;

    @FXML
    private TableColumn<User, String> columnname;

    @FXML
    private TableColumn<User, String> columnlastname;

    @FXML
    private TableColumn<User, String> columngender;

    @FXML
    private TableColumn<User, String> columntelephone;

    @FXML
    private TableColumn<User, String> columncountry;

    ObservableList<User> listprofile = FXCollections.observableArrayList();
    
    @FXML
    void close(ActionEvent event) {
    	Stage x = (Stage) btnclose.getScene().getWindow();
    	x.close();
    }
    
    public void initColumns() {
		columnnuser.setCellValueFactory(new PropertyValueFactory<>("username"));
		columnmail.setCellValueFactory(new PropertyValueFactory<>("email"));
		columnpass.setCellValueFactory(new PropertyValueFactory<>("password"));
		columnname.setCellValueFactory(new PropertyValueFactory<>("name"));
		columnlastname.setCellValueFactory(new PropertyValueFactory<>("lastname"));
		columngender.setCellValueFactory(new PropertyValueFactory<>("gender"));
		columntelephone.setCellValueFactory(new PropertyValueFactory<>("telephone_number"));
		columncountry.setCellValueFactory(new PropertyValueFactory<>("country_location"));
	}
    
    public void loadDataProfile() {

		ResultSet rs = null;

		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();	
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_profile(?)}");
			mySqlStatement.setInt("pa_userid", HomeGUIController.usuarioActual.getId());
			rs = mySqlStatement.executeQuery();
			System.out.println("Los datos de sus Reservas han sido cargados");

		} catch (SQLException e) {
			System.out.println("Error al cargar sus Reservas!");
			e.printStackTrace();
		}
		try { /* RECORDAR LIMPIAR EL CODIGO DE TODO EL PROYECTO [Mucho codigo repetido]*/
			while(rs.next()){
				String username = rs.getString("username");//
				String email = rs.getString("email");
				String password = rs.getString("password");//
				String name= rs.getString("name");//
				String lastname= rs.getString("lastname");
				String gender = rs.getString("gender");
				String telephone_number= rs.getString("telephone_number");
				String country_location = rs.getString("country_name");

				
				User aux = new User(name, lastname, gender,"", username, email, password, "");
				aux.setCountry_location(country_location);
				aux.setTelephone_number(telephone_number);

				listprofile.add(aux);


			}
		} catch (Exception e) {
		}
		tableprofile.getItems().setAll(listprofile);
	}
    
    



	@Override
	public void initialize(URL location, ResourceBundle resources) {
		initColumns();
		loadDataProfile();
		
	}

}
