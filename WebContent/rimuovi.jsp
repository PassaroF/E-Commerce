<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="Model.prodotto" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int prodottoId = Integer.parseInt(request.getParameter("prodottoId"));
ArrayList<prodotto> carrello = (ArrayList<prodotto>) session.getAttribute("cart");
if (carrello != null && !carrello.isEmpty()) {
    // Rimuovi il prodotto dal carrello in base all'ID
    Iterator<prodotto> iterator = carrello.iterator();
    while (iterator.hasNext()) {
        prodotto pro = iterator.next();
        if (pro.getId() == prodottoId) {
            iterator.remove();
            break;
        }
    }
    session.setAttribute("cart", carrello);
    response.setStatus(200); // OK
    
} else {
    response.setStatus(500); // Errore interno del server
}
%>
</body>
</html>