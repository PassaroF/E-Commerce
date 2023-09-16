package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.prodottoDAO;

/**
 * Servlet implementation class Elimina
 */
@WebServlet("/Elimina")
public class Elimina extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Elimina() {
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
		
		int ID=Integer.parseInt(request.getParameter("id_prodotto"));
		int a=-1;
		prodottoDAO service=new prodottoDAO();
		a=service.delete(ID);
		
				
				
		if( a==1) {
			request.setAttribute("mess_pro","Prodotto eliminato con Successo");
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			 rd.forward(request, response);
		}else {
			
			request.setAttribute("mess_pro","Errore riprovare");
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			 rd.forward(request, response);
			
		}
		
		
		
		
	}

}
