package frontend;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.util.Duration;

public class SpashLoginHomeGUIController implements Initializable{

	@FXML
	private AnchorPane splashAnchorPane;

	private double xoffset = 0;
	private double yoffset = 0;


	@Override
	public void initialize(URL location, ResourceBundle resources) {
		Transition.applyTransition(splashAnchorPane, Duration.seconds(8), (e) ->{
			try {
				Parent	rootHome = FXMLLoader.load(getClass().getResource("../frontend/homeGUI.fxml"));
				Stage stageHome = new Stage();
				Scene sceneHome = new Scene(rootHome);

				stageHome.setScene(sceneHome);
				stageHome.setResizable(false);
				stageHome.initStyle(StageStyle.TRANSPARENT);
				//splashAnchorPane.getChildren().removeAll(); para cambiar de fxml en el mismo pane
				//splashAnchorPane.getChildren().setAll(rootHome);
				Stage stage = (Stage) splashAnchorPane.getScene().getWindow();
				stage.close();
				stageHome.show();

				/*******
				 * EventHandler to Move Undecorated Window (Stage) Adapted from: StackOverflow
				 ******/
				rootHome.setOnMousePressed(new EventHandler<MouseEvent>() {
					@Override
					public void handle(MouseEvent event) {
						xoffset = stageHome.getX() - event.getScreenX();
						yoffset = stageHome.getY() - event.getScreenY();
					}
				});
				rootHome.setOnMouseDragged(new EventHandler<MouseEvent>() {
					@Override
					public void handle(MouseEvent event) {
						stageHome.setX(event.getScreenX() + xoffset);
						stageHome.setY(event.getScreenY() + yoffset);
					}
				});
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		});	
	}



}
