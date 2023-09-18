<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="Model.prodotto"%>
    
    
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    // Ottieni i parametri dalla richiesta
    int id =Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
	String costo = request.getParameter("costo");
	String descrizione = request.getParameter("descrizione");
	String categoria = request.getParameter("categoria");
	String immagine = request.getParameter("immagine");
	String marca = request.getParameter("marca");
	int unit =Integer.parseInt(request.getParameter("unit"));
    

    // Crea un oggetto Prodotto
    prodotto prodotto = new prodotto(id,nome,costo,descrizione,categoria,immagine,marca,unit);

    // Ottieni il carrello dalla sessione o crea un nuovo carrello se non esiste
    ArrayList<prodotto> cart = (ArrayList<prodotto>) session.getAttribute("cart");
    if (cart == null) {
        cart= new ArrayList<prodotto>();
        session.setAttribute("cart", cart);
    }
    

    
    boolean isProductInCart = false;
    for (prodotto existingProduct : cart) {
        if (existingProduct.getId() == id) {
        	existingProduct.setUnit(existingProduct.getUnit() + 1);
            isProductInCart = true;
            break;
        }
    }

    if (!isProductInCart) {
        // Se il prodotto non è nel carrello, crea un nuovo oggetto Prodotto
        prodotto prodotto1 = new prodotto(id, nome, costo, descrizione, categoria, immagine, marca, unit);
        // Aggiungi il prodotto al carrello solo se non è già presente
        cart.add(prodotto1);
    }		
    response.sendRedirect("index.jsp"); // Sostituisci con la pagina desiderata
%>

</body>
</html>