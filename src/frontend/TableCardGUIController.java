package frontend;

import java.awt.event.ActionEvent;

import com.jfoenix.controls.JFXButton;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class TableCardGUIController {

    @FXML
    private JFXButton btnAddCard;

    @FXML
    private JFXButton btnModifyCard;

    @FXML
    private Button btnClose;

    @FXML
    private JFXButton btnDeleteCard;

    
 /*****************************METODOS**************************/    
 

    @FXML
    void closeWindow(ActionEvent event) {
    	Stage stage = (Stage) btnClose.getScene().getWindow();
    	stage.close();  
    	}
    @FXML
    void AddNewCard(ActionEvent event) {

    }
    
    
}




