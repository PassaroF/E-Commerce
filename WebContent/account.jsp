<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="Model.ordini"%>
<%@page import="Model.utente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.Bean_Account"%>
<!DOCTYPE html>
<html>
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


<header>
    <a href="#"><img src="immagini/logo3.png" class="logo" alt=""></a>
    <div class="group">
        <ul class="navigation">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="index.jsp#off">Offerte</a></li>
            <li><a href="index.jsp#cons">Console</a></li>
            <li><a href="index.jsp#prod">Pc</a></li>
            <div class="user">
                <span class="icon1">
                <a href="account.jsp" class="account">
                    <ion-icon name="person-outline"></ion-icon>
                </a>
                <a href="carrello.jsp"><ion-icon name="cart-outline" class="cart"></ion-icon></a>
                </span>
            </div>
        </ul>
        <div class="search">
            <span class="icon">
                <ion-icon name="search-outline" class="btncerca"></ion-icon>
                <ion-icon name="close-outline" class="btnchiudi"></ion-icon>
            </span>
        </div>
        <ion-icon name="menu-outline" class="menu"></ion-icon>
    </div>
    <div class="searchBox">
        <input type="text" placeholder="Ricerca Prodotti">
    </div>
    
</header>


    	
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
  <span style="color: #008000;; background-color: #8cff8c; padding: 30px; font-size: 35px;">${msg}</span>
</div>
<span "style=color:green;">${msg}</span>
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
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script>
    let btncerca = document.querySelector('.btncerca');
    let btnchiudi = document.querySelector('.btnchiudi');
    let searchBox = document.querySelector('.searchBox');
    let navigation = document.querySelector('.navigation');
    let menu = document.querySelector('.menu');
    let header = document.querySelector('header');
    let account = document.querySelector('.account');
    let cart = document.querySelector('.cart');
    btncerca.onclick = function () {
        searchBox.classList.add('active');
        btnchiudi.classList.add('active');
        btncerca.classList.add('active');
        account.classList.add('active');
        cart.classList.add('active');
        menu.classList.add('hide');
        header.classList.remove('open');
    }

    btnchiudi.onclick = function () {
        searchBox.classList.remove('active');
        btnchiudi.classList.remove('active');
        btncerca.classList.remove('active');
        account.classList.remove('active');
        cart.classList.remove('active');
        menu.classList.remove('hide');
    }

    menu.onclick = function () {
        header.classList.toggle('open');
        searchBox.classList.remove('active');
        btnchiudi.classList.remove('active');
        btncerca.classList.remove('active');
    }
    
    
    
</script>
<jsp:include page="footer.jsp" />

<%
    } else {
        response.sendRedirect("login.jsp"); // Cambia con la tua pagina di login
    }
%>

</body>
</html>