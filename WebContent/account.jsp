<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="Model.ordini"%>
<%@page import="Model.utente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.Bean_Account"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    <title>Homepage</title>
</head>

<style></style>
<body>
<%
    // Controlla se l'utente è loggato
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
    	
    	%>

<jsp:include page="header.jsp" />



    	
<form action="logout.jsp" method="post">
    <input type="submit" value="Logout" class="logout-button" id="logoutButton">
</form>
<section style="margin-top: 10px;margin-bottom:350px;">

    	
<%
    // Crea un'istanza del JavaBean
    Bean_Account bean = new Bean_Account();

    // Recupera i dati dal JavaBean
    ArrayList<utente> off = bean.getUtente();

    // Utilizza i dati nella pagina JSP
    String nome="";
    int id=0;
    if (off != null) {
        for (utente u : off) {
        	if(u.getEmail().equals(loggedInUser)){nome=u.getNome();
        	id=u.getId(); }
        }
        session.setAttribute("id",id);
%>
<div style="text-align: center;">
  <span style="color: #008000; background-color: #8cff8c; font-size: 35px;">${msg}</span>
</div>

<div class="top">
    <h3 id="nome">Ciao,<%= nome %></h3>
</div>
<div class="activity-data">
    <table id="table" border ="1" width="100%" align="center">
        <tr>
            <th><b>ID</b></th>
            <th><b>CLIENTE</b></th>
            <th><b>INDIRIZZO</b></th>
            <th><b>DATA</b></th>
            <th><b>TOTALE</b></th>
            <th><b>PRODOTTO</b></th>
        </tr>
        <%
        Bean_Account bean1 = new Bean_Account();

        // Recupera i dati dal JavaBean
      
        ArrayList<ordini> ord1 = bean.getOrdini();
        
        if (ord1 != null) {
        	
            for (ordini g : ord1) {
            	if(g.getId_u()==id ){
        %>
        <tr>
            <td><%= g.getId() %></td>
            <td><%= g.getDestinatario() %></td>
            <td><%= g.getIndirizzo() %></td>
            <td><%= g.getData() %></td>
            <td><%= g.getTotale() %></td>
            <td><%= g.getProdotti() %></td>
        </tr>
        <%
            }
        }}
        %>
    </table>
</div>
<%
        
    }
%>

</section>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>

<script>
  
</script>
<jsp:include page="footer.jsp" />

<%
    } else {
        response.sendRedirect("login.jsp"); // Cambia con la tua pagina di login
    }
%>

</body>
</html>