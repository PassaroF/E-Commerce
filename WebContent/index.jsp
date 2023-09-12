<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Controller.BeanIndex"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="Model.prodotto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"> 
    
<title>homepage</title>
</head>
<body>



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
		<ion-icon name="person-outline" class="account"></ion-icon>
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
<section id="off">
	<h2>Le nostre Offerte</h2>
<div class="off-container">
    <%
        // Crea un'istanza del JavaBean
        BeanIndex bean2 = new BeanIndex();

        // Recupera i dati dal JavaBean
        ArrayList<prodotto> off = bean2.getOff();

        // Utilizza i dati nella pagina JSP
        if (off != null) {
            for (prodotto o : off) {
    %>	
		<div class="offerta">
		<form action="prodotto.jsp" method="post">
    <input type="hidden" name="marca" value="<%= o.getMarca() %>">
    <input type="hidden" name="nome" value="<%= o.getNome() %>">
    <input type="hidden" name="costo" value="<%= o.getCosto() %>">
    <input type="hidden" name="sconto" value="<%= o.getSconto() %>">
    <input type="hidden" name="immagine" value="<%= o.getImmagine() %>">
    <input type="hidden" name="id" value="<%= o.getId() %>">
    <input type="hidden" name="descrizione" value="<%= o.getDescrizione() %>">
    <button type="submit" class="invisibile">
        <img src="immagini/<%= o.getImmagine() %>" alt="">
    </button>
</form>
	
    

		

				<div class="descr2">
					<span><%= o.getMarca() %></span>
					<h5><%= o.getNome() %></h5>
					<h4><%= o.getCosto() %>€</h4>
					<h4><del style="color: red;"><%= o.getSconto() %>€</del></h4>
				</div>
				<ion-icon name="cart-outline" class="carrello2"></ion-icon>
				
		</div>
		
    <%
            }
        } else {
    %>
            <li>
                <font color="red">
                    <h3 id="not">Errore, ricaricare la pagina</h3>
                </font>
            </li>
    <%
        }
    %>

	
		
		
		</div>
</section>


	<section id="prod">
	<h2>I nostri prodotti PC</h2>
<div class="pro-container">
    <%
        // Crea un'istanza del JavaBean
        BeanIndex bean = new BeanIndex();

        // Recupera i dati dal JavaBean
        ArrayList<prodotto> pro = bean.getPc();

        // Utilizza i dati nella pagina JSP
        if (pro != null) {
            for (prodotto p : pro) {
    %>	
		<div class="prodotto">
		<form action="prodotto.jsp" method="post">
    <input type="hidden" name="marca" value="<%= p.getMarca() %>">
    <input type="hidden" name="nome" value="<%= p.getNome() %>">
    <input type="hidden" name="costo" value="<%= p.getCosto() %>">
    <input type="hidden" name="sconto" value="0">
    <input type="hidden" name="immagine" value="<%= p.getImmagine() %>">
    <input type="hidden" name="id" value="<%= p.getId() %>">
    <input type="hidden" name="descrizione" value="<%= p.getDescrizione() %>">
    <button type="submit" class="invisibile">
        <img src="immagini/<%= p.getImmagine() %>" alt="">
    </button>
</form>
				<div class="descr">
					<span><%= p.getMarca() %></span>
					<h5><%= p.getNome() %></h5>
					<h4><%= p.getCosto() %>€</h4>
					
				</div>
				
				<form id="aggiungiAlCarrello_<%= p.getId() %>" action="aggiungi.jsp" method="post">
				<input type="hidden" name="marca" value="<%= p.getMarca() %>">
    <input type="hidden" name="nome" value="<%= p.getNome() %>">
    <input type="hidden" name="costo" value="<%= p.getCosto() %>">
    <input type="hidden" name="immagine" value="<%= p.getImmagine() %>">
    <input type="hidden" name="id" value="<%= p.getId() %>">
    <input type="hidden" name="descrizione" value="<%= p.getDescrizione() %>">
     <input type="hidden" name="unit" value=1>
	<ion-icon name="cart-outline" class="carrello" onclick="aggiungi('<%= p.getId() %>')"></ion-icon>

</form>
				
		</div>
		
    <%
            }
        } else {
    %>
            <li>
                <font color="red">
                    <h3 id="not">Errore, ricaricare la pagina</h3>
                </font>
            </li>
    <%
        }
    %>

	
		
		
		</div>
</section>


	<section id="cons">
	<h2>Le Nostre Console</h2>
	<h3>XBOX</h3>
		<div class="con-container">
		<%
        // Crea un'istanza del JavaBean
        BeanIndex bean1 = new BeanIndex();

        // Recupera i dati dal JavaBean
        ArrayList<prodotto> cons = bean.getX();

        // Utilizza i dati nella pagina JSP
        if (cons != null) {
            for (prodotto c : cons) {
    %>	
		<div class="console">
		 <form action="prodotto.jsp" method="post">
    <input type="hidden" name="marca" value="<%= c.getMarca() %>">
    <input type="hidden" name="nome" value="<%= c.getNome() %>">
    <input type="hidden" name="costo" value="<%= c.getCosto() %>">
    <input type="hidden" name="sconto" value="0">
    <input type="hidden" name="immagine" value="<%= c.getImmagine() %>">
    <input type="hidden" name="id" value="<%= c.getId() %>">
    <input type="hidden" name="descrizione" value="<%= c.getDescrizione() %>">
    <button type="submit" class="invisibile">
        <img src="immagini/<%= c.getImmagine() %>" alt="">
    </button>
</form>
		

				<div class="descr1">
					<span><%= c.getMarca() %></span>
					<h5><%= c.getNome() %></h5>
					<h4><%= c.getCosto() %>€</h4>
				</div>
				
				<ion-icon name="cart-outline" class="carrello1"></ion-icon>
				
		</div>
		
    <%
            }
        } else {
    %>
            <li>
                <font color="red">
                    <h3 id="not">Errore, ricaricare la pagina</h3>
                </font>
            </li>
    <%
        }
    %>
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
 function aggiungi(id) {
	 document.getElementById('aggiungiAlCarrello_'+id).submit();
     alert("Prodotto aggiunto al carrello con successo!");
 }
 </script>
<jsp:include page="footer.jsp" />
</body>
</html>