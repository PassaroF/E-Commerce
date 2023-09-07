<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registrazione</title>
</head>
<style>
	{
		margin:0px;
		padding:0px;
		box-sizing:border-box;
		
	}
	body {
    background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
    font-family: 'Poppins', sans-serif;
}
	
	#container
	{
		
		 width: 300px;
    margin: 20vh auto 0 auto;
    padding: 10px;
    background-color: whitesmoke;
    border-radius: 4px;
    font-size: 12px;
		}
	#container-body{padding:20px;}
	.form_title{
		font-size:35px;
		color: #0f2027;
		text-align:center;
		padding:10px;
		font-weight:normal;
	} 
	.head_para{
		font-size:19px;
		color: #99a2a7;
		text-align:center;
		font-weight:normal; 
	}
	#form_name{
		padding:15px 0 10px 0px;;
	}
	.input_name{
		width:207px;
		padding:5px;
		font-size:18px;
	}
	#cognome_form{
		padding:15px 0 10px 0px;
	}
	.input_cognome{
		width:207px;
		padding:5px;
		font-size:18px;
	}
	#email_form{
		padding:15px 0 10px 0px;
	}
	
	.input_email{
	width:207px;
		padding:5px;
		font-size:18px;
	}
	#re_email_form{
		padding:15px 0 10px 0px;
	}
	.input_Re_email{
	width:207px;
		padding:5px;
		font-size:18px;
	}
	#password_form{
	padding:15px 0 0px 0px;
	}
	.input_password{
	width:207px;
		padding:5px;
		font-size:18px;
	
	}
	#Address_form{
	clear:both;
	padding:15px 0 10px 0px;
	}
	.input_address{
	width:207px;
		padding:5px;
		font-size:18px;
	}
	#Nazione_form{
	clear:both;
	padding:15px 0 0px 0px;
	}
	#Citta_form{
	clear:both;
	padding:15px 0 10px 0px;
	}
	#Cap_form{
	clear:both;
	padding:15px 0 10px 0px;
	}
	#Provincia_form{
	clear:both;
	padding:15px 0 10px 0px;
	}
	#Via_form{
	clear:both;
	padding:15px 0 10px 0px;
	}
	#Civico_form{
	clear:both;
	padding:15px 0 10px 0px;
	}
	#Telefono_form{
	clear:both;
	padding:15px 0 10px 0px;
	}
	.birthday_title{
	font-size:16px;
		color:#8b919d;
		font-weight:normal;
		padding:15px 0 10px 0px;
	}
	select{padding:10px;}
	#birthday{
		font-size:12px;
		color:#8b919d;
		padding:10px;
	}
	#sign_user{
		padding:10px;
    margin-top:10px;
 	
    display: block;
    margin: 0 10;
    width: 100px;
    color: white;
    background-color: rgb(41, 57, 194);
    border: none;
    border-radius: 4px;
     text-align: center;
	}
	#errorBox{
		color:red;
	}
	#errorBoxC{
		color:red;
	}
	#errorBoxE{
		color:red;
	}#errorBoxre{
		color:red;
	}
	#errorBoxPa{
		color:red;
	}
	#errorBoxA{
		color:red;
	}
	#errorBoxCom{
		color:red;
	}
	#errorBoxCi{
		color:red;
	}#errorBoxCap{
		color:red;
	}#errorBoxPro{
		color:red;
	}
	#errorBoxV{
		color:red;
	}
	#errorBoxCiv{
		color:red;
	}
	#errorBoxTe{
		color:red;
	}
	*:focus {
    outline: none;
}
</style>

<script>
function Invio(){
	var email_check=/^[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}$/;
	var nome=document.form.Nome.value,
	cognome=document.form.Cognome.value,
	email=document.form.Email.value,
	re_email=document.form.Re_email.value,
	pass=document.form.Password.value,
	nazione=document.form.Nazione.value,
	citta=document.form.Citta.value,
	cap=document.form.Cap.value,
	provincia=document.form.Provincia.value,
	via=document.form.Via.value,
	civico=document.form.Civico.value,
	telefono=document.form.Telefono.value,
	giorno=document.form.Giorno.value,
	mese=document.form.Mese.value,
	anno=document.form.Anno.value;


	
	if(nome==""){
		document.form.Nome.focus();
		document.form.Nome.style.borderColor='red';
		document.getElementById("errorBox").innerHTML="Inserire Nome";
		
		
	return false;
	}else{
		document.form.Nome.style.borderColor='green';
		document.getElementById("errorBox").innerHTML="";
	}
	
	if(cognome==""){
		document.form.Cognome.focus();
		document.form.Cognome.style.borderColor='red';
		document.getElementById("errorBoxC").innerHTML="Inserire Cognome";
		return false;}
	else{document.form.Cognome.style.borderColor='green';
	document.getElementById("errorBoxC").innerHTML="";}
	
	
		if(email==""){
			document.form.Email.focus();
			document.form.Email.style.borderColor='red';
			document.getElementById("errorBoxE").innerHTML="Inserire Email";
			return false;
		}else if(!email_check.test(email)){
			document.form.Email.focus();
			document.form.Email.style.borderColor='red';
			document.getElementById("errorBoxE").innerHTML="Inserire Email valida";
			return false;
			
		}else{document.form.Email.style.borderColor='green';
		document.getElementById("errorBoxE").innerHTML="";
		}
		if(email != re_email){
			document.form.Re_email.focus();
			document.form.Re_email.style.borderColor='red';
			document.getElementById("errorBoxre").innerHTML="Email non corrispondono";
			return false;
		}else{
			document.form.Re_email.style.borderColor='green';
			document.getElementById("errorBoxre").innerHTML="";
			
		}

		if(pass==""){
			document.form.Password.focus();
			document.form.Password.style.borderColor='red';
			document.getElementById("errorBoxPa").innerHTML="Inserire Password";
			return false;
		}else if(pass.length < 8){
			document.form.Password.style.borderColor='red';
			document.getElementById("errorBoxPa").innerHTML="La Password non rispetta i requisiti";
			return false;
		}else{
			document.form.Password.style.borderColor='green';
			document.getElementById("errorBoxPa").innerHTML="";
		}
		if(nazione==""){
			document.form.Nazione.focus();
			document.form.Nazione.style.borderColor='red';
			document.getElementById("errorBoxA").innerHTML="Inserire nazione";
			return false;
		}else{
			document.form.Nazione.style.borderColor='green';
			document.getElementById("errorBoxA").innerHTML="";
			
		}if(citta==""){
			document.form.Citta.focus();
			document.form.Citta.style.borderColor='red';
			document.getElementById("errorBoxCi").innerHTML="Inserire citta";
			return false;
		}else{
			document.form.Citta.style.borderColor='green';
			document.getElementById("errorBoxCi").innerHTML="";
			
			
		}if(cap==""){
			document.form.Cap.focus();
			document.form.Cap.style.borderColor='red';
			document.getElementById("errorBoxCap").innerHTML="Inserire Cap";
			return false;
		}else{
			document.form.Cap.style.borderColor='green';
			document.getElementById("errorBoxCap").innerHTML="";
		}
		if(provincia==""){
			document.form.Provincia.focus();
			document.form.Provincia.style.borderColor='red';
			document.getElementById("errorBoxPro").innerHTML="Inserire provincia";
			return false;
		}else{
			document.form.Provincia.style.borderColor='green';
			document.getElementById("errorBoxPro").innerHTML="";
		}
		if(via==""){
			document.form.Via.focus();
			document.form.Via.style.borderColor='red';
			document.getElementById("errorBoxV").innerHTML="Inserire via";
			return false;
		}else{
			document.form.Via.style.borderColor='green';
			document.getElementById("errorBoxV").innerHTML="";
		}
		
		if(civico==""){
			document.form.Civico.focus();
			document.form.Civico.style.borderColor='red';
			document.getElementById("errorBoxCiv").innerHTML="Inserire civico";
			return false;
		}else{
			document.form.Civico.style.borderColor='green';
			document.getElementById("errorBoxCiv").innerHTML="";
			
		}if(telefono==""){
			document.form.Telefono.focus();
			document.form.Telefono.style.borderColor='red';
			document.getElementById("errorBoxTe").innerHTML="Inserire telefono";
			return false;
		}else{
			document.form.Telefono.style.borderColor='green';
			document.getElementById("errorBoxTe").innerHTML="";
			
		}if(giorno==""){
			document.form.Giorno.focus();
			document.getElementById("errorBoxCom").innerHTML="Inserire giorno";
			return false;
		}if(mese==""){
			document.form.Mese.focus();
			document.getElementById("errorBoxCom").innerHTML="Inserire mese";
			return false;
		}if(anno==""){
			document.form.Anno.focus();
			document.getElementById("errorBoxCom").innerHTML="Inserire anno";
			return false;
		}


		if(nome!="" && cognome!="" && email != "" && pass!=""&& citta!="" && nazione!="" && citta!=""&& cap!="" &&
				provincia!="" && via!=""&& civico!="" && telefono!=""  && giorno!="" && mese!=""&& anno!=""){
			document.getElementById("errorBox").innerHTML="Login Effettuato";
		}
		

	} 



</script>
<body>
	<div id="description"></div>
<div id="container">
		<div id="container_body">
			<div>
				 <h1>BYTEshop</h1>
            <h3>Registrazione</h3>
            <span style="color: red;">${mess}</span>
				<p class="head_para"></p>
			</div>
		<div id="form_name">
			<div class="nome">
				<form action="Registrazione" method="post" name="form">
					
				
			<input type="text" name="Nome" value="" placeholder="Nome" class="input_name">
			<div id="errorBox"></div>
			</div>	</div>
			<div id="cognome_form">
		<input type="text" name="Cognome" value="" placeholder="Cognome" class="input_email">
		<div id="errorBoxC"></div>
		</div>	
		<div id="email_form">
		<input type="text" name="Email" value="" placeholder="Email" class="input_email">
		<div id="errorBoxE"></div>
		</div>
		<div id="re_email_form">
		<input type="text" name="Re_email" value="" placeholder="Confermare Email" class="input_Re_email">
		<div id="errorBoxre"></div>
		</div>
		<div id="password_form">
		<input type="password" name="Password" value="" placeholder="Password" class="input_password">
		<div id="errorBoxPa"></div>
		<h4>La Password deve contenere almeno 8 caratteri</h4>
		</div>
		<div id="Address_form">
		<input type="text" name="Nazione" value="" placeholder="Nazione" class="input_address">
		<div id="errorBoxA"></div>
		</div>
		<div id="Citta_form">
		<input type="text" name="Citta" value="" placeholder="Citta" class="input_address">
		<div id="errorBoxCi"></div>
		</div>
		<div id="Cap_form">
		<input type="text" name="Cap" value="" placeholder="cap" class="input_address">
		<div id="errorBoxCap"></div>
		</div>
		<div id="Provincia_form">
		<input type="text" name="Provincia" value="" placeholder="Provincia" class="input_address">
		<div id="errorBoxPro"></div>
		</div>
		<div id="Via_form">
		<input type="text" name="Via" value="" placeholder="Via" class="input_address">
		<div id="errorBoxV"></div>
		</div>
		<div id="Civico_form">
		<input type="text" name="Civico" value="" placeholder="Civico" class="input_address">
		<div id="errorBoxCiv"></div>
		</div>
		<div id="Telefono_form">
		<input type="text" name="Telefono" value="" placeholder="Telefono" class="input_address">
		<div id="errorBoxTe"></div>
		</div>
		
		<div>
		<h3 class="birthday_title">Data di nascita</h3>
		</div>
		<div>
		<select name="Giorno">
			<option value="" selected> Giorno</option>
			<option value="1">1</option>
			<option value="1">2</option>
			<option value="1">3</option>
			<option value="1">4</option>
			
			
		</select>
		&nbsp;&nbsp;
		<select name="Mese">
			<option value="" selected> Mese</option>
			<option value="Gen">GEN</option>
			<option value="Feb">FEB</option>
			<option value="Mar">MAR</option>
			<option value="Apr">APR</option>
			
		</select>
		&nbsp;&nbsp;
		<select name="Anno">
			<option value="" selected> Mese</option>
			<option value="2000">2000</option>
			<option value="1999">1999</option>
			<option value="1998">1998</option>
			<option value="1997">1997</option>
			
		</select>
		<div id="errorBoxCom"></div>
		</div>
		<h3><a href ="login.jsp">Sei già iscritto?</a></h3><br>
		<input type="submit" id="sign_user" onClick="return Invio();" value="Registazione">
		</form>
		</div>
	
	</div>
	
</body>

</html>