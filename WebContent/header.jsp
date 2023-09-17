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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<title>homepage</title>
</head>
<body>
<header>
	<a href="#"><img src="immagini/logo3.png" class="logo" alt=""></a>
	<div class="group">
	<ul class="navigation">
		<li><a href="index.jsp">Home</a></li>
		<li><a href="#off">Offerte</a></li>
		<li><a href="#cons">Console</a></li>
		<li><a href="#prod">Pc</a></li>


	
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
	<input type="text" placeholder="Ricerca Prodotti" value="" id="searchInput">
	<div class="searchResults" id="searchResults">
	
	</div>
	
	</div>
</header>
<form id="productForm" action="prodotto1.jsp" method="post">
    <input type="hidden" id="productId" name="id" value="">
    <input type="hidden" id="immagine" name="immagine" value="">
    <input type="hidden" id="nome" name="nome" value="">
    <input type="hidden" id="costo" name="costo" value="">
    <input type="hidden" id="descrizione" name="descrizione" value="">
    <input type="hidden" id="marca" name="marca" value="">
    
</form>
<script>
 let btncerca=document.querySelector('.btncerca');
 let btnchiudi=document.querySelector('.btnchiudi');
 let searchBox=document.querySelector('.searchBox');
 let navigation=document.querySelector('.navigation');
 let searchInput = document.getElementById('searchInput');
 let menu=document.querySelector('.menu');
 let searchResults = document.getElementById('searchResults');
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
	 searchResults.style.display = 'none';
 }

 menu.onclick=function(){
 	 header.classList.toggle('open');
 	searchBox.classList.remove('active');
	 btnchiudi.classList.remove('active');
	 btncerca.classList.remove('active');
  }
 function aggiungi(id) {
	 var header = document.querySelector('header');

	    // Scorrimento verso l'header
	    header.scrollIntoView({ behavior: 'smooth' });
	
	 document.getElementById('myAlert').style.display = 'block';
     // Nascondi il messaggio di avviso dopo 3 secondi
     setTimeout(function () {
         document.getElementById('myAlert').style.display = 'none';
     }, 2000);
     setTimeout(function () {
    	 document.getElementById('aggiungiAlCarrello_' + id).submit();
     }, 1000);
     
 }
 
 searchInput.addEventListener('input', function() {
	    var query = $("#searchInput").val();

	    // Esegui la richiesta AJAX utilizzando jQuery
	    $.ajax({
	        url: 'Ricerca', // Sostituisci con l'URL del tuo server
	        method: 'POST', // Puoi usare GET o POST a seconda delle tue esigenze
	        data: { query: query }, // Invia la query di ricerca al server
	        dataType: 'json', // Indica che si aspetta una risposta JSON
	        success: function(data) {
	            // Pulisci il div dei risultati prima di aggiungere nuovi risultati
	            searchResults.innerHTML = '';
	            if (data != null && data.length > 0) {
	                searchResults.style.display = 'block'; // Mostra il div dei risultati
	                data.forEach(function(result) {
	                    // Crea un elemento <div> per ogni risultato
	                    var resultItem = document.createElement('div');
	                    resultItem.classList.add('search-result');

	                    // Crea un elemento <a> per visualizzare il risultato
	                    var resultLink = document.createElement('a');
	                    resultLink.textContent = result.nome;

	                    // Imposta gli attributi data del risultato
	                    resultLink.setAttribute('id', result.id);
	                    resultLink.setAttribute('nome', result.nome);
	                    resultLink.setAttribute('costo', result.costo);
	                    
	                    resultLink.setAttribute('descrizione', result.descrizione);
	                    resultLink.setAttribute('immagine', result.immagine);
	                    resultLink.setAttribute('marca', result.marca);

	                    resultLink.addEventListener('click', function(e) {
	                        e.preventDefault();
	                        
	                        // Recupera i dati dal risultato cliccato
	                        var productId = this.getAttribute('id');
	                        var nome = this.getAttribute('nome');
	                        var costo = this.getAttribute('costo');
	                       
	                        var descrizione = this.getAttribute('descrizione');
	                        var immagine = this.getAttribute('immagine');
	                        var marca = this.getAttribute('marca');

	                        // Imposta i valori nei campi del form
	                        document.getElementById('productId').value = productId;
	                        document.getElementById('immagine').value = immagine;
	                        document.getElementById('nome').value = nome;
	                        document.getElementById('costo').value = costo;
	                        document.getElementById('descrizione').value = descrizione;
	                        document.getElementById('marca').value = marca;
	                        // Imposta altri valori per gli altri campi nascosti se necessario

	                        // Invia il form
	                        document.getElementById('productForm').submit();
	                    });

	                    // Aggiungi il risultato al div dei risultati
	                    resultItem.appendChild(resultLink);
	                    searchResults.appendChild(resultItem);
	                });
	            } else {
	                searchResults.style.display = 'none'; // Nascondi il div dei risultati se non ci sono risultati
	            }
	        },
	        error: function(error) {
	            console.error('Errore durante la richiesta AJAX:', error);
	        }
	    });
	});


 </script>
 </body>
 </html>