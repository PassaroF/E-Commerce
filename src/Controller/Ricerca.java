package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.prodotto;
import Model.prodottoDAO;
import Model.utente;

/**
 * Servlet implementation class Ricerca
 */
@WebServlet("/Ricerca")
public class Ricerca extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ricerca() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		ArrayList<prodotto> ris=new ArrayList<>();
        // Ottieni l'email dalla richiesta POST
        String query = request.getParameter("query");
        if(query==null || query.equals("")) {
        	prodotto p=new prodotto("nessun prodotto trovato");
        	ris.add(p);
        	Gson gson = new Gson();
            String json = gson.toJson(ris);
            PrintWriter out = response.getWriter();
            out.println(json);
            
            out.flush();
            out.close();
        }
        prodottoDAO service1 = new prodottoDAO();
        ArrayList<prodotto> pro1 = service1.doFindAll();
        
        
        if(pro1!=null && query!=null) {
        for(prodotto pro : pro1) {
        	
        	if(pro.getNome().toLowerCase().contains(query.toLowerCase())) {
        		
        		prodotto p=new prodotto(pro.getId(),pro.getNome(),pro.getCosto(),pro.getDescrizione(),pro.getUnita(),"0.0",pro.getCategoria(),pro.getMarca(),pro.getImmagine());
            	ris.add(p);
        	}
        	
        }}else {prodotto p=new prodotto("nessun prodotto trovato");
    	ris.add(p);
    	Gson gson = new Gson();
        String json = gson.toJson(ris);}
        	
        Gson gson = new Gson();
        String json = gson.toJson(ris);
        
        // Scrivi il JSON nell'OutputStream della risposta
        PrintWriter out = response.getWriter();
        out.println(json);
        
        out.flush();
        out.close();
        


	}

}
