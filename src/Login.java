

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet(name="loginServlet",value="/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
        
		if(Pattern.matches("^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+(?:.[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+)*@byteshop.it",email))
		{
			RequestDispatcher rd=request.getRequestDispatcher("footer.html");
			 rd.forward(request, response);
			
		}
		else if(Controllo_Login.controllo(email, pass)) {
			
			RequestDispatcher rd=request.getRequestDispatcher("index.html");
			 rd.forward(request, response);
			

		}else {
			
			request.setAttribute("mess","Email o Password errata!");
			
			
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			 rd.forward(request, response);
			
		}
		

		
	}

}
