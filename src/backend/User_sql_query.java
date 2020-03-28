package backend;

import com.mysql.cj.jdbc.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class User_sql_query extends ConnectionMySqlDB {
	
	
	// Method to create user. Send parameters to Database.
	public boolean create_add_user(User pUser) {
		
		Connection myConnection = (Connection) getConnectionMySqlDB();
		CallableStatement mySqlStatement = null ; // call stored procedure
		
		try {
			mySqlStatement = (CallableStatement) myConnection.prepareCall("{call sp_createUser(?,?,?,?,?,?,?,?,?)}");
			
			mySqlStatement.setString("pa_username", pUser.getUsername());
			mySqlStatement.setString("pa_email", pUser.getEmail());
			mySqlStatement.setString("pa_password", pUser.getPassword());
			mySqlStatement.setString("pa_name", pUser.getName());
			mySqlStatement.setString("pa_lastname", pUser.getLastname());
			mySqlStatement.setString("pa_gender", pUser.getGender());
			mySqlStatement.setInt("pa_type_id", pUser.getType_id());
			mySqlStatement.setInt("pa_status_id", pUser.getStatus_id());
			mySqlStatement.setString("pa_created_date", pUser.getCreated_date());
			System.out.println("User creado con exito!");
			return true;
			
		} catch (SQLException e) {
			System.out.println("User no creado con exito!");
			e.printStackTrace();
			return false;
		}
	}

}
