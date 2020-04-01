package backend;

import java.sql.Connection;
import java.sql.SQLException;

import com.mysql.cj.jdbc.CallableStatement;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class User extends ConnectionMySqlDB{
	/**
	 * This class, represent user table on database
	 */
	
	private int id;
	private String name;
	private String lastname;
	private String gender;
	private String type;
	private String username;
	private String email;
	private String password;
	private String status;
	private int country_location_id;
	private String telephone_number;
	private String created_date;
	

	public User(String name, String lastname, String gender, String type, String username, String email, String password,
			String created_date) {
		super();
		this.name = name;
		this.lastname = lastname;
		this.gender = gender;
		this.type = type;
		this.username = username;
		this.email = email;
		this.password = password;
		this.created_date = created_date;
	}
	/*** Gets and Sets ***/

	public int getId() {
		return id;
	}
	public String getUsername() {
		return username;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getLastname() {
		return lastname;
	}
	public String getGender() {
		return gender;
	}
	public int getCountry_location_id() {
		return country_location_id;
	}
	public String getTelephone_number() {
		return telephone_number;
	}
	public String getType() {
		return type;
	}
	public String getStatus() {
		return status;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setCountry_location_id(int country_location_id) {
		this.country_location_id = country_location_id;
	}
	public void setTelephone_number(String telephone_number) {
		this.telephone_number = telephone_number;
	}
	public void settype(String type) {
		this.type = type;
	}
	public void setstatus(String status) {
		this.status = status;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	// Method to create user. Send parameters to Database.
	public static boolean create_add_user(User pUser) {
		
		
		CallableStatement mySqlStatement = null ; // call stored procedure
		
		try {
			Connection myConnection = getConnectionMySqlDB();
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{CALL sp_createUser(?,?,?,?,?,?,?,?,?)}");
			
			mySqlStatement.setString("pa_username", pUser.getUsername());
			mySqlStatement.setString("pa_email", pUser.getEmail());
			mySqlStatement.setString("pa_password", pUser.getPassword());
			mySqlStatement.setString("pa_name", pUser.getName());
			mySqlStatement.setString("pa_lastname", pUser.getLastname());
			mySqlStatement.setString("pa_gender", pUser.getGender());
			mySqlStatement.setString("pa_type", pUser.getType());
			mySqlStatement.setString("pa_status", pUser.getStatus());
			mySqlStatement.setString("pa_created_date", pUser.getCreated_date());
			mySqlStatement.executeQuery();
			myConnection.close();
			System.out.println("User creado con exito!");
			return true;
			
		} catch (SQLException e) {
			System.out.println("User no creado con exito!");
			e.printStackTrace();
			return false;
		}
	}




}
