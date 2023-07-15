package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ordiniDAO {

	public ArrayList<ordini> doFindAllOrders()
	{
		ArrayList<ordini> ordini=new ArrayList<>();
		
		try (Connection conn = ConnPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM ordini");
            ResultSet rs = ps.executeQuery();
            if(!rs.next()) {
            	return ordini=null;
            }else {
            	ordini o=new ordini(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
            	ordini.add(o);
            }
            
            while(rs.next()) {
            	ordini o=new ordini(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
            	ordini.add(o);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
        return ordini;
		
		
	}
	
	
	
	
}
