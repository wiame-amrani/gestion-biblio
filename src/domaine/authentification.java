package domaine;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Utility.BibalExceptions;
import Utility.DBConnection;

public class authentification {

	
	public boolean check(String email, String password) throws Exception {
		boolean auth= false;
		String sql = "SELECT * FROM authentification WHERE email = ? AND password = ?";
		PreparedStatement pst = DBConnection.getConnection().prepareStatement(sql);
		pst.setString(1, email);
		pst.setString(2, password);
		ResultSet rs = pst.executeQuery();
		if (rs.next()) {
			auth = true;
		}
		return auth;
	}
	public boolean insert(String email, String passw) throws Exception{
//		boolean auth=false;
		String sql = "insert into authentification (email,password) values (?,?) ";
		PreparedStatement pst = DBConnection.getConnection().prepareStatement(sql);
		pst.setString(1, email);
		pst.setString(2, passw);
		int result = pst.executeUpdate();
		return result > 0;
	}
}
