package frontend;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXListCell;
import com.jfoenix.controls.JFXListView;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.PublicacionesParaVisualizar;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;
import javafx.scene.control.Spinner;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.Priority;

public class HomeGUIController extends ListView<PublicacionesParaVisualizar> implements Initializable {

	@FXML
	private Spinner<?> SpinnerAdults;
	@FXML
	private Spinner<?> SpinnerChildrens;
	@FXML
	private JFXButton btnSearch;
	@FXML
	private JFXListView<PublicacionesParaVisualizar> publicationListView;
	@FXML
	private JFXComboBox<String> cbxLocation;


	ObservableList<PublicacionesParaVisualizar> listPublicationVisual = FXCollections.observableArrayList();
	ObservableList<String> list = FXCollections.observableArrayList(ConnectionMySqlDB.llenarCombo());
	
	ImageView img = new ImageView();



	/******* @throws SQLException ******************/
	@FXML
	void searchPublication(ActionEvent event) throws SQLException {
		//Publication_sql_query pusql = new Publication_sql_query();
		String ubicacionPropiedadABuscar = cbxLocation.getSelectionModel().getSelectedItem().toString();
		ResultSet resultBD;


		if (!ubicacionPropiedadABuscar.isEmpty()) {
			resultBD = PublicacionesParaVisualizar.loadPublication(ubicacionPropiedadABuscar);
			// Esto llena als publicaciones para visualizar.
			while (resultBD.next()) {
				listPublicationVisual.add(new PublicacionesParaVisualizar(resultBD.getString("type_property"), resultBD.getString("address"), 
						resultBD.getString("feedbacks"), resultBD.getString("characteristic"), resultBD.getString("Dueño"),
						resultBD.getString("publicaction_date"), resultBD.getFloat("price")));
			}
		
			publicationListView.setItems(listPublicationVisual);
			resultBD.close();

		}	

	}


	

	/** Initialization of Home Stage Here. Add all that you want start on begin. **/
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		// TODO Auto-generated method stub
		cbxLocation.setItems(list); //temporal
		
		
		

		/**** Propiedades del List View de las publicaciones ****/
		publicationListView.setExpanded(true);
		publicationListView.depthProperty().set(1);

		/********************************************************/
		publicationListView.setCellFactory(param -> new ListCell<PublicacionesParaVisualizar>() {
			public void updateItem(PublicacionesParaVisualizar item, boolean empty) {
				super.updateItem(item, empty);
				setGraphic(null);
				setText(null);
				if (!empty && item != null) {
					img.setImage(new Image("/frontend/images/casa-dos-pisos_1308-16176.jpg"));
					final String text = String.format("%s %s %s %s %s %s %f", item.getTipo(), item.getDireccion(), item.getFeedback(), item.getCaracterisitcas(),
							item.getUsernamePublicador(), item.getFechaPublicacion(), item.getPrecio());
					setText(text);
					setGraphic(img);
				}
			}
		});
	

		/**
		 * **********************************************************************/
		/*	publicationListView.setCellFactory(new Callback<JFXListView<PublicacionesParaVisualizar>, ListCell<PublicacionesParaVisualizar>>() {	
			public ListCell<PublicacionesParaVisualizar> call(JFXListView<PublicacionesParaVisualizar> param) {
				// TODO Auto-generated method stub
				return new listviewpublicationCellFactory();
			}
		});*/
		/****
		 * *********************************************************************/

	}
	
	public static ResultSet loadPublication(String address_to_search)
	{
		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_search_publication_by_dir(?)}");
			mySqlStatement.setString("pa_direccion", address_to_search);
			ResultSet rs = mySqlStatement.executeQuery();
			System.out.println("Busquedad con exito!");
			return rs;
			
		} catch (SQLException e) {
			System.out.println("Busquedad sin exito!");
			e.printStackTrace();
			return null;
		}
	}


	/************************* FIN *******************/

}


