<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="Model.prodotto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"> 
<title>Carrello</title>
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
		<a href="pagina.jsp"><ion-icon name="cart-outline" class="cart"></ion-icon></a>
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

<section id="carrello">
	<table width="100%">
	<thead>
		<tr>
			<td>Rimuovi</td>
			<td>Immagine</td>
			<td>Prodotto</td>
			<td>Prezzo</td>
			<td>Quantita</td>
			<td>SubTotale</td>			
		</tr>
	</thead>
	 <%ArrayList<prodotto> carrello = null;
	 int n=0;
	 if (session.getAttribute("cart") == null) {
		 carrello = new ArrayList<prodotto>();%>
		 <p>Il tuo carrello è vuoto.</p><%
		    // Se esiste, ottieni il valore e assegnalo all'arraylist "carrello"
		    carrello = (ArrayList<prodotto>) session.getAttribute("cart");
		} else {
         carrello= (ArrayList<prodotto>) session.getAttribute("cart");
			n=carrello.size();
        // Verifica se il carrello esiste e se contiene prodotti
        if (carrello != null && !carrello.isEmpty()) {
    %>
	<tbody>
	<% for (prodotto pro : carrello) { %>
	<tr>
		<td><a href="#" class="rimuovi-prodotto" data-prodotto-id="<%= pro.getId()%>" onclick="rimuoviProdotto(<%= pro.getId()%>)"><i class="far fa-times-circle"></i></a></td>
	 	<td><img src="immagini/<%= pro.getImmagine() %>" alt=""></td>
	 	<td class="nome-cart"><%= pro.getDescrizione() %></td>
	 	<td><%= pro.getCosto() %></td>
	 	<td><input type="number" value="1" min="1"></td>
	 	<td>234€</td>
	 	
	</tr>
	 <% } %>
	  <%
        } else {
    %>
            <p>Il tuo carrello è vuoto.</p>
    <%
        }}
    %>
	
	</tbody>
	
	
	</table>

<section id="pagamento">

	<div id=totale>
		<h3>Totale Carrello</h3>
		<table>
			<tr>
				<td>N.Articoli</td>
				<td><%= n %></td>
			</tr>
			<tr>
				<td><strong>Totale</strong></td>
				<td><strong>1234€</strong></td>
			
			</tr>
		
		
		</table>
		
		<button class=normal>Procedi al Pagamento</button>
</div>

</section>





</section>








<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
 function rimuoviProdotto(id) {
	 console.log("Cliccato su Rimuovi con ID:", id);
	    $.ajax({
	        type: "POST",
	        url: "rimuovi.jsp",
	        data: { prodottoId: id },
	        success: function(data) {
	        	location.reload();
	            // Esegui qui eventuali azioni dopo la rimozione del prodotto
	            console.log("Prodotto rimosso con successo");
	        },
	        error: function(error) {
	            // Gestisci eventuali errori qui
	            console.error("Errore nella rimozione del prodotto:", error);
	        }
	    });
	}
 </script>
 </script>
<jsp:include page="footer.jsp" />
</body>
</html>