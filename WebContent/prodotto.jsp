<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String marca = request.getParameter("marca");
String nome = request.getParameter("nome");
String costo = request.getParameter("costo");
String sconto = request.getParameter("sconto");
String id = request.getParameter("id");
String descrizione = request.getParameter("descrizione");
String immagine = request.getParameter("immagine");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"> 
    
<title>Dettagli</title>
</head>
<body>
<header>
	<a href="#"><img src="immagini/logo3.png" class="logo" alt=""></a>
	<div class="group">
	<ul class="navigation">
		<li><a href="#">Home</a></li>
		<li><a href="#">Offerte</a></li>
		<li><a href="#">Console</a></li>
		<li><a href="#">Pc</a></li>

	
	<div class="user">
		<span class="icon1">
		<ion-icon name="person-outline" class="account"></ion-icon>
		<ion-icon name="cart-outline" class="cart"></ion-icon>
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


	<section id="dett">
		
	<div class="dett-img">
		<img src="immagini/<%=immagine%>" width="100%"  alt="">
	</div>
	<div class="dettaglio">
	
		<h5><%= marca %></h5>
		<h2><%= nome %></h2>
		<h4><%= costo %>€</h4>
	<% 
	if (Float.parseFloat(sconto)!=0) { %>
    <h4><del style="color: red;"><%= sconto %>€</del></h4>
<% } %>
		<input type="number" value="1" min="1">
		<button class="normal">Aggiungi al carrello</button>
		<h4>Dettagli Prodotto</h4>
		<span><%= descrizione%></span>
	</div>
	
</section>



<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
 <script>
 let btncerca=document.querySelector('.btncerca');
 let btnchiudi=document.querySelector('.btnchiudi');
 let searchBox=document.querySelector('.searchBox');
 let navigation=document.querySelector('.navigation');
 let menu=document.querySelector('.menu');
 let header=document.querySelector('header');
 let account=document.querySelector('.account');
 let cart=document.querySelector('.cart');
 btncerca.onclick=function(){
	 searchBox.classList.add('active');
	 btnchiudi.classList.add('active');
	 btncerca.classList.add('active');
	 account.classList.add('active');
	 cart.classList.add('active');
	 menu.classList.add('hide');
	 header.classList.remove('open');
	 
	 
 }
 
 btnchiudi.onclick=function(){
	 searchBox.classList.remove('active');
	 btnchiudi.classList.remove('active');
	 btncerca.classList.remove('active');
	 account.classList.remove('active');
	 cart.classList.remove('active');
	 menu.classList.remove('hide');
 }

 menu.onclick=function(){
 	 header.classList.toggle('open');
 	searchBox.classList.remove('active');
	 btnchiudi.classList.remove('active');
	 btncerca.classList.remove('active');
  }
 </script>
<jsp:include page="footer.jsp" />
</body>
</html>