package Controller;

import java.util.ArrayList;

import Model.prodotto;
import Model.prodottoDAO;

public class BeanIndex {

	prodottoDAO service=new prodottoDAO();
	
	ArrayList<prodotto>pro=service.doFindAllPc();
	ArrayList<prodotto>pro1=service.doFindX();
	ArrayList<prodotto>pro2=service.doFindOff();
	
	public ArrayList<prodotto>getPc() {
        return pro;
    }
	public ArrayList<prodotto>getX() {
        return pro1;
    }
	public ArrayList<prodotto>getOff() {
        return pro2;
    }
}
