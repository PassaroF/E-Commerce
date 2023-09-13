<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Ottieni la sessione corrente
    HttpSession sessione = request.getSession(false);

    // Invalida la sessione se esiste
    if (sessione != null) {
        sessione.invalidate();
    }

    // Reindirizza l'utente alla pagina di login o a un'altra pagina dopo il logout
    response.sendRedirect("index.jsp"); // Cambia con la pagina di destinazione dopo il logout
%>