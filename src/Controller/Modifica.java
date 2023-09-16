package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.prodottoDAO;

/**
 * Servlet implementation class Modifica
 */
@WebServlet("/Modifica")
public class Modifica extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modifica() {
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
		int id =Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String costo = request.getParameter("costo");
        String descrizione = request.getParameter("descrizione");
        String unita = request.getParameter("unita");
        String categoria = request.getParameter("categoria");
        String immagine = request.getParameter("immagine");
        String marca = request.getParameter("marca");
        
        if(nome!=null && costo!=null && descrizione!=null && unita !=null&&categoria !=null && immagine!= null && marca!=null) {
        	int a=-1;
    		prodottoDAO service=new prodottoDAO();
    		a=service.modifica(id,nome,costo,descrizione,unita,categoria,immagine,marca);
    		
    		if(a==1) {		
        	
        	request.setAttribute("mess_pro1","Campo modificato con successo");
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			 rd.forward(request, response);}
    		else {		
            	
            	request.setAttribute("mess_pro1","Errore in qualche campo");
    			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
    			 rd.forward(request, response);}
        }else {
        	
        	request.setAttribute("mess_pro1","Controllare i campi,non possono essere vuoti");
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			 rd.forward(request, response);	
        	
        	
        }
        
        
        
	}

}
