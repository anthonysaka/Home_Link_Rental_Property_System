package frontend;

import java.io.IOException;
import java.util.Arrays;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import backend.ConnectionMySqlDB;
import backend.Tarjetas;
import backend.User;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

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
    private StackPane rootStackPane;

    @FXML
    private AnchorPane rootAnchorPane;

    
	@FXML
	void saveCard(ActionEvent event) {

		String cardNumber = txtcardNumber.getText();
		String cardName = txtcardName.getText();
		String cardDate = txtcardDate.getText() + "00";
		String cardCvvTexto = txtcardCvv.getText();
		int cardCvv =  Integer.valueOf(cardCvvTexto);
		Tarjetas card = new Tarjetas(cardNumber, cardName, cardDate, cardCvv);	
		JFXButton btnOk = new JFXButton("Ok!");
		btnOk.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				pagoReversaGUIController.llenarComboTarjeta();
				Stage stage = (Stage) btnCancel.getScene().getWindow();
				stage.close();
				Parent rootRegister;
				try {
					rootRegister = FXMLLoader.load(getClass().getResource("../frontend/tableCardGUI.fxml"));
					Stage stageRegister = new Stage();
					Scene sceneRegister = new Scene(rootRegister);
					stageRegister.setScene(sceneRegister);
					stageRegister.setResizable(false);
					stageRegister.initStyle(StageStyle.TRANSPARENT);
					stageRegister.show();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 						
			}
		});
		if(User.insertarTarjetas(card)) {
			
			PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),
					"Tarjeta insertada con exito!", null);	
		} else {
			PopupAlert.showCustomDialog(rootStackPane, rootAnchorPane, Arrays.asList(btnOk),"Error!\n" 
					+ "Hubo un error!", null);
		}

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
		HomeGUIController.llenarCombo();

	}




}



