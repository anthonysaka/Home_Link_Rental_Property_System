package frontend;

import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXListView;

import backend.Publicaciones;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Spinner;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class HomeGUIController extends Application implements Initializable {

    @FXML
    private Spinner<?> SpinnerAdults;
    @FXML
    private Spinner<?> SpinnerChildrens;
    @FXML
    private JFXButton btnSearch;
    @FXML
    private JFXListView<Publicaciones> publicationListView;
    @FXML
    private JFXComboBox<String> locationPropCbx;
    
    private double xoffset = 0;
	private double yoffset = 0;
    
	ObservableList<Publicaciones> listPublication = FXCollections.observableArrayList();
	
	public void start(Stage stageLogin) throws Exception {

		Parent rootLogin = FXMLLoader.load(LoginGUIController.class.getResource("../frontend/homeGUI.fxml"));
		Scene sceneLogin = new Scene(rootLogin);
		
		stageLogin.getIcons().add(new Image(LoginGUIController.class.getResourceAsStream("../frontend/images/bg_home_link.png")));
		stageLogin.setScene(sceneLogin);
		stageLogin.setResizable(false);
		stageLogin.setAlwaysOnTop(true);
		stageLogin.initStyle(StageStyle.TRANSPARENT);
		stageLogin.show();
		
		/*******
		 * EventHandler to Move Undecorated Window (Stage) Adapted from: StackOverflow
		 ******/
		rootLogin.setOnMousePressed(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				xoffset = stageLogin.getX() - event.getScreenX();
				yoffset = stageLogin.getY() - event.getScreenY();
			}
		});
		rootLogin.setOnMouseDragged(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				stageLogin.setX(event.getScreenX() + xoffset);
				stageLogin.setY(event.getScreenY() + yoffset);
			}
		});
		/******************* ********************************************/

	}
	
	/*******************/
	@Override
	public void initialize(URL location, ResourceBundle resources) {
	//	Publication_sql_query pusql = new Publication_sql_query();
	//	pusql.loadPublication(address_to_search)
	//	publicationListView.setItems(listPublication);
		
	}
	
	/**
	 * @throws SQLException ******************/
	
	@FXML
    void searchPublication(ActionEvent event) throws SQLException {
		//Publication_sql_query pusql = new Publication_sql_query();
		String ubicacionPropiedadABuscar = locationPropCbx.getSelectionModel().getSelectedItem().toString();
		ResultSet resultBD;
		
		if (!ubicacionPropiedadABuscar.isEmpty()) {
			resultBD = Publicaciones.loadPublication(ubicacionPropiedadABuscar);
			
			while (resultBD.next()) {
			//	listPublication.add(resultBD.get))
				
			}
		}	
    }
    
    public void Spinners() {
    	
    	SpinnerAdults.increment(1);
    	SpinnerChildrens.increment(1);
    	
    }



}
