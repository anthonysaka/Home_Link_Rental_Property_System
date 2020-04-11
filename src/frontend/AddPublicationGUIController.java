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
import com.sun.org.apache.xerces.internal.util.URI;

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
	FileChooser preview;
	String path1;
	String path2;
	String path3;
	



	@FXML
	void browseImage(ActionEvent event) throws FileNotFoundException {

		FileChooser fc = new FileChooser();

		fc.setInitialDirectory(new File("C:\\Users\\jhan_\\git\\Home_Link_Rental_Property_System\\src"));

		File selectedFile = fc.showOpenDialog(null);

		if(selectedFile != null && (x != 1)){

			imagen = new Image(selectedFile.toURI().toString(), imgview1.getFitWidth(), imgview1.getFitHeight(), true, true);//path, PrefWidth, PrefHeight, PreserveRatio, Smooth

			imgview1.setImage(imagen);
			x = 1;
			path1 = selectedFile.getAbsolutePath();

		}
		else if(selectedFile != null && (y != 1) ){


			imagen = new Image(selectedFile.toURI().toString(), imgview2.getFitWidth(), imgview2.getFitHeight(), true, true);//path, PrefWidth, PrefHeight, PreserveRatio, Smooth

			imgview2.setImage(imagen);

			y = 1;

			path2 = selectedFile.getAbsolutePath();

		}
		else if(selectedFile != null && (z != 1) ){


			imagen = new Image(selectedFile.toURI().toString(), imgview3.getFitWidth(), imgview3.getFitHeight(), true, true);//path, PrefWidth, PrefHeight, PreserveRatio, Smooth

			imgview3.setImage(imagen);
			z = 1;

			path3 = selectedFile.getAbsolutePath();
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
	void savePublication(ActionEvent event) throws FileNotFoundException {

		String titulo = txtTitulo.getText();
		String precio = txtPrice.getText();
		String property = cbxProperty.getSelectionModel().getSelectedItem().toString();
		int userId = HomeGUIController.usuarioActual.getId();
	


		InputStream sendImage = new FileInputStream(new File(path1));
		InputStream sendImage2 = new FileInputStream(new File(path2));
		InputStream sendImage3 = new FileInputStream(new File(path3));
		
		
		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();	

			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_insert_publicacion(?,?,?,?)}");
			mySqlStatement.setString("pa_titulo", titulo);
			mySqlStatement.setInt("pa_propertyID", Integer.valueOf(property));
			mySqlStatement.setFloat("pa_price", Float.valueOf(precio));
			mySqlStatement.setInt("pa_userID",userId);
			mySqlStatement.executeQuery();
			myConnection.close();
			System.out.println("Su publicación ha sido enviada!");

		} catch (SQLException e) {
			System.out.println("Error al enviar su publicación...");
			e.printStackTrace();

		}
		
		enviarImagen(sendImage, "Preview", idPublicacion());
		enviarImagen(sendImage2, "Imagen 2", idPublicacion());
		enviarImagen(sendImage3, "Imagen 3", idPublicacion());
		
		System.out.println("SE ENVIARON LAS IMAGENES");


	}

	public static ArrayList<String> llenarCombobox() {
		Statement sentencia = null;
		ResultSet resultado = null;
		ArrayList<String> lista = new ArrayList<String>();
		String Query = "SELECT DISTINCT id FROM t_property WHERE id_user_owner ="+String.valueOf(HomeGUIController.usuarioActual.getId()+" AND t_property.status = 0");
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
	
	int idPublicacion() {
		int x = 0;
		Statement sentencia = null;
		ResultSet resultado = null;
		ArrayList<String> lista = new ArrayList<String>();
		String Query = "SELECT id ID FROM t_publication ORDER BY id DESC limit 1";
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			resultado = sentencia.executeQuery(Query);
			
			while (resultado.next()) {
				x = resultado.getInt("id");
				System.out.println("Id Publicacion Obtenido");
			}
			
		} catch (Exception e) {
			System.out.println("ID Publicacion no obtenido");
		}
		
		return x;
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		cbxProperty.setItems(list);

	}

	void enviarImagen(InputStream path, String descripcion, int id) {
		CallableStatement mySqlStatement1 = null ; // call stored procedure
		try {
			Connection myConnection1 = ConnectionMySqlDB.getConnectionMySqlDB();	

			mySqlStatement1 = (CallableStatement) myConnection1.prepareCall("{CALL sp_insertImagenes(?,?,?)}");
			mySqlStatement1.setString("pa_descripcion", descripcion);
			mySqlStatement1.setBlob("pa_imagen", path);
			mySqlStatement1.setInt("pa_id_publicacion", id);
			mySqlStatement1.executeQuery();
			myConnection1.close();
			System.out.println("Su Imagen ha sido enviada!");

		} catch (SQLException e) {
			System.out.println("Error al enviar su Imagen...");
			e.printStackTrace();

		}
	}





}
