package frontend;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.jfoenix.controls.JFXTextField;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.Tarjetas;
import backend.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.stage.Stage;

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
		String cardCvvTexto = txtcardCvv.getText();
		int cardCvv =  Integer.valueOf(cardCvvTexto);
		Tarjetas card = new Tarjetas(cardNumber, cardName, cardDate, cardCvv);	
		User.insertarTarjetas(card);	
		 Stage stage = (Stage) btnCancel.getScene().getWindow();
		 stage.close();
		
		/*
		if(cardNumber.length() == 16 && cardName.length() <=20 && cardDate.length() ==6 && cardCvv ==3)
		{
			User.insertarTarjetas(card);	
			JOptionPane.showMessageDialog(null,"Correcto","Registrado correctamente",JOptionPane.INFORMATION_MESSAGE);
			 Stage stage = (Stage) btnCancel.getScene().getWindow();
			 stage.close();
		}
		
		else if(cardNumber.isEmpty() || cardName.isEmpty() || cardDate.isEmpty() || cardCvvTexto.isEmpty()) {
			JOptionPane.showMessageDialog(null,"Advertencia","Complete todos los campos",JOptionPane.WARNING_MESSAGE);
			 Stage stage = (Stage) btnCancel.getScene().getWindow();
			 stage.close();
		}
		
		else {
			txtcardNumber.setText("");
			txtcardName.setText("");
			txtcardDate.setText("");
			txtcardCvv.setText("");
			JOptionPane.showMessageDialog(null,"Error","Registrado incorrecto",JOptionPane.ERROR_MESSAGE);
			Stage stage = (Stage) btnCancel.getScene().getWindow();

		}*/
		
    }

    @FXML
    void close(ActionEvent event) {
    	Stage stage = (Stage) btnCancel.getScene().getWindow();
		 stage.close();

    }
    
    
    
    
}



