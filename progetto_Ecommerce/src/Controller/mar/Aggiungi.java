package Controller.mar;

import Model.CarrelloModel;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Aggiungi")
public class Aggiungi extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        CarrelloModel carrello;

        synchronized (session) {
            carrello = (CarrelloModel) session.getAttribute("carrello");
            if (carrello == null) {
                carrello = new CarrelloModel();
                session.setAttribute("carrello", carrello);
            }
        }

        int ID = Integer.parseInt(req.getParameter("ID"));
        String quantita = req.getParameter("quantita");

        if (quantita == null) {
            carrello.aggiungi(ID);
            resp.sendRedirect("carrello.jsp");
        }
        else {
            carrello.setQuantita(ID, Integer.parseInt(quantita));
        }
    }
}