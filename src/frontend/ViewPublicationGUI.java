package frontend;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

import javax.imageio.ImageIO;

import com.jfoenix.controls.JFXButton;

import backend.ConnectionMySqlDB;
import backend.PublicacionesParaVisualizar;
import backend.User;
import javafx.embed.swing.SwingFXUtils;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class ViewPublicationGUI extends HomeGUIController implements Initializable {
	
    @FXML
    private Button btnClose;
    @FXML
    private ImageView imgView1;
    @FXML
    private ImageView imgView2;
    @FXML
    private ImageView imgView3;
    @FXML
    private JFXButton btnReservar;
    @FXML
    private Label lblTitulo;
    @FXML
    private Label lblDir;
    @FXML
    private Label lblTipo;
    @FXML
    private Label lblFechaPubli;
    @FXML
    private Label lblPrecio;
    @FXML
    private Label lblUsuarioDue;

    @FXML
    private Label lblCarac1;
    @FXML
    private Label lblCarac2;
    @FXML
    private Label lblCarac3;
    @FXML
    private Label lblCarac4;
    @FXML
    private Label lblCarac5;
    @FXML
    private Label lblCarac6;
    @FXML
    private Label lblCarac7;
    @FXML
    private Label lblCarac8;
    @FXML
    private Label lblCaracOtro;
    @FXML
    private Label lblFechaEstadia;
    @FXML
    private Label lblCantPersona;

    @FXML
    private Label lblServiceFee;

    @FXML
    private Label lblPrecioTotal;
    
    PublicacionesParaVisualizar publicacion = auxlist;
 
    
    @Override
	public void initialize(URL location, ResourceBundle resources) {
    	/************************* Aqui se setean los datos para mostrar en la ventana
    	 * publicacion view full.
    	 */
    	String caracteristicas = publicacion.getCaracterisitcas();
    	String[] caracteSplited = caracteristicas.split(",");
    	
    	lblTitulo.setText(publicacion.getTitulo());
    	lblDir.setText(publicacion.getDireccion());
    	lblTipo.setText(publicacion.getTipo());
    	lblFechaPubli.setText(publicacion.getFechaPublicacion());
    	lblUsuarioDue.setText(publicacion.getUsernamePublicador());

    	lblCarac1.setText(caracteSplited[0]);
    	lblCarac2.setText(caracteSplited[1]);
    	lblCarac3.setText(caracteSplited[2]);
    	lblCarac4.setText(caracteSplited[3]);
    	lblCarac5.setText(caracteSplited[4]);
    	lblCarac6.setText(caracteSplited[5]);
    	lblCarac7.setText(caracteSplited[6]);
    	lblCarac8.setText(caracteSplited[7]);
    	lblCaracOtro.setText(caracteSplited[8]);
    	
    	lblPrecio.setText(String.valueOf(publicacion.getPrecio()));
    	
    	lblFechaEstadia.setText(dataIn + " - " + dataOut);
    	lblCantPersona.setText(String.valueOf(cantGuest));
    	
    	float servicefee = (float) (0.03 * (cantNoche *publicacion.getPrecio())); // calculo service fee
    	
    	lblServiceFee.setText(String.valueOf(servicefee));
    	
    	float totalprice = (cantNoche * publicacion.getPrecio()*cantGuest) + servicefee; //calculo precio total. publicacion.getPrecio() -> precio por noche.
   
    	lblPrecioTotal.setText(String.valueOf(totalprice)); 
    	
    	imgView1.setImage(publicacion.getImagePreviewHouse());
    	loadImages(auxlist.getId());
    	
    	
    	/*************************************************************/
    }
    
    public void loadImages(int idPublication) {
    	Statement sentencia = null;
		ResultSet rs = null;
		String id = String.valueOf(idPublication);
		String Query = "SELECT image FROM t_imagenes WHERE id_publication = "+"'"+ id +"' " + "AND descripcion NOT LIKE '%Preview%';";
		try {
			Connection myConnection = ConnectionMySqlDB.getConnectionMySqlDB();
			sentencia = myConnection.createStatement();
			rs = sentencia.executeQuery(Query);
			System.out.println("TABLA BIEN");
		} catch (Exception e) {
			System.out.println("No Correcto");
		}
		try { /* RECORDAR LIMPIAR EL CODIGO DE TODO EL PROYECTO [Mucho codigo repetido]*/
			int i = 2;
			while(rs.next()){
				byte[]  f51=rs.getBytes("image");
				ByteArrayInputStream bis = new ByteArrayInputStream(f51);
				BufferedImage read = ImageIO.read(bis);
				Image imgs = SwingFXUtils.toFXImage(read, null);
				if (i == 2) {
					imgView2.setImage(imgs);
					i++;
				}else {
					imgView3.setImage(imgs);
				}			
			}
		} catch (Exception e) {
		}
    }
    @FXML
    void close_app(ActionEvent event) {
    	Stage stage = (Stage) btnClose.getScene().getWindow();
		stage.close();
    }
    
    @FXML
    void do_reservation(ActionEvent event) throws IOException {
		Parent rootInvoice = FXMLLoader.load(getClass().getResource("../frontend/pagoReserva.fxml")); /* cambie temporalmente el loading */
		Stage stageInvoice = new Stage();
		Scene sceneInvoice = new Scene(rootInvoice);
		
		Stage stage = (Stage) btnClose.getScene().getWindow();
		stage.close();
		
		stageInvoice.setScene(sceneInvoice);
		stageInvoice.setResizable(false);
		stageInvoice.initStyle(StageStyle.TRANSPARENT);
		stageInvoice.show();
    }
    

	
	

}
