package frontend;

import java.net.URL;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;

import backend.PublicacionesParaVisualizar;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;

public class ViewPublicationGUI extends HomeGUIController implements Initializable {
	
    @FXML
    private Button btnClose;
    @FXML
    private ImageView imgView1;
    @FXML
    private ImageView imgView2;
    @FXML
    private JFXButton btnReservar;
    @FXML
    private Label lblTitulo;
    @FXML
    private Label lblDir;
    @FXML
    private Label lblCarac;
    @FXML
    private Label lblTipo;
    @FXML
    private Label lblFechaPubli;
    @FXML
    private Label lblPrecio;
    @FXML
    private Label lblUsuarioDue;

    PublicacionesParaVisualizar publicacion = auxlist;
    
    
    @Override
	public void initialize(URL location, ResourceBundle resources) {
    	/************************* Aqui se setean los datos para mostrar en la ventana
    	 * publicacion view full.
    	 */
    	lblTitulo.setText(publicacion.getTitulo());
    	lblDir.setText(publicacion.getDireccion());
    	lblTipo.setText(publicacion.getTipo());
    	lblFechaPubli.setText(publicacion.getFechaPublicacion());
    	lblUsuarioDue.setText(publicacion.getUsernamePublicador());
    	lblPrecio.setText(String.valueOf(publicacion.getPrecio()));
    	lblCarac.setText(publicacion.getCaracterisitcas());
    	
    	imgView1.setImage(publicacion.getImagePreviewHouse());
    	/*************************************************************/
    }
    
    @FXML
    void close_app(ActionEvent event) {
    	Stage stage = (Stage) btnClose.getScene().getWindow();
		stage.close();
    }
    
    

	
	

}
