package frontend;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jfoenix.controls.JFXTextField;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.Tarjetas;
import backend.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;

public class AddcardGUIController extends ConnectionMySqlDB{

    @FXML
    private JFXTextField txtcardNumber;

    @FXML
    private JFXTextField txtcardName;

    @FXML
    private JFXTextField txtcardDate;

    @FXML
    private JFXTextField txtcardCvv;

    @FXML
    private Button btnSave;

    @FXML
    private Button btnCancel;

    @FXML
    
    void saveCard(ActionEvent event) {
    	
    	String cardNumber = txtcardNumber.getText();
		String cardName = txtcardName.getText();
		String cardDate = txtcardDate.getText() + "00";
		int cardCvv =  Integer.valueOf(txtcardCvv.getText());
		Tarjetas card = new Tarjetas(cardNumber, cardName, cardDate, cardCvv);		
		User.insertarTarjetas(card);	
    }
}



