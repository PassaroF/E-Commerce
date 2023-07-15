<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"

    %>
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
  
    <title>Admin Dashboard Panel</title> 
</head>




<body>

    <nav>
        <div class="logo-name">
            <div class="logo-image">
                <img src="immagini/logo3.jpg" alt="">
            </div>

            <span class="logo_name">BYTEshop</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="#">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Dahsboard</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name">Catalogo</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li>
            </ul>
            
            
                
            
        </div>
    </nav>

    <section class="dashboard">
        <div class="top">

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>
            
            <h3>${nome}</h3>
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

                <div class="boxes">
                    <div class="box box1">
                        <i class="uil uil-thumbs-up"></i>
                        <span class="text">Total Likes</span>
                        <span class="number">50,120</span>
                    </div>
                    <div class="box box2">
                        <i class="uil uil-comments"></i>
                        <span class="text">Comments</span>
                        <span class="number">20,120</span>
                    </div>
                    <div class="box box3">
                        <i class="uil uil-share"></i>
                        <span class="text">Total Share</span>
                        <span class="number">10,120</span>
                    </div>
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Ordini</span>
    </div>
			     <div class="activity-data">
							<table border ="1" width="100%" align="center">
         <tr>
          <th><b>ID</b></th>
          <th><b>DESTINATARIO</b></th>
          <th><b>INDIRIZZO</b></th>
          <th><b>TOTALE</b></th>
         <th><b>PRODOTTO</b></th>
         </tr>
                       
                        
                 <%ArrayList<ordini> ord = 
            (ArrayList<ordini>)request.getAttribute("ordini");
        for(ordini o:ord){%>
                    <tr>
                <td><%=o.getId()%></td>
                <td><%=o.getDestinatario()%></td>
                <td><%=o.getIndirizzo() %></td>
                <td><%=o.getTotale()%></td>
                <td><%=o.getProdotti() %></td>
            </tr>
                    <%}%>
                    </table>
                </div>
              
           
            </div>
        </div>
    </section>
    <script src="admin.js"></script>
</body>
</html>