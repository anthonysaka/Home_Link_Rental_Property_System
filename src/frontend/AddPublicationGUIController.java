package frontend;






import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.ResourceBundle;
import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextField;
import com.mysql.cj.jdbc.CallableStatement;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;
//import com.sun.java.util.jar.pack.Package.File;
import com.sun.glass.ui.CommonDialogs.FileChooserResult;
import com.sun.java.swing.plaf.windows.resources.windows;


import backend.ConnectionMySqlDB;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.stage.FileChooser;
import javafx.stage.Stage;
import javafx.stage.Window;
import sun.swing.FilePane.FileChooserUIAccessor;



public class AddPublicationGUIController implements Initializable{



	@FXML
	private AnchorPane primaryPane;


	@FXML
	private JFXTextField txtTitulo;

	@FXML
	private JFXComboBox<String> cbxProperty;

	@FXML
	private JFXTextField txtPrice;

	@FXML
	private JFXButton btnCancelar;

	@FXML
	private JFXButton btnPublicar;

	@FXML
	private ImageView imgview2;


	@FXML
	private ImageView imgview1;

	@FXML
	private ImageView imgview3;

	@FXML
	private JFXButton btnBrowse;

	ObservableList<String> list = FXCollections.observableArrayList(llenarCombobox());

	int x = 0;
	int y = 0;
	int z = 0;

	private FileChooser fileChooser;
	private File file;
	private Image imagen;
	private FileInputStream sendImage;


	@FXML
	void browseImage(ActionEvent event) throws FileNotFoundException {

		FileChooser fc = new FileChooser();
		fc.setInitialDirectory(new File("C:\\Users\\jhan_\\git\\Home_Link_Rental_Property_System\\src"));

		File selectedFile = fc.showOpenDialog(null);
		
		if(selectedFile != null && (x != 1)){

			imagen = new Image(selectedFile.toURI().toString(), imgview1.getFitWidth(), imgview1.getFitHeight(), true, true);//path, PrefWidth, PrefHeight, PreserveRatio, Smooth

			imgview1.setImage(imagen);
			x = 1;

		}
		else if(selectedFile != null && (y != 1) ){


			imagen = new Image(selectedFile.toURI().toString(), imgview2.getFitWidth(), imgview2.getFitHeight(), true, true);//path, PrefWidth, PrefHeight, PreserveRatio, Smooth

			imgview2.setImage(imagen);
		
			y = 1;

		}
		else if(selectedFile != null && (z != 1) ){


			imagen = new Image(selectedFile.toURI().toString(), imgview3.getFitWidth(), imgview3.getFitHeight(), true, true);//path, PrefWidth, PrefHeight, PreserveRatio, Smooth

			imgview3.setImage(imagen);
			z = 1;
		}
		
		
		
		
	}

	@FXML
	void cancel(ActionEvent event) {
		Stage ventana = (Stage) btnCancelar.getScene().getWindow();
		ventana.close();
		 x = 0;
		 y = 0;
		 z = 0;

		
	}

	@FXML
	void savePublication(ActionEvent event) {

		String titulo = txtTitulo.getText();
		String precio = txtPrice.getText();
		String property = cbxProperty.getSelectionModel().getSelectedItem().toString();
		int userId = HomeGUIController.usuarioActual.getId();
		String status = "Inactivo";
		int imagenPreview = 1;
		int adminId = 0;
		
		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();	
			
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_insert_publicacion(?,?,?,?,?,?)}");
			mySqlStatement.setString("pa_titulo", titulo);
			mySqlStatement.setString("pa_status", status);
			mySqlStatement.setString("pa_propertyID", property);
			mySqlStatement.setString("pa_price", precio);
			mySqlStatement.setInt("pa_imgIdPrev",imagenPreview);
			mySqlStatement.setInt("pa_userID",userId);
			mySqlStatement.executeQuery();
			myConnection.close();
			System.out.println("Su publicación ha sido enviada!");

		} catch (SQLException e) {
			System.out.println("Error al enviar su publicación...");
			e.printStackTrace();

		}

	}
	
	void enviarImagen() {
		
		
	}

	public static ArrayList<String> llenarCombobox() {
		Statement sentencia = null;
		ResultSet resultado = null;
		ArrayList<String> lista = new ArrayList<String>();
		String Query = "SELECT DISTINCT id_property id FROM t_property WHERE id_user_property ="+ String.valueOf(HomeGUIController.usuarioActual.getId());
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			resultado = sentencia.executeQuery(Query);
			System.out.println("Correcto");
		} catch (Exception e) {
			System.out.println("No Correcto");
		}
		try {
			while(resultado.next()){
				lista.add(resultado.getString("id"));
			}
		} catch (Exception e) {
		}
		return lista;
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		cbxProperty.setItems(list);




	}





}
