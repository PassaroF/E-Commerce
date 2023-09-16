
package Controller;

import java.util.ArrayList;

import Model.ordini;
import Model.ordiniDAO;
import Model.prodotto;
import Model.prodottoDAO;



public class Bean_Prodotti {

	prodottoDAO service=new prodottoDAO();
	
	
	
	ArrayList<prodotto>pro=service.doFindAll();
	
	public ArrayList<prodotto>getProdotti(){
        return pro;
    }
	
	
}
