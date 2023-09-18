<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./login.css">
    </head>
    
    <script>
    
function control(){
	var email_check=/^[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}$/;
	var email=document.form.email.value;
	var	pass=document.form.password.value;
    
	  if(email==""){
			document.form.email.focus();
			document.getElementById('email').style.borderColor='red';
			document.getElementById('error').innerHTML="Inserire Email";
			
		return false;
	    }else if(email.match(email_check)){
	    	document.form.email.focus();
	    	document.form.email.style.borderColor='green';
	    	document.getElementById("error").innerHTML="";
	    	
	    }else{
	    	document.form.email.focus();
			document.getElementById('email').style.borderColor='red';
			document.getElementById("error").innerHTML="Inserire una Mail Valida";
			return false;
	    }
    if(pass==""){
		document.form.password.focus();
		document.getElementById('password').style.borderColor='red';
		document.getElementById("error1").innerHTML="Inserire Password";
		return false;
    }else{
    	document.getElementById('password').style.borderColor='green';
		document.getElementById("error1").innerHTML="";
    	
    }
    }

        
    </script>
   
<body>


    <div class="container">
    <form id="form" action="Login" method="post" name="form" >
            <h1>BYTEshop</h1>
            <h3>Login</h3>
            <div class="input-control">
                <label for="email">Email</label>
                <input id="email" name="email" value="" type="text">
                <div class="error" id="error"></div>
            </div>
            <div class="input-control">
                <label for="password">Password</label>
                <input id="password" name="password" value="" type="password">
                <div class="error1" id="error1"></div>
                <span style="color: red;">${mess}</span>
            </div>
            
            <h3><a href ="registrazione.jsp">Sei un nuovo utente? Registrati</a></h3><br>
          

            <button type="submit" id="sign_user" onClick="return control();">Login</button>
        </form>
    </div>
    
  


    
</body>
</html>
