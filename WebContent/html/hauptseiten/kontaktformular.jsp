
<%--
Erstellt von Zohal Mohammadi
--%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta charset="ISO-8859-1">
<title>Kontaktformular</title>
</head>
<body>
<h1> Kontaktformular</h1>
            <nav>
				<%@include file="../jspf/navigation.jspf"%>
			</nav>
   <form action="Kontaktformular" method="post">
          <p>Vorname:<br> <input type="text" name="vorname" size ="35" maxlength="40" placeholder="Ihr Vorname"></p>

          <p> Nachname: <br><input type ="text" name="nachname" size "35" maxlength="40" placeholder="Ihr Nachname" ></p>
          <p>E-Mail:<br><input type="text" name="E-mail" size="30" maxlength="35" placeholder="Ihre E-Mail"></p>
          <p> Ihre Anligen an uns: </br>
               <textarea  name ="Use_angabe" rows ="10" cols="50"> </textarea>
          </p>
           <button type ="submit" name="sendebutton" value="submit" >absenden</button>
</form>
</body>
</html>