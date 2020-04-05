package frontend;


import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXListCell;
import com.jfoenix.controls.JFXListView;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.PublicacionesParaVisualizar;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.embed.swing.SwingFXUtils;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.HPos;
import javafx.geometry.VPos;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;
import javafx.scene.control.Spinner;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
import javafx.scene.layout.RowConstraints;

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

<<<<<<< HEAD


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


	
=======
	ImageView imgView = new ImageView();
	Label lblTitulo = new Label("  ANADIR COLUMNA TITULO EN LA BASE DE DATOS  ");
	Label lblTipo = new Label();
	Label lblDir = new Label();
	Label lblFeedBack = new Label();
	Label lblCaract = new Label();
	Label lblUsernPubli = new Label();
	Label lblFechaPubli = new Label();
	Label lblPrecio = new Label();
	GridPane gridView = new GridPane();
	AnchorPane paneView = new AnchorPane();
>>>>>>> branch 'master' of https://github.com/anthonysaka/Home_Link_Rental_Property_System.git

	/** Initialization of Home Stage Here. Add all that you want start on begin. **/
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		gridView.setHgap(6); 
		gridView.setVgap(6);
		gridView.setGridLinesVisible(true);
		
		imgView.setFitWidth(300);
		imgView.setFitHeight(150);
		imgView.setPreserveRatio(true);
		
		lblTitulo.setStyle("-fx-font-weight: bold; -fx-font-size: 1.5em;");
		lblTipo.setStyle("-fx-font-weight: bold; -fx-font-size: 1.5em;");
		lblCaract.setStyle("-fx-font-weight: bold; -fx-font-size: 1.5em;");
		
		gridView.add(imgView, 0, 0, 1, 3);
		gridView.add(lblTitulo, 1, 2);
	//	gridView.add(lblCaract, columnIndex, rowIndex);
		


		AnchorPane.setTopAnchor(gridView, 0d); 
		AnchorPane.setLeftAnchor(gridView, 0d); 
		AnchorPane.setBottomAnchor(gridView, 0d); 
		AnchorPane.setRightAnchor(gridView, 0d);
		paneView.getChildren().add(gridView);


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
				setContentDisplay(ContentDisplay.LEFT); 
				if (!empty && item != null) {
					imgView.setImage(item.getImagePreviewHouse());
					lblTipo.setText(item.getTipo());
					lblCaract.setText(item.getCaracterisitcas());
					lblDir.setText(item.getDireccion());
					//final String text = String.format("%s %s %s %s %s %s %f", item.getTipo(), item.getDireccion(), item.getFeedback(), item.getCaracterisitcas(),
					//		item.getUsernamePublicador(), item.getFechaPublicacion(), item.getPrecio());
					//setText(text);
					setText(null);
					//setGraphic(imgView);
					setGraphic(paneView);
					setContentDisplay(ContentDisplay.GRAPHIC_ONLY);
				}
			}
		});
	}


	/******* @throws SQLException 
	 * @throws IOException ******************/
	@FXML
	void searchPublication(ActionEvent event) throws SQLException, IOException {
		//Publication_sql_query pusql = new Publication_sql_query();
		String ubicacionPropiedadABuscar = cbxLocation.getSelectionModel().getSelectedItem().toString();
		ResultSet resultBD;

		if (!ubicacionPropiedadABuscar.isEmpty()) {
			publicationListView.getItems().clear();
			resultBD = PublicacionesParaVisualizar.loadPublication(ubicacionPropiedadABuscar);
			// Esto llena als publicaciones para visualizar.
			while (resultBD.next()) {
				byte[]  f51=resultBD.getBytes("image");
				ByteArrayInputStream bis = new ByteArrayInputStream(f51);
				BufferedImage read = ImageIO.read(bis);
				Image imgs = SwingFXUtils.toFXImage(read, null);
				listPublicationVisual.add(new PublicacionesParaVisualizar(resultBD.getString("type_property"), resultBD.getString("address"), 
						resultBD.getString("feedbacks"), resultBD.getString("characteristic"), resultBD.getString("Dueño"),
						resultBD.getString("publicaction_date"), resultBD.getFloat("price"), imgs));
			}

			publicationListView.setItems(listPublicationVisual);
			resultBD.close();
		}	
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


