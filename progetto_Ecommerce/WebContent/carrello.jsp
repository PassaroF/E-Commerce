<%@ page import="Model.mar.mao" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="java.util.Collection" %>
<%@ page import="Model.CarrelloModel" %>

<%
  CarrelloModel carrello;
  synchronized (session) {
    carrello = (CarrelloModel) session.getAttribute("carrello");
    if (carrello == null) {
      carrello = new CarrelloModel();
      session.setAttribute("carrello", carrello);
    }
  }

  Collection<?> oggettiCarrello = carrello.getCarrello();
%>

<!DOCTYPE html>
<html lang="it">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="carrello.css">
  <title>Carrello</title>
</head>
<body>
<h1>Carrello</h1>
<table id="prodotti">
  <caption hidden>Carrello</caption>
  <tr id="element">
    <th>Nome</th>
    <th>Prezzo</th>
    <th>Immagine</th>
    <th>Quantit&#224</th>
      </tr>

 <%
    if (oggettiCarrello != null && oggettiCarrello.size() != 0) {
      DecimalFormat df = new DecimalFormat("#.##");
      df.setRoundingMode(RoundingMode.FLOOR);

      for (Object o : oggettiCarrello) {
        Mao mao = (Mao) o;
        String prezzo = df.format(mao.getMarBean().getPrezzo());

        if (prezzo.matches("[0-9]+"))
          prezzo += ".00";
  %>
<tr class="productRow" id="<%= mao.getMarBean().getID() %>">
    <td><%= mao.getMarBean().getNome() %> </td>
    <td>&euro;&nbsp;<%= prezzo %> </td>
    <td><img src="../<%= mao.getMarBean().getimg() %>" alt="<%= mao.getMarBean().getNome() %>"></td>
    <td>
      <form class="addForm">
        <label>
        <input type="number" name="quantita" min="0" max="100" value="<%= mao.getQuantita() %>">
        <input type="hidden" name="ID" value="<%= mao.getMarBean().getID() %>">
        <br> <button type="submit">Aggiorna</button>
        </label>
      </form>
    </td>
     <td>
      <form class="rmvForm">
        <input type="hidden" name="ID" value="<%= mao.getMarBean().getID() %>">
        <button type="submit">Elimina</button>
      </form>
    </td>
  </tr>
  
  <%
      
    } } else {
  %>
  <tr>
    <td colspan="7">Nessun prodotto nel carello</td>
  </tr>
  <% } %>
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha384-UG8ao2jwOWB7/oDdObZc6ItJmwUkR/PfMyt9Qs5AwX7PsnYn1CRKCTWyncPTWvaS" crossorigin="anonymous"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $(".addForm").on("submit", function(event) {
      event.preventDefault();
      $.ajax({
          type: "POST",
          url: "${pageContext.request.contextPath}/Aggiungi",
          data: $(this).serialize()
        });
      }); 
    $(".rmvForm").on("submit", function(event) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/Rimuovi",
            data: $(this).serialize(),
            success: function() {
              let ID = $(".rmvForm input[name='ID']").attr("value");
              document.getElementById(ID.toString()).remove();
              if (document.getElementsByClassName("productRow").length === 0)
                  location.reload();
              }
            });
          });
        });
  </script>
  
  
</body>