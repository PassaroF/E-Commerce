package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ordini;
import Model.ordiniDAO;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
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
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		String cli=request.getParameter("cliente");
		String nome=request.getParameter("nome");
		
		ordiniDAO service=new ordiniDAO();
		
		ArrayList<ordini>ord1=service.doCliente(cli);
		ArrayList<ordini>ord=service.doFindAllOrders();
		
			if(ord1!=null) {
				request.setAttribute("dati",ord1);
				request.setAttribute("nome",nome);
			request.setAttribute("ordini",ord);		
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			request.setAttribute("mess","");
			 rd.forward(request, response);
	}else {
		request.setAttribute("nome",nome);
				request.setAttribute("ordini",ord);	
				request.setAttribute("mess","cliente non trovato!");
				
			
				RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
				 rd.forward(request, response);
			}
		
	}

}
