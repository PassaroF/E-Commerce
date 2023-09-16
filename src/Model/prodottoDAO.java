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
	public ArrayList<prodotto> doFindAll()
	{
		ArrayList<prodotto> prodotto=new ArrayList<>();
		
		try (Connection conn = ConnPool.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM prodotti ");
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
	public int delete(int id) {
	    try (Connection conn = ConnPool.getConnection()) {
	        PreparedStatement ps = conn.prepareStatement("DELETE FROM prodotti WHERE ID = ?");
	        ps.setInt(1, id); // Imposta il parametro ID nella query
	        int rowsAffected = ps.executeUpdate(); // Esegui la query di eliminazione
	        
	        if (rowsAffected > 0) {
	            // La query ha eliminato almeno una riga, quindi ritorna 1 per indicare il successo
	            return 1;
	        } else {
	            // La query non ha eliminato alcuna riga, quindi ritorna 0 per indicare che l'ID non esiste
	            return 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return -1; // Ritorna un valore negativo per indicare un errore
	    }
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
	public int modifica(int id, String nuovoNome, String nuovoCosto, String nuovaDescrizione, String nuovaUnita, String nuovaCategoria, String nuovaImmagine, String nuovaMarca) {
	    try (Connection conn = ConnPool.getConnection()) {
	        PreparedStatement ps = conn.prepareStatement("UPDATE prodotti SET nome=?, costo=?, descrizione=?, unita=?, categoria=?, immagine=?, marca=? WHERE id=?");
	        ps.setString(1, nuovoNome);
	        ps.setString(2, nuovoCosto);
	        ps.setString(3, nuovaDescrizione);
	        ps.setString(4, nuovaUnita);
	        ps.setString(5, nuovaCategoria);
	        ps.setString(6, nuovaImmagine);
	        ps.setString(7, nuovaMarca);
	        ps.setInt(8, id); // Imposta il parametro ID nella query
	        int rowsAffected = ps.executeUpdate(); // Esegui la query di eliminazione
	        
	        if (rowsAffected > 0) {
	            // La query ha eliminato almeno una riga, quindi ritorna 1 per indicare il successo
	            return 1;
	        } else {
	            // La query non ha eliminato alcuna riga, quindi ritorna 0 per indicare che l'ID non esiste
	            return 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return -1; // Ritorna un valore negativo per indicare un errore
	    }
	}
}
