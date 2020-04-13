package frontend;

import java.math.MathContext;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXRadioButton;
import com.jfoenix.controls.JFXSlider;
import com.mysql.cj.jdbc.CallableStatement;

import backend.ConnectionMySqlDB;
import backend.Reserva;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Tab;
import javafx.stage.Stage;

public class RatingGUIController extends TableReservationsGUIController implements Initializable{

    

	@FXML
    private JFXSlider slider1;

    @FXML
    private Tab excelente2;

    @FXML
    private JFXSlider slider2;

    @FXML
    private Tab excelente3;

    @FXML
    private JFXSlider slider3;

    @FXML
    private JFXButton btnrate;

    @FXML
    private JFXButton btnclose;

    @FXML
    private JFXSlider slider4;

	@FXML
	void close(ActionEvent event) {

		Stage x = (Stage) btnclose.getScene().getWindow();
		x.close(); 
		
		
		
	} 

	@FXML
	void rateReservation(ActionEvent event) {

		double uno = slider1.getValue();
		double dos = slider2.getValue();
		double tres = slider3.getValue();
		double cuatro = slider4.getValue();
		
		double x = (((uno * 0.05) + (dos * 0.05) + (tres * 0.05) + (cuatro * 0.05))/4);
		
		
		CallableStatement mySqlStatement = null; 
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();	
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_Rating(?,?)}");
			mySqlStatement.setInt("pa_idproperty", index);
			System.out.println("INDEX: "+index);
			mySqlStatement.setDouble("pa_rate", x);
			mySqlStatement.executeQuery();
			System.out.println("FEEDBACK ENVIADO");

		} catch (SQLException e) {
			System.out.println("Error al ENVIAR SU FEEDBACK");
			e.printStackTrace();
		}
		auxReserva.setIsrated(true);
		close(event);
	}

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		// TODO Auto-generated method stub
		
	}

}
