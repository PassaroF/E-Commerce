package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class prodottoDAO {

	public ArrayList<prodotto> doFindAllPc()
	{
		ArrayList<prodotto> prodotto=new ArrayList<>();
		
		try (Connection conn = ConnPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM prodotti WHERE categoria='pc'");
            ResultSet rs = ps.executeQuery();
            if(!rs.next()) {
            	return prodotto=null;
            }else {
            	prodotto p=new prodotto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
            	prodotto.add(p);
            }
            
            while(rs.next()) {
            	prodotto p=new prodotto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
            	prodotto.add(p);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
        return prodotto;
		
		
	}
	public ArrayList<prodotto> doFindX()
	{
		ArrayList<prodotto> prodotto=new ArrayList<>();
		
		try (Connection conn = ConnPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM prodotti WHERE categoria='console'and marca='xbox'");
            ResultSet rs = ps.executeQuery();
            if(!rs.next()) {
            	return prodotto=null;
            }else {
            	prodotto p=new prodotto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
            	prodotto.add(p);
            }
            
            while(rs.next()) {
            	prodotto p=new prodotto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
            	prodotto.add(p);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
        return prodotto;
		
		
	}
	public ArrayList<prodotto> doFindOff()
	{
		ArrayList<prodotto> prodotto=new ArrayList<>();
		
		try (Connection conn = ConnPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM offerte WHERE categoria='offerta'");
            ResultSet rs = ps.executeQuery();
            if(!rs.next()) {
            	return prodotto=null;
            }else {
            	prodotto p=new prodotto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
            	prodotto.add(p);
            }
            
            while(rs.next()) {
            	prodotto p=new prodotto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
            	prodotto.add(p);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
        return prodotto;
		
		
	}
	
}
