package frontend;


import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javax.imageio.ImageIO;
import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXDatePicker;
import com.jfoenix.controls.JFXListView;
import com.mysql.cj.jdbc.CallableStatement;
import backend.ConnectionMySqlDB;
import backend.Propiedad;
import backend.PublicacionesParaVisualizar;
import backend.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.embed.swing.SwingFXUtils;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Insets;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ContentDisplay;
import javafx.scene.control.DateCell;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.ListCell;
import javafx.scene.control.ListView;
import javafx.scene.control.Spinner;
import javafx.scene.control.SpinnerValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.paint.Color;
import javafx.scene.paint.Paint;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

import javafx.util.Callback;


public class HomeGUIController extends ListView<PublicacionesParaVisualizar> implements Initializable {

	@FXML
	private Spinner<Integer> spinnerGuest;
	@FXML
	private JFXButton btnSearch;
	@FXML
	private JFXListView<PublicacionesParaVisualizar> publicationListView;
	@FXML
	private JFXComboBox<String> cbxLocation;
	@FXML
	private JFXDatePicker datapickeCheckIn;
	@FXML
	private JFXButton btnAdmin;
	@FXML
	private JFXDatePicker datapickeCheckOut;

	private double xoffset = 0;
	private double yoffset = 0;
	public static PublicacionesParaVisualizar auxlist;
	public static  User usuarioActual = LoginGUIController.loggedUser;


	ObservableList<PublicacionesParaVisualizar> listPublicationVisual = FXCollections.observableArrayList();
	ObservableList<String> list = FXCollections.observableArrayList(llenarCombo());
	SpinnerValueFactory<Integer> valueSpinGuest = new SpinnerValueFactory.IntegerSpinnerValueFactory(1, 20, 1);

	/** Initialization of Home Stage Here. Add all that you want start on begin. **/
	@Override

	public void initialize(URL location, ResourceBundle resources) {
		spinnerGuest.setValueFactory(valueSpinGuest);
		spinnerGuest.getStyleClass().add(Spinner.STYLE_CLASS_SPLIT_ARROWS_HORIZONTAL);
		cbxLocation.setItems(list);
		initControlInDatapicker();
		initControlOutDatapicker();
		publicationListView.setCellFactory(new Callback<ListView<PublicacionesParaVisualizar>, ListCell<PublicacionesParaVisualizar>>() {
			@Override
			public ListCell<PublicacionesParaVisualizar> call(ListView<PublicacionesParaVisualizar> panListView) {
				return new CustomListCell();
			}
		});
	}

	@FXML
	public void clickToViewPublication(MouseEvent event) throws IOException {
		auxlist = publicationListView.getSelectionModel().getSelectedItem();
		//ViewPublicationGUI ax = new ViewPublicationGUI(auxlist);
		if (auxlist != null) {
			Parent rootPubli= FXMLLoader.load(getClass().getResource("../frontend/viewPublicacionesGUI.fxml"));
			Stage stagePubli= new Stage();
			Scene scenePubli= new Scene(rootPubli);

			stagePubli.setScene(scenePubli);
			stagePubli.setResizable(false);
			//stageRegister.setAlwaysOnTop(true);
			stagePubli.initStyle(StageStyle.TRANSPARENT);
			//	stageRegister.initModality(Modality.APPLICATION_MODAL);
			stagePubli.show();
		}


	}

	@FXML
	public void openAdminView(ActionEvent event) throws IOException {
		Parent rootAdmin = FXMLLoader.load(getClass().getResource("../frontend/admin1GUI.fxml"));
		Stage stageAdmin = new Stage();
		Scene sceneAdmin = new Scene(rootAdmin);

		stageAdmin.setScene(sceneAdmin);
		stageAdmin.show();

		/*******
		 * EventHandler to Move Undecorated Window (Stage) Adapted from: StackOverflow
		 ******/
		rootAdmin.setOnMousePressed(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				xoffset = stageAdmin.getX() - event.getScreenX();
				yoffset = stageAdmin.getY() - event.getScreenY();
			}
		});
		rootAdmin.setOnMouseDragged(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				stageAdmin.setX(event.getScreenX() + xoffset);
				stageAdmin.setY(event.getScreenY() + yoffset);
			}
		});
		/***************************************************************/
	}

	/******* @throws SQLException 
	 * @throws IOException ***************************************************************/
	@FXML
	public void searchPublication(ActionEvent event) throws SQLException, IOException {
		String ubicacionPropiedadABuscar = cbxLocation.getSelectionModel().getSelectedItem().toString();
		String [] ubicacionsplitted = ubicacionPropiedadABuscar.split(", ");
		ResultSet resultBD;

		if (!ubicacionPropiedadABuscar.isEmpty()) {
			publicationListView.getItems().clear();
			resultBD = PublicacionesParaVisualizar.loadPublication(ubicacionsplitted[0], ubicacionsplitted[1] );
			// Esto llena als publicaciones para visualizar.
			while (resultBD.next()) {
				byte[]  f51=resultBD.getBytes("image");
				ByteArrayInputStream bis = new ByteArrayInputStream(f51);
				BufferedImage read = ImageIO.read(bis);
				Image imgs = SwingFXUtils.toFXImage(read, null);
				listPublicationVisual.add(new PublicacionesParaVisualizar(resultBD.getString("titulo"), resultBD.getString("type"), resultBD.getString("address"), 
						resultBD.getString("rating"), resultBD.getString("characteristic"), resultBD.getString("Dueño"),
						resultBD.getString("date"), resultBD.getFloat("price"), imgs));
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

	@FXML

	void addProperty(ActionEvent event) throws IOException {
		Parent rootRegister = FXMLLoader.load(getClass().getResource("../frontend/tablePropertyGUI.fxml"));


		Stage stageRegister = new Stage();
		Scene sceneRegister = new Scene(rootRegister);

		stageRegister.setScene(sceneRegister);
		stageRegister.setResizable(false);
		//stageRegister.setAlwaysOnTop(true);
		stageRegister.initStyle(StageStyle.TRANSPARENT);
		//	stageRegister.initModality(Modality.APPLICATION_MODAL);
		stageRegister.show();

		/*******
		 * EventHandler to Move Undecorated Window (Stage) Adapted from: StackOverflow
		 ******/
		rootRegister.setOnMousePressed(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				xoffset = stageRegister.getX() - event.getScreenX();
				yoffset = stageRegister.getY() - event.getScreenY();
			}
		});
		rootRegister.setOnMouseDragged(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				stageRegister.setX(event.getScreenX() + xoffset);
				stageRegister.setY(event.getScreenY() + yoffset);
			}
		});


	}

	@FXML
	public void addCard(ActionEvent event) throws IOException {

		Parent rootRegister = FXMLLoader.load(getClass().getResource("../frontend/tableCardGUI.fxml"));
		Stage stageRegister = new Stage();
		Scene sceneRegister = new Scene(rootRegister);

		stageRegister.setScene(sceneRegister);
		stageRegister.setResizable(false);
		//stageRegister.setAlwaysOnTop(true);
		stageRegister.initStyle(StageStyle.TRANSPARENT);
		//	stageRegister.initModality(Modality.APPLICATION_MODAL);
		stageRegister.show();

		/*******
		 * EventHandler to Move Undecorated Window (Stage) Adapted from: StackOverflow
		 ******/
		rootRegister.setOnMousePressed(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				xoffset = stageRegister.getX() - event.getScreenX();
				yoffset = stageRegister.getY() - event.getScreenY();
			}
		});
		rootRegister.setOnMouseDragged(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				stageRegister.setX(event.getScreenX() + xoffset);
				stageRegister.setY(event.getScreenY() + yoffset);
			}
		});


	}

	public static ArrayList<String> llenarCombo()
	{
		ArrayList<String> lista = new ArrayList<String>();

		ResultSet rs = null;

		CallableStatement mySqlStatement = null ; // call stored procedure
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();	
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_direccionesPublicadas()}");
			rs = mySqlStatement.executeQuery();
			System.out.println("Direcciones cargadas en el rs");

		} catch (SQLException e) {
			System.out.println("Error al cargar sus propiedades!");
			e.printStackTrace();
		}
		try { /* RECORDAR LIMPIAR EL CODIGO DE TODO EL PROYECTO [Mucho codigo repetido]*/
			while(rs.next()){
				lista.add(rs.getString("direccion"));

			}
		} catch (Exception e) {
		}

		return lista;
	}


	private class CustomListCell extends ListCell<PublicacionesParaVisualizar> {
		ImageView imgView = new ImageView();
		ImageView iconStar = new ImageView(new Image("/frontend/starIcon.png"));
		Label lblTitulo = new Label();
		Label lblTipo = new Label();
		//Label lblDir = new Label();
		Label lblFeedBack = new Label();
		Label lblCaract = new Label();
		//Label lblUsernPubli = new Label();
		//	Label lblFechaPubli = new Label();
		Label lblPrecio = new Label();
		GridPane gridView = new GridPane();
		AnchorPane paneView = new AnchorPane();

		public CustomListCell() {
			gridView.setHgap(6); 
			gridView.setVgap(6);
			//gridView.setGridLinesVisible(true);
			GridPane.setHgrow(gridView,Priority.ALWAYS);
			GridPane.setVgrow(gridView,Priority.ALWAYS);
			imgView.setFitWidth(300);
			imgView.setFitHeight(200);
			imgView.setPreserveRatio(true);
			lblTipo.setStyle("-fx-font-family: Franklin Gothic Medium; -fx-font-size: 1.2em; -fx-text-fill: GRAY; -fx-font-style: italic;");
			lblTitulo.setStyle("-fx-font-family: Franklin Gothic Medium; -fx-font-weight: bold;"
					+ " -fx-font-size: 1.5em; -fx-text-fill: BLACK;");
			lblCaract.setStyle("-fx-font-family: Franklin Gothic Medium;-fx-font-size: 1.2em; -fx-text-fill: GRAY;");
			lblPrecio.setStyle("-fx-font-family: Franklin Gothic Medium; -fx-font-weight: bold; "
					+ "-fx-font-size: 1.2em; -fx-text-fill: BLACK;");
			lblFeedBack.setStyle("-fx-font-family: Franklin Gothic Medium; -fx-font-size: 1.0em; -fx-text-fill: black; -fx-font-style: normal;");
			gridView.add(imgView, 0, 0, 1, 5);
			gridView.add(lblTipo, 1, 1);
			gridView.add(lblTitulo, 1, 2, 1, 1);
			gridView.add(lblCaract, 1, 3, 2,1);
			gridView.add(lblPrecio, 2, 4);
			gridView.add(iconStar, 2, 1);
			gridView.add(lblFeedBack, 2, 1);
			GridPane.setMargin(lblTitulo, new Insets(0, 0, 0, 10));
			GridPane.setMargin(lblTipo, new Insets(0, 0, 0, 10));
			GridPane.setMargin(lblCaract, new Insets(0, 0, 0, 10));
			GridPane.setMargin(iconStar, new Insets(0, 0, 0, 95));
			GridPane.setMargin(lblFeedBack, new Insets(0, 0, 0, 120));
			GridPane.setMargin(lblPrecio, new Insets(0, 0, 0, 120));
			AnchorPane.setTopAnchor(gridView, 0d); 
			AnchorPane.setLeftAnchor(gridView, 0d); 
			AnchorPane.setBottomAnchor(gridView, 0d); 
			AnchorPane.setRightAnchor(gridView, 0d);
			paneView.getChildren().add(gridView);
		}
		/********************************************************/

		public void updateItem(PublicacionesParaVisualizar item, boolean empty) {
			super.updateItem(item, empty);
			setContentDisplay(ContentDisplay.LEFT); 
			if (!empty && item != null) {
				imgView.setImage(item.getImagePreviewHouse());
				lblTipo.setText(item.getTipo());
				lblTitulo.setText(item.getTitulo());
				lblCaract.setText(item.getCaracterisitcas());
				lblPrecio.setText(String.valueOf(item.getPrecio()));
				lblFeedBack.setText(item.getFeedback());
				setGraphic(paneView);
				setContentDisplay(ContentDisplay.GRAPHIC_ONLY);
			}else {
				setText(null);
				setGraphic(null);
			}
		}
	}

	@FXML
	public void publish(ActionEvent event) throws IOException {

		Parent rootRegister = FXMLLoader.load(getClass().getResource("../frontend/tablePublicationGUI.fxml"));
		Stage stageRegister = new Stage();
		Scene sceneRegister = new Scene(rootRegister);

		stageRegister.setScene(sceneRegister);
		stageRegister.setResizable(false);
		//stageRegister.setAlwaysOnTop(true);
		stageRegister.initStyle(StageStyle.TRANSPARENT);
		//	stageRegister.initModality(Modality.APPLICATION_MODAL);
		stageRegister.show();

		/*******
		 * EventHandler to Move Undecorated Window (Stage) Adapted from: StackOverflow
		 ******/
		rootRegister.setOnMousePressed(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				xoffset = stageRegister.getX() - event.getScreenX();
				yoffset = stageRegister.getY() - event.getScreenY();
			}
		});
		rootRegister.setOnMouseDragged(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				stageRegister.setX(event.getScreenX() + xoffset);
				stageRegister.setY(event.getScreenY() + yoffset);
			}
		});

	}

	public void initControlInDatapicker () {
		datapickeCheckIn.setValue(LocalDate.now());
		datapickeCheckIn.setEditable(false);
		Callback<DatePicker, DateCell> dayCellFactory = dp -> new DateCell() {
			@Override
			public void updateItem(LocalDate item, boolean empty) {
				super.updateItem(item, empty);
				this.setDisable(false);
				this.setBackground(null);
				this.setTextFill(Color.BLACK);

				if (item.isBefore(LocalDate.now())) {
					this.setDisable(true);
				}

				// marcar los dias de quincena
				/*      int day = item.getDayOfMonth();
		        if(day == 15 || day == 30) {

		            Paint color = Color.RED;
		            BackgroundFill fill = new BackgroundFill(color, null, null);

		            this.setBackground(new Background(fill));
		            this.setTextFill(Color.WHITESMOKE);
		        }*/

				/*    // fines de semana en color verde
		        DayOfWeek dayweek = item.getDayOfWeek();
		        if (dayweek == DayOfWeek.SATURDAY || dayweek == DayOfWeek.SUNDAY) {
		            this.setTextFill(Color.GREEN);
		        }*/
			}
		};

		datapickeCheckIn.setDayCellFactory(dayCellFactory);
	}

	public void initControlOutDatapicker () {
		datapickeCheckOut.setEditable(false);
		Callback<DatePicker, DateCell> dayCellFactory = dp -> new DateCell() {
			@Override
			public void updateItem(LocalDate item, boolean empty) {
				super.updateItem(item, empty);
				this.setDisable(false);
				this.setBackground(null);
				this.setTextFill(Color.BLACK);

				if (item.isBefore(datapickeCheckIn.getValue())) {
					this.setDisable(true);
				}

				// marcar los dias de quincena
				/*      int day = item.getDayOfMonth();
		        if(day == 15 || day == 30) {

		            Paint color = Color.RED;
		            BackgroundFill fill = new BackgroundFill(color, null, null);

		            this.setBackground(new Background(fill));
		            this.setTextFill(Color.WHITESMOKE);
		        }*/

				/*    // fines de semana en color verde
		        DayOfWeek dayweek = item.getDayOfWeek();
		        if (dayweek == DayOfWeek.SATURDAY || dayweek == DayOfWeek.SUNDAY) {
		            this.setTextFill(Color.GREEN);
		        }*/
			}
		};
		datapickeCheckOut.setDayCellFactory(dayCellFactory);
	}

	@FXML
	void closeApp(ActionEvent event) {
		System.exit(0);
	}


	/************************* FIN *******************/

}


