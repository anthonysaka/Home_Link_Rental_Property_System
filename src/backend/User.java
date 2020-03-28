package backend;

/**
 * @developed_by Anthony Sakamoto
 *
 */
public class User {
	/**
	 * This class, represent user table on database
	 */

	private int id;
	private String username;
	private String email;
	private String password;
	private String name;
	private String lastname;
	private String gender;
	private int country_location_id;
	private String telephone_number;
	private int type_id;
	private int status_id;
	private String created_date;


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
	public int getType_id() {
		return type_id;
	}
	public int getStatus_id() {
		return status_id;
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
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}




}
