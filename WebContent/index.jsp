<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<li><a href="#">Home</a></li>
		<li><a href="#">Offerte</a></li>
		<li><a href="#">Catalogo</a></li>	
		
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

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
 <script>
 let btncerca=document.querySelector('.btncerca');
 let btnchiudi=document.querySelector('.btnchiudi');
 let searchBox=document.querySelector('.searchBox');
 let navigation=document.querySelector('.navigation');
 let menu=document.querySelector('.menu');
 let header=document.querySelector('header');
 
 btncerca.onclick=function(){
	 searchBox.classList.add('active');
	 btnchiudi.classList.add('active');
	 btncerca.classList.add('active');
	 menu.classList.add('hide');
	 header.classList.remove('open');
	 
	 
 }
 btnchiudi.onclick=function(){
	 searchBox.classList.remove('active');
	 btnchiudi.classList.remove('active');
	 btncerca.classList.remove('active');
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