package Controller;

import java.util.ArrayList;

import Model.ordini;
import Model.ordiniDAO;

public class Bean_ordini {

	ordiniDAO service=new ordiniDAO();
	
	ArrayList<ordini>pro=service.doFindAllOrders();
	
	
	public ArrayList<ordini>getOrdini() {
        return pro;
    }
	
}
