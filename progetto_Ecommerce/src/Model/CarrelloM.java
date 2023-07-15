package Model;


import Model.mar.MarBean;
import Model.mar.MarDAO;
import Model.mar.mao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarrelloModel {
    private ArrayList<mao> carrello;

    public CarrelloModel() {
        carrello = new ArrayList<>();
    }

    public List<mao> getCarrello() {
        return carrello;
    }

    public void setCarrello(List<mao> carrello) {
        this.carrello = (ArrayList<mao>) carrello;
    }
    
    
  public synchronized void aggiungi(int ID) {
        for (mao m : carrello) {
            if (m.getMarBean().getID() == ID) {
                m.incrementaQuantita();
                return;
            }
        }  
        
        MarDAO marDAO = new MarDAO();  
       
        
        try {
            MarBean marBean = marDAO.doRetrieveByKey(ID);
            carrello.add(new mao(marBean));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    } 
  
  public synchronized void setQuantita(int ID, int quantita) {
      for (mao m : carrello) {
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
   