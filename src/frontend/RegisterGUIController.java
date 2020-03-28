package frontend;

import com.jfoenix.controls.JFXButton;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class RegisterGUIController {

    @FXML
    private JFXButton btnSignUp;

    @FXML
    private AnchorPane anchorPaneRoot;

  /*  @FXML
    private Button btnMinimize;
*/
    @FXML
    private Button btnClose;


    
    
    
    /*** METHODS ***/
	@FXML
	void closeWindow(ActionEvent event) {
		 Stage stage = (Stage) btnClose.getScene().getWindow();
		 stage.close();
	}

/*	@FXML
	void minimizeWindow(ActionEvent event) {
		 Stage stage = (Stage) btnClose.getScene().getWindow();
		 stage.setIconified(true);
	}
*/

    @FXML
    void setRegister(ActionEvent event) {

    }

}
