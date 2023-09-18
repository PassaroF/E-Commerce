<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<%@page import="Model.prodotto" %>
<%@page import="Model.utente"%>
<%@page import="Controller.Bean_Account"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"> 
<title>Carrello</title>
</head>
<%
    // Controlla se l'utente è loggato
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
    	 Bean_Account bean = new Bean_Account();

         // Recupera i dati dal JavaBean
         ArrayList<utente> off = bean.getUtente();

         // Utilizza i dati nella pagina JSP
         String nome = "";
         String cognome = "";
         String via = "";
         String civico = "";
         String nazione = "";
         String provincia = "";
         String cap = "";
         String citta = "";
         String indirizzo = "";
         String telefono = "";
         int id = 0;
         if (off != null) {
             for (utente u : off) {
                 if (u.getEmail().equals(loggedInUser)) {
                     nome = u.getNome();
                     id = u.getId();
                     cognome = u.getCognome();
                     via = u.getVia();
                     civico = u.getCivico();
                     nazione = u.getNazione();
                     provincia = u.getProvincia();
                     cap = u.getCap();
                     citta = u.getCitta();
                     telefono = u.getTelefono();
                 }
             }
             indirizzo = via + " " + civico + " " + nazione + " " + provincia + " " + citta + " " + cap;
             session.setAttribute("id", id);
             session.setAttribute("nome", nome);
             session.setAttribute("cognome", cognome);
             session.setAttribute("indirizzo", indirizzo);
             session.setAttribute("telefono", telefono);
         
         }
         %>	
    	
<body>

<jsp:include page="header.jsp" />

<section id="carrello">

	<table width="100%">
	<caption></caption>
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
	 double total = 0.0;
		int n = 0;
	 if (session.getAttribute("cart") == null) {
		 carrello = new ArrayList<prodotto>();%>
		 <p>Il tuo carrello è vuoto.</p><%
		    // Se esiste, ottieni il valore e assegnalo all'arraylist "carrello"
		    carrello = (ArrayList<prodotto>) session.getAttribute("cart");
		} else {
			
         carrello= (ArrayList<prodotto>) session.getAttribute("cart");
			
        // Verifica se il carrello esiste e se contiene prodotti
        if (carrello != null && !carrello.isEmpty()) {
        	 for (prodotto pro : carrello) {
                 total += Double.parseDouble(pro.getCosto()) * pro.getUnit();
                 n += pro.getUnit();
             }
    %>
	<tbody>
	<%
	

	 for (prodotto pro : carrello) { %>
	<tr>
		<td><a href="#" class="rimuovi-prodotto" data-prodotto-id="<%= pro.getId()%>" onclick="rimuoviProdotto(<%= pro.getId()%>)"><i class="far fa-times-circle"></i></a></td>
	 	<td><img src="immagini/<%= pro.getImmagine() %>" alt=""></td>
	 	<td class="nome-cart"><%= pro.getDescrizione() %></td>
	 	<td><%= pro.getCosto() %></td>
	 	
	 	<td><input type="number" id="quantity<%= pro.getId() %>" value="<%= pro.getUnit() %>" min="1" onchange="updateTotal(<%= pro.getId() %>,<%= Float.parseFloat(pro.getCosto()) %>)"></td>
<td class="subTotalCell" id="sub<%= pro.getId() %>"><span><%= Float.parseFloat(pro.getCosto()) * pro.getUnit() %></span></td>
	 	
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
<span style="color: red;">${mess}</span>
<section id="pagamento">

	<div id=totale>
	<h3>Il Tuo Indirizzo</h3>
	<h4><%= nome+" "+cognome %></h4>
	<h4><%= indirizzo %></h4>
		<h3>Totale Carrello</h3>
		
		<table>
		<caption></caption>
			<tr>
				<td><strong>N.Articoli</strong></td>
				<td id="n"><strong><%= n %></strong></td>
			</tr>
			<tr>
				<td><strong>Totale</strong></td>
				<td id="total1"><strong><%=total %></strong></td>
				<%session.setAttribute("tot",Double.toString(total)); %>
			
			</tr>
		
		
		</table>
		
		<form id="form" action="Pagamento" method="post" name="form" >
		<button class=normal type="submit"  id="paga" >Procedi al Pagamento</button>
		<div id="modal" class="modal">
    <div class="modal-content">
        <!-- Nessun testo iniziale qui -->
    </div>
</div>


		
</form>
</div>

</section>



</section>








<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>

 <script>
 
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
 
 function updateTotal(productId, costo) {
	    var quantityInput = document.getElementById("quantity" + productId);
	    var subTotalCell = document.getElementById("sub" + productId); // Seleziona il subTotal corrispondente
	    var nuovoTotale = 0.0;
	    var nuovoN = 0;

	    if (quantityInput && subTotalCell) { // Verifica se entrambi gli elementi sono validi
	        var quantity = parseInt(quantityInput.value);
	        var newTotal = quantity * costo;
	        subTotalCell.querySelector("span").innerHTML = newTotal.toFixed(2);

	        // Itera attraverso tutte le righe del carrello per calcolare il nuovo totale e il nuovo N
	        var carrelloRows = document.querySelectorAll("#carrello tbody tr");
	        carrelloRows.forEach(function(row) {
	            var subtotalCell = row.querySelector(".subTotalCell span");
	            var quantityInput = row.querySelector("input[type='number']");

	            if (subtotalCell && quantityInput) { // Verifica se gli elementi sono validi
	                var subtotal = parseFloat(subtotalCell.innerHTML);
	                nuovoTotale += subtotal;

	                var quantity = parseInt(quantityInput.value);
	                nuovoN += quantity;
	            }
	        });

	        // Aggiorna gli elementi HTML con i nuovi valori di N e Total
	        document.getElementById("n").innerHTML = nuovoN;
	        document.getElementById("total1").innerHTML = nuovoTotale.toFixed(2);
	    }
	}
 
 
 const modal = document.getElementById("modal");
 const modalContent = document.querySelector(".modal-content");
 const confermaButton = document.createElement("button");

 document.getElementById("paga").addEventListener("click", function (e) {
     e.preventDefault(); // Evita il comportamento predefinito del modulo

     // Rimuovi il pulsante "Conferma" esistente se ce n'è uno
     if (modalContent.contains(confermaButton)) {
         confermaButton.remove();
     }

     // Mostra il modal
     modal.style.display = "block";

     // Rimuovi tutti i figli dalla modalContent (pulizia)
     while (modalContent.firstChild) {
         modalContent.removeChild(modalContent.firstChild);
     }

     // Mostra il testo "Procedi al pagamento"
     const confermaText = document.createElement("p");
     confermaText.textContent = "Procedi al pagamento";
     modalContent.appendChild(confermaText);

     // Crea il pulsante "Conferma"
     confermaButton.textContent = "Conferma";
     confermaButton.addEventListener("click", function () {
    	 
         // Esegui qui il codice per inviare l'ordine al server o eseguire altre azioni necessarie
         // Redirect alla servlet Pagamento
         window.location.href = "Pagamento"; // Sostituisci "Pagamento" con l'URL della tua servlet
     });

     // Aggiungi il pulsante "Conferma" al modal
     modalContent.appendChild(confermaButton);
 });

 // Aggiungi un evento per chiudere la finestra modale quando si fa clic al di fuori di essa
 modal.addEventListener("click", function (event) {
     if (event.target === modal) {
         modal.style.display = "none"; // Chiudi il modal se si fa clic al di fuori di esso
     }
 });











 
 
  

 </script>


 
 
 
<jsp:include page="footer.jsp" />

<%
    } else {
        response.sendRedirect("login.jsp"); 
    }
%>
</body>
</html>