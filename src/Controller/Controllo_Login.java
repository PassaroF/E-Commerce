package Controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;

public class Controllo_Login {

	
		public static boolean controllo(String email,String pass) {
			
			boolean status=false;
			
			try {
				 Class.forName("com.mysql.cj.jdbc.Driver");
				 
				 Connection con = null;
					String ip = "localhost";
					String port = "3306";
					String db = "database_bs";
					String username = "root";

					String password = "Marano1996";

					

				 Class.forName("com.mysql.cj.jdbc.Driver");
				 con= DriverManager.getConnection("jdbc:mysql://"+ ip+":"+ port+"/"+db+"?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", username, password);

				 PreparedStatement ps=con.prepareStatement("select * from utenti where email=? and pass=sha1(?)");
				 ps.setString(1, email);
				 ps.setString(2, pass);
				 
				 ResultSet rs=ps.executeQuery();
				 status=rs.next();
			 }catch(Exception e) {
				 
			 }
			return status;
		}

	}


