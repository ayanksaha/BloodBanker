package org.bloodbanker.helper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.bloodbanker.dto.User;

public class UserDetails {

	public static User getUserDetails(Connection conn, String userId, String password){
		
		User user = null;
		try {
			//Connection con = DBConfig.getDBConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT USERNAME FROM USERS WHERE USERID='"+userId+"' AND PASSWD='"+password+"'");
			System.out.println("SELECT USERNAME FROM USERS WHERE USERID='"+userId+"' AND PASSWD='"+password+"'");
			while(rs.next()){
				user = new User();
				user.setUsername(rs.getString("USERNAME"));
				System.out.println(rs.getString("USERNAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
}
