package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ordini;
import Model.ordiniDAO;

/**
 * Servlet implementation class Data
 */
@WebServlet("/Data")
public class Data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Data() {
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
	 * @param  
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
ordiniDAO service=new ordiniDAO();
String nome=request.getParameter("nome");
		ArrayList<ordini>ord=service.doFindAllOrders();
		ArrayList<ordini>ord2=ord;
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		String data=request.getParameter("data");
		String data1=request.getParameter("data1");
		int flag=0;
		if(data.equals("")) {
			flag=1;
			
		}
		if(data1.equals("")) {
			
			flag=1;
		}
		
		if(flag==1) {
			request.setAttribute("nome",nome);
			request.setAttribute("ordini",ord2);	
			request.setAttribute("mess","Nessun ordine in questo intervallo!");
		
			
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			 rd.forward(request, response);
			
		}
		
		try {
			ArrayList<ordini> ordini=new ArrayList<>();
		
			Date data3= dateFormat.parse(data);
			Date data4 = dateFormat.parse(data1);
			
			 for(ordini o:ord){
				 String dt=o.getData();
				 System.out.println(dt);
			 Date data2 = dateFormat.parse(dt);
			 if((data2.equals(data3) || data2.after(data3))&&(data2.equals(data4)||data2.before(data4))) {
				 ordini g=new ordini(o.getId(),o.getDestinatario(),o.getIndirizzo(),o.getTotale(),o.getProdotti(),dt,o.getId_u());
				 ordini.add(g); 
			 }
			 
			 }
				if(ord2!=null) {
					ArrayList<ordini> ordini1=new ArrayList<>();
					ordini1=ordini;
					request.setAttribute("dati",ordini1);
					request.setAttribute("nome",nome);
				request.setAttribute("ordini",ord2);		
				RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
				request.setAttribute("mess","");
				 rd.forward(request, response);
		}else {
					request.setAttribute("ordini",ord2);	
					request.setAttribute("mess","Nessun ordine in questo intervallo!");
					request.setAttribute("nome",nome);
				
					RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
					 rd.forward(request, response);
				}	
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
		
	}
		
	}


