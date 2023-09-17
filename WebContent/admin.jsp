<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"

    %>
    <%@page import="Controller.Bean_Prodotti"%>
     <%@page import="Controller.Bean_ordini"%>
    <%@page import="Model.prodotto"%>
    <%@page import="Model.ordini"%>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin.css"> 
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  
    <title>Admin Dashboard Panel</title> 
</head>

<body>
 <%
    // Controlla se l'utente è loggato
    String loggedInUser = (String) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
      
    %>
       <nav>
        <div class="logo-name">
            <div class="logo-image">
                <img src="immagini/logo3.png" alt="">
            </div>

            <span class="logo_name">BYTEshop</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="#title_elim">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name">Elimina</span>
                </a></li>
                <li><a href="#title_mod">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name">Modifica</span>
                </a></li>
                <li><a href="#title_add">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name">Aggiungi</span>
                </a></li>
                <li><a href="logout.jsp">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li>
            </ul>
            
            
                
            
        </div>
    </nav>

    <section class="dashboard">
        <div class="top">
        
            <h3 id="nome"><%=session.getAttribute("nome") %></h3>
           
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

                <div class="boxes">
                
                    <div class="box box1">
                    <form id="form" action="Admin" method="post" name="form" >
                    <input type="hidden" name="nome" value="${nome}">
                     <div style="text-align: center;">
       					     <i class="uil uil-user"></i>
       					     <span class="text">Ricerca Cliente</span>
       				 </div>
                        
                         <input id="cliente" name="cliente" placeholder="inserire nome cliente" value="" type="text"style="display: block; margin: 0 auto; width: 100%;">
                
                        
                       <button type="submit" id="search" style="display: block; margin: 0 auto; width: 100px;">Ricerca</button>
                   </form>
                    </div>
                     <div class="box box2">
                    <form id="form" action="Data" method="post" name="form" >
                     <input type="hidden" name="nome" value="${nome}">
                     <div style="text-align: center;">
       					     <i class="uil uil-calendar-alt"></i>
       					     <span class="text">Ricerca Data</span>
       				 </div>
                        
                         <input id="data" name="data" placeholder="inserire data inizio" value="" type="text"style="display: block; margin: 0 auto; width: 100%;">
                         <input id="data1" name="data1" placeholder="inserire data fine" value="" type="text"style="display: block; margin: 0 auto; width: 100%;">
               
                        
                       <button type="submit" id="search1" style="display: block; margin: 0 auto; width: 100px;">Ricerca</button>
                   </form>
                   
    
     
                    </div>
                    <div class="box box3" type="hidden"></div>
                    
                </div>
            </div>

            <div class="activity">
            <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Clienti</span>
    </div>
    <div class="messaggio">
    
     <font color="red">
     				<h3 id="not" >${mess}</h3>
     				</font>
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
                 ArrayList<ordini> ord1 = null;
         ord1 = 
            (ArrayList<ordini>)request.getAttribute("dati");
         if(ord1!=null){
        for(ordini g:ord1){%>
                    <tr>
                <td><%=g.getId()%></td>
                <td><%=g.getDestinatario()%></td>
                <td><%=g.getIndirizzo() %></td>
                <td><%=g.getData() %></td>
                <td><%=g.getTotale()%></td>
                <td><%=g.getProdotti() %></td>
               
            </tr>
                    <%}}%>
     
							</table>
							</div>
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Ordini</span>
    </div>
			     <div class="activity-data">
							<table border ="1" width="100%" align="center">
         <tr>
          <th><b>ID</b></th>
          <th><b>CLIENTE</b></th>
          <th><b>INDIRIZZO</b></th>
          <th><b>DATA</b></th>
          <th><b>TOTALE</b></th>
         <th><b>PRODOTTO</b></th>
         
         </tr>
                       
                        
           <%
        // Crea un'istanza del JavaBean
        Bean_ordini bean1 = new Bean_ordini();

        // Recupera i dati dal JavaBean
        ArrayList<ordini> pro1 = bean1.getOrdini();

        // Utilizza i dati nella pagina JSP
        if (pro1 != null) {
            for (ordini o : pro1) {
   	
    
                       
              
        %>
                    <tr>
                <td><%=o.getId()%></td>
                <td><%=o.getDestinatario() %></td>
                <td><%=o.getIndirizzo() %></td>
                <td><%=o.getData() %></td>
                 <td><%=o.getTotale() %></td>
                <td><%=o.getProdotti() %></td>
                 
                  
                
            </tr>
                
               
            </tr>
                    <%}}%>
                    </table>
                </div>
                           <div class="title" id="title_elim">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Elimina Prodotti</span>
    </div>
    <font color="red">
     				<h3 id="not1" >${mess_pro}</h3>
     				</font>
                 <div class="activity-data">
							<table border ="1" width="100%" align="center">
         <tr>
          <th><b>ID</b></th>
          <th><b>NOME</b></th>
          <th><b>COSTO</b></th>
          <th><b>DESCRIZIONE</b></th>
          <th><b>UNITA</b></th>
         <th><b>CATEGORIA</b></th>
         <th><b>IMMAGINE</b></th>
         <th><b>MARCA</b></th>
         <th><b>AZIONI</b></th>
         </tr>
                       
                        
            <%
        // Crea un'istanza del JavaBean
        Bean_Prodotti bean = new Bean_Prodotti();

        // Recupera i dati dal JavaBean
        ArrayList<prodotto> pro = bean.getProdotti();

        // Utilizza i dati nella pagina JSP
        if (pro != null) {
            for (prodotto o : pro) {
   	
    
                       
              
        %>
                    <tr>
                <td><%=o.getId()%></td>
                <td><%=o.getNome() %></td>
                <td><%=o.getCosto() %></td>
                <td><%=o.getDescrizione() %></td>
                 <td><%=o.getUnita() %></td>
                <td><%=o.getCategoria() %></td>
                 <td><%=o.getImmagine() %></td>
                  <td><%=o.getMarca() %></td>
                  
                 <form action="Elimina" method="post">
  <input type="hidden" name="id_prodotto" value="<%=o.getId()%>">
  <td> <button type="submit">Elimina</button></td>
</form> 
              
                
            </tr>
                
               
            </tr>
                    <%}}%>
                    </table>
                </div>
                             <div class="title"id="title_mod">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Modifica Prodotti</span>
    </div>
    <font color="red">
     				<h3 id="not1" >${mess_pro1}</h3>
     				</font>
                 <div class="activity-data">
							<table border ="1" width="100%" align="center">
         <tr>
          <th><b>ID</b></th>
          <th><b>NOME</b></th>
          <th><b>COSTO</b></th>
          <th><b>DESCRIZIONE</b></th>
          <th><b>UNITA</b></th>
         <th><b>CATEGORIA</b></th>
         <th><b>IMMAGINE</b></th>
         <th><b>MARCA</b></th>
         <th><b>AZIONI</b></th>
         </tr>
                       
                        
            <%
        // Crea un'istanza del JavaBean
        Bean_Prodotti bean4 = new Bean_Prodotti();

        // Recupera i dati dal JavaBean
        ArrayList<prodotto> pro2 = bean4.getProdotti();

        // Utilizza i dati nella pagina JSP
        if (pro2 != null) {
            for (prodotto o : pro2) {
   	
    
                       
              
        %>
                    <tr>
               <form action="Modifica" method="post">     
         <td><input type="text" name="id" value="<%=o.getId() %>" readonly /></td>
        <td><input type="text" name="nome" value="<%=o.getNome() %>" id="nome_<%=o.getId()%>" readonly /></td>
        <td><input type="text" name="costo" value="<%=o.getCosto() %>" id="costo_<%=o.getId()%>" readonly /></td>
         <td><input type="text" name="descrizione" value="<%=o.getDescrizione() %>" id="descrizione_<%=o.getId()%>" readonly /></td>       
        <td><input type="text" name="unita" value="<%=o.getUnita() %>" id="unita_<%=o.getId()%>" readonly /></td>        
        <td><input type="text" name="categoria" value="<%=o.getCategoria() %>" id="categoria_<%=o.getId()%>" readonly /></td>         
        <td><input type="text" name="immagine" value="<%=o.getImmagine() %>" id="immagine_<%=o.getId()%>" readonly /></td>        
         <td><input type="text" name="marca" value="<%=o.getMarca() %>" id="marca_<%=o.getId()%>" readonly /></td>       
                 <td><button type="button" onclick="abilitaModifica(<%=o.getId()%>)">Modifica</button></td>
        <td><button type="submit" id="salva_<%=o.getId()%>" style="display: none;">Salva</button></td>
    </form>
</form> 
              
                
            </tr>
                
               
            </tr>
                    <%}}%>
                    </table>
                </div>
                
                             <div class="title" id="title_add">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Aggiungi Prodotto</span>
    </div>
    <font color="red">
     				<h3 id="not1" >${mess_pro3}</h3>
     				</font>
                 <div class="activity-data">
							<table border ="1" width="100%" align="center">
         <tr>
          
          <th><b>NOME</b></th>
          <th><b>COSTO</b></th>
          <th><b>DESCRIZIONE</b></th>
          <th><b>UNITA</b></th>
         <th><b>CATEGORIA</b></th>
         <th><b>IMMAGINE</b></th>
         <th><b>MARCA</b></th>
         <th><b>AZIONI</b></th>
         </tr>
                       
                        
            
                    <tr>
               <form action="Aggiungi" method="post">     
         
        <td><input type="text" name="nome" value="" id="nome"  /></td>
        <td><input type="text" name="costo" value="" id="costo"  /></td>
         <td><input type="text" name="descrizione" value="" id="descrizione%>" /></td>       
        <td><input type="text" name="unita" value="" id="unita"  /></td>        
          
        <td><select name="categoria" id="categoria">
            <option value="pc">PC</option>
            <option value="console">Console</option>
            
           
        </select>   </td> 
        <td><input type="text" name="immagine" value="" id="immagine"  /></td>        
         <td><input type="text" name="marca" value="" id="marca" /></td>       
                 
        <td><button type="submit"">Aggiungi</button></td>
    </form>
</form> 
              
                
            </tr>
                
               
            </tr>
                    
                    </table>
                </div>
         
    </div>
            </div> 
        
        
    </section>
   
   
   
   <script>
   function abilitaModifica(id) {
       document.getElementById("nome_" + id).readOnly = false;
       document.getElementById("costo_" + id).readOnly = false;
       document.getElementById("descrizione_" + id).readOnly = false;
       document.getElementById("unita_" + id).readOnly = false;
       document.getElementById("categoria_" + id).readOnly = false;
       document.getElementById("immagine_" + id).readOnly = false;
       document.getElementById("marca_" + id).readOnly = false;
       
       // Nascondi il pulsante "Modifica"
       document.querySelector("button[onclick=\"abilitaModifica(" + id + ")\"]").style.display = "none";
       
       // Mostra il pulsante "Salva"
       document.getElementById("salva_" + id).style.display = "block";
   }
   </script>



        
    <%
    } else {
        
        response.sendRedirect("login.jsp"); // Cambia con la tua pagina di login
    }
    %>
    

</body>
</html>