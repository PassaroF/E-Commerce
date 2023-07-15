package ma;


import ma.mar.MarBean;
import ma.mar.MarDAO;
import ma.mar.Mar;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarrelloModel {
    private ArrayList<Mar> carrello;

    public CarrelloModel() {
        carrello = new ArrayList<>();
    }

    public List<Mar> getCarrello() {
        return carrello;
    }

    public void setCarrello(List<Mar> carrello) {
        this.carrello = (ArrayList<Mar>) carrello;
    }
    
    
  public synchronized void aggiungi(int ID) {
        for (Mar m : carrello) {
            if (m.getMarBean().getID() == ID) {
                m.incrementaQuantita();
                return;
            }
        }  
        
        MarDAO marDAO = new MarDAO();  
       
        
        try {
            MarBean marBean = marDAO.doRetrieveByKey(ID);
            carrello.add(new Mar(marBean));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    } 
  
  public synchronized void setQuantita(int ID, int quantita) {
      for (Mar m : carrello) {
          if (m.getMarBean().getID() == ID) {
              if (m.getQuantita() <= 0 || quantita == 0)
                  carrello.remove(m);
              else
                  m.setQuantita(quantita);
              return;
          }
      }
  }

  public synchronized void rimuovi(int ID) {
      carrello.removeIf(m -> m.getMarBean().getID() == ID);
  }
} 
   