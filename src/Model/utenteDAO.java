package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class utenteDAO {
	public ArrayList<utente> doallUtenti(){
		ArrayList<utente> utente=new ArrayList<>();
		
		try (Connection conn = ConnPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM utenti ");
            
            ResultSet rs = ps.executeQuery();
            
           
            if(!rs.next()) {
            	return utente=null;
            }else {
            	utente u=new utente(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)
            			,rs.getString(9),rs.getString(10),rs.getString(11));
            	utente.add(u);
            }
            
            while(rs.next()) {
            	utente u=new utente(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)
            			,rs.getString(9),rs.getString(10),rs.getString(11));
            	utente.add(u);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
        return utente;
		
	}
	
}
