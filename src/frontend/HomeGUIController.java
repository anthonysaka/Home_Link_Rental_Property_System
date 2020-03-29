package frontend;

import javafx.application.Application;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.Spinner;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class HomeGUIController extends Application {

    @FXML
    private Spinner<?> SpinnerAdults;

    @FXML
    private Spinner<?> SpinnerChildrens;

    @FXML
    private ScrollPane FoundPanel;

    @FXML
    private AnchorPane PreviewPanel;
    
    private double xoffset = 0;
	private double yoffset = 0;
    
    
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
    
    public void Spinners() {
    	
    	SpinnerAdults.increment(1);
    	SpinnerChildrens.increment(1);
    	
    }

}
