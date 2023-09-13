package Controller;

import java.util.ArrayList;

import Model.ordiniDAO;
import Model.utenteDAO;
import Model.ordini;
import Model.utente;


public class Bean_Account {

	ordiniDAO service=new ordiniDAO();
	utenteDAO service1=new utenteDAO();
	
	
	ArrayList<ordini>pro=service.doFindAllOrders();
	ArrayList<utente>pro1=service1.doallUtenti();
	
	
	public ArrayList<ordini>getOrdini() {
        return pro;
    }
	public ArrayList<utente>getUtente() {
        return pro1;
    }
	
}
