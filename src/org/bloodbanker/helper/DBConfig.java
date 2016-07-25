package org.bloodbanker.helper;

//import java.io.FileNotFoundException;
//import java.io.IOException;
//import java.io.InputStream;
//import java.sql.Statement;
//import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//import java.util.Properties;

public class DBConfig {

	public static Connection getDBConnection(){
		
		//Properties prop = new Properties();
		Connection conn = null;
		
		try {
			/*InputStream is = DBConfig.class.getClass().
					getResourceAsStream("/resources/db.properties");
			prop.load(is);
			Class.forName(prop.getProperty("drivername"));
			conn = DriverManager.getConnection(prop.getProperty("jdbcurl"),
					prop.getProperty("username"),prop.getProperty("password"));*/
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","fred","flintstone");
			/*Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT LOCATION_NAME FROM LOCATIONS");
			while(rs.next()){
				System.out.println(rs.getString("LOCATION_NAME"));
			}*/
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} /*catch (FileNotFoundException e){
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		
		return conn;
	}
	
	public static void main(String[] args) {
		DBConfig.getDBConnection();
	}
}
