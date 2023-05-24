

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
 * Servlet implementation class Registrazione
 */
@WebServlet("/Registrazione")
public class Registrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registrazione() {
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
		 
		 String nome=request.getParameter("Nome");
		 String cognome=request.getParameter("Cognome");
		 String email=request.getParameter("Email");
		 String re_email=request.getParameter("Re_email");
		 String pass=request.getParameter("Password");
		 String nazione=request.getParameter("Nazione");
		 String citta=request.getParameter("Citta");
		 String cap=request.getParameter("Cap");
		 String provincia=request.getParameter("Provincia");
		 String via=request.getParameter("Via");
		 String civico=request.getParameter("Civico");
		 String telefono=request.getParameter("Telefono");
		 String giorno=request.getParameter("Giorno");
		 String mese=request.getParameter("Mese");
		 String anno=request.getParameter("Anno");
		 
		 String compleanno=giorno+"/"+mese+"/"+anno; 
		 
		 try {
			 Connection con = null;
				String ip = "localhost";
				String port = "3306";
				String db = "database_bs";
				String username = "root";
				String password = "Fabio1959";
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 con= DriverManager.getConnection("jdbc:mysql://"+ ip+":"+ port+"/"+db+"?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", username, password);

			 PreparedStatement ps=con.prepareStatement("insert into utenti (nome,cognome,via,civico,nazione,provincia,cap,citta,email,telefono,data_di_nascita,pass)values(?,?,?,?,?,?,?,?,?,?,?,sha1(?))");
			 ps.setString(1, nome);
			 ps.setString(2, cognome);
			 ps.setString(3, via);
			 ps.setString(4, civico);
			 ps.setString(5, nazione);
			 ps.setString(6, provincia);
			 ps.setString(7, cap);
			 ps.setString(8, citta);
			 ps.setString(9, email);
			 ps.setString(10, telefono);
			 ps.setString(11, compleanno);
			 ps.setString(12, pass);
			 
			 
			 int i=ps.executeUpdate();
			 if(i>0) {
			 out.print("successo");
			 RequestDispatcher rd=request.getRequestDispatcher("login.html");
			 rd.include(request, response);
			 }
			 
		 }catch(Exception e) {
			 
		 }
		 out.close();
		 
		 
		 
		 
		 
		 
	}

}
