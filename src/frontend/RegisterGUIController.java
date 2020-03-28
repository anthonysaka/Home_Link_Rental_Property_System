package frontend;

import java.net.URL;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class RegisterGUIController implements Initializable {

    @FXML
    private JFXButton btnSignUp;
    @FXML
    private AnchorPane anchorPaneRoot;
    @FXML
    private Button btnClose;
    @FXML
    private JFXComboBox<String> cbxGender;
    @FXML
    private JFXComboBox<String> cbxCategoryAccount;

    ObservableList<String> listGender = FXCollections.observableArrayList("Masculino","Femenino","Prefiero no decirlo");
    ObservableList<String> listTypeAccount = FXCollections.observableArrayList("Personal","Empresa");
    
    /*** METHODS ***/
	@FXML
	void closeWindow(ActionEvent event) {
		 Stage stage = (Stage) btnClose.getScene().getWindow();
		 stage.close();
	}
	
    @FXML
    void setRegister(ActionEvent event) {
    	
    }

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		cbxGender.setItems(listGender);
		cbxCategoryAccount.setItems(listTypeAccount);
		
	}
    
}
