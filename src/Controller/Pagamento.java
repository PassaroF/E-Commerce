package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ordini;
import Model.ordiniDAO;
import Model.prodotto;

/**
 * 
 */
@WebServlet("/Pagamento")
public class Pagamento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pagamento() {
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
		HttpSession session = request.getSession();
		ArrayList<prodotto> carrello = null;
		String nome="";
	    String cognome="";
	    String indirizzo="";
	    int id=0;
	    
	    String destinatario="";
	   
	    String telefono="";
		carrello= (ArrayList<prodotto>) session.getAttribute("cart");
		if(carrello==null) {
			
			request.setAttribute("mess","ERRORE!! Il carrello è vuoto");
			RequestDispatcher rd=request.getRequestDispatcher("carrello.jsp");
			 rd.forward(request, response);
			
		}
		session.setAttribute("cart", null);
		nome=(String) session.getAttribute("nome");
		cognome=(String) session.getAttribute("cognome");
		destinatario=nome+" "+cognome;
		indirizzo=(String) session.getAttribute("indirizzo");
		id=(Integer) session.getAttribute("id");
		 Date dataCorrente = new Date();
	        
	        // Crea un formato per la data nel formato "gg/mm/yyyy"
	        SimpleDateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy");
	        
	        // Formatta la data corrente
	        String dataFormattata = formatoData.format(dataCorrente);
		 try {
			 Connection con = null;
				String ip = "localhost";
				String port = "3306";
				String db = "database_bs";
				String username = "root";

				String password = "Marano1996";

			 Class.forName("com.mysql.cj.jdbc.Driver");
			 con= DriverManager.getConnection("jdbc:mysql://"+ ip+":"+ port+"/"+db+"?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", username, password);
			 	String prodotti="";
			 	String tot="";
			 	ordiniDAO service=new ordiniDAO();
				tot=(String)session.getAttribute("tot");
				ArrayList<ordini>ord1=service.doId(id);
				
					if(ord1!=null) {
						request.setAttribute("dati",ord1);
						request.setAttribute("nome",nome);
						request.setAttribute("indirizzo",indirizzo);
			}
			 for(prodotto pro : carrello) {
				 prodotti+=pro.getNome()+" ,";
				 			 }
			 PreparedStatement ps=con.prepareStatement("insert into ordini (destinatario,indirizzo,totale,prodotti,data,ID_u)values(?,?,?,?,?,?)");
			 ps.setString(1, destinatario);
			 ps.setString(2, indirizzo);
			 ps.setString(3, tot);
			 ps.setString(4, prodotti);
			 ps.setString(5, dataFormattata);
			 ps.setInt(6, id);
			 
			 
			 int i=ps.executeUpdate();
			 if(i>0) {
			
			 
				 request.setAttribute("msg","Ordine Effetuato!");
			 RequestDispatcher rd=request.getRequestDispatcher("account.jsp");
			 
			 rd.forward(request, response);
			 }else {request.setAttribute("mess","Errore in fase di pagamento!RIPROVARE");
					
					
					
					
					RequestDispatcher rd=request.getRequestDispatcher("carrello.jsp");
					 rd.forward(request, response);
					
				}
			 
		 }catch(Exception e) {
			 
		 }
		 out.close();
		 
		 
		 
		 
		 
		 
	}
}

