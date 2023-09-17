package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.prodottoDAO;
import Model.utente;
import Model.utenteDAO;

/**
 * Servlet implementation class Verifica_mail
 */
@WebServlet("/Verifica_mail")
public class Verifica_mail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verifica_mail() {
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
	        PrintWriter out = response.getWriter();

	        // Ottieni l'email dalla richiesta POST
	        String email = request.getParameter("email");
	        utenteDAO service1=new utenteDAO();
	        ArrayList<utente>pro1=service1.doallUtenti();
	        int controllo=0;
	        	for(utente pro : pro1) {
	        		
	        if (email != null && email.equals(pro.getEmail())) {
	            // L'email è già stata utilizzata
	        	controllo=1;
	            out.println("{\"status\": \"esistente\"}");
	            break;
	            
	        } }
	        	if(controllo==0) {
	            out.println("{\"status\": \"disponibile\"}");}
	        

	        out.flush();
	        out.close();
	    }
	}


