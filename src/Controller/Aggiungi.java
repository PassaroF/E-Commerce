package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Aggiungi
 */
@WebServlet("/Aggiungi")
public class Aggiungi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Aggiungi() {
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
		 PrintWriter out= response.getWriter();
		 
		 String nome=request.getParameter("nome");
		 String costo=request.getParameter("costo");
		 String descrizione=request.getParameter("descrizione");
		 String unita=request.getParameter("unita");
		 String categoria=request.getParameter("categoria");
		 String immagine=request.getParameter("immagine");
		 String marca=request.getParameter("marca");
		 
		 if(nome!=null && costo!=null && descrizione!=null && unita !=null&&categoria !=null && immagine!= null && marca!=null) {
			 try {
				 Connection con = null;
					String ip = "localhost";
					String port = "3306";
					String db = "database_bs";
					String username = "root";

					String password = "Marano1996";

				 Class.forName("com.mysql.cj.jdbc.Driver");
				 con= DriverManager.getConnection("jdbc:mysql://"+ ip+":"+ port+"/"+db+"?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", username, password);

				 PreparedStatement ps=con.prepareStatement("insert into prodotti (nome,costo,descrizione,unita,categoria,immagine,marca)values(?,?,?,?,?,?,?)");
				 ps.setString(1, nome);
				 ps.setString(2, costo);
				 ps.setString(3, descrizione);
				 ps.setString(4, unita);
				 ps.setString(5, categoria);
				 ps.setString(6, immagine);
				 ps.setString(7, marca);
				 
				 
				 
				 int i=ps.executeUpdate();
				 if(i>0) {
					 request.setAttribute("mess_pro3","Prodotto aggiunto con successo");
				 RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
				 rd.include(request, response);
				 }else {
					 
					 request.setAttribute("mess_pro3","Errore!!Controllare i campi");
					 RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
					 rd.include(request, response);
				 } 
			 
			 
			 	 
			  
			 
		 
			 
			 } catch(Exception e) {}
			 out.close();
		 }else {
				 request.setAttribute("mess_pro3","Controllare i campi,non possono essere vuoti");
					RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
					 rd.forward(request, response);
		 
		 
		 
		 }
}}

