package frontend;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.util.Duration;

public class SpashLoginHomeGUIController implements Initializable{
   
    @FXML
    private AnchorPane splashAnchorPane;
    



	@Override
	public void initialize(URL location, ResourceBundle resources) {
		Transition.applyTransition(splashAnchorPane, Duration.seconds(8), (e) ->{
			try {
				Parent	rootHome = FXMLLoader.load(getClass().getResource("../frontend/homeGUI.fxml"));
				Stage stageHome = new Stage();
				Scene sceneHome = new Scene(rootHome);

				stageHome.setScene(sceneHome);
				stageHome.setResizable(false);
				stageHome.setAlwaysOnTop(true);
				stageHome.initStyle(StageStyle.TRANSPARENT);
				//splashAnchorPane.getChildren().removeAll(); para cambiar de fxml en el mismo pane
				//splashAnchorPane.getChildren().setAll(rootHome);
				stageHome.show();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		});	
	}
	


}
