<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String marca = request.getParameter("marca");
String nome = request.getParameter("nome");
String costo = request.getParameter("costo");

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

<jsp:include page="header.jsp" />
 <div class="alert" id="myAlert">
	<span><i class="fas fa-check-square"></i></span>
	<span class="msg-alert">Prodotto aggiunto al carrello</span>
</div>

	<section id="dett">
		
	<div class="dett-img">
		<img src="immagini/<%=immagine%>" width="100%"  alt="">
	</div>
	<div class="dettaglio">
	
		<h5><%= marca %></h5>
		<h2><%= nome %></h2>
		<h4><%= costo %>€</h4>
	 
	
		<input type="number" value="1" min="1" id="quantityInput">
					<form id="aggiungiAlCarrello_<%= id %>" action="aggiungi.jsp" method="post">
				<input type="hidden" name="marca" value="<%= marca %>">
    <input type="hidden" name="nome" value="<%= nome %>">
    <input type="hidden" name="costo" value="<%= costo %>">
    <input type="hidden" name="immagine" value="<%= immagine %>">
    <input type="hidden" name="id" value="<%= Integer.parseInt(id) %>">
    <input type="hidden" name="descrizione" value="<%= descrizione %>">
     <input type="hidden" name="unit" value=1 id="unit">
	
<button class="normal" onclick="aggiungi()">Aggiungi al carrello</button>
</form>
		<h4>Dettagli Prodotto</h4>
		<span><%= descrizione%></span>
	</div>
	
</section>



<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>

 <script>
 
 function aggiungi() {
	 var header = document.querySelector('header');

	    // Scorrimento verso l'header
	    header.scrollIntoView({ behavior: 'smooth' });
	
	 document.getElementById('myAlert').style.display = 'block';
     // Nascondi il messaggio di avviso dopo 3 secondi
     setTimeout(function () {
         document.getElementById('myAlert').style.display = 'none';
     }, 2000);
  // Disabilita il pulsante per evitare clic multipli durante l'attesa
     document.querySelector('button').disabled = true;

     // Attendi 4 secondi (4000 millisecondi)
     setTimeout(function () {
         // Riemetti il pulsante in uno stato abilitato
         document.querySelector('button').disabled = false;

         document.getElementById('aggiungiAlCarrello_<%= Integer.parseInt(id) %>').submit();
     }, 1000);
     
 }


 document.addEventListener("DOMContentLoaded", function () {
   // Seleziona l'elemento input numerico e l'input nascosto
   var quantityInput = document.getElementById("quantityInput");
   var unitInput = document.getElementById("unit");

   // Aggiungi un ascoltatore all'evento "input" per catturare i cambiamenti
   quantityInput.addEventListener("input", function () {
     // Ottieni il valore inserito dall'utente nell'input numerico
     var quantityValue = quantityInput.value;

     // Assegna il valore all'input nascosto "unit"
     unitInput.value = quantityValue;
   });
 });
 </script>
<jsp:include page="footer.jsp" />
</body>
</html>l>