package frontend;

import java.awt.event.ActionEvent;

import com.jfoenix.controls.JFXButton;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class TablePublicationGUIController {

    @FXML
    private JFXButton btnAddPublication;

    @FXML
    private JFXButton btnModifyPublication;

    @FXML
    private JFXButton btnDeletePublication;

    @FXML
    private Button btnClose;

/******************************* METODOS **********************************/  
    @FXML
    void CloseWindow(ActionEvent event) {
    	Stage stage = (Stage) btnClose.getScene().getWindow();
    	stage.close();  
    }

}