<%--
Erstellt von Lukas Theinert
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.requestURI}"/>
<meta charset="ISO-8859-1">
<title>Lernplattform</title>
</head>
<body>

<h1>Lernplattform Startseite</h1>


	<nav>
		<%@include file="html/jspf/navigation.jspf"%>
	</nav>   
          
<br>

     <li><a href="html/main_pages/impressum.html">Impressum</a></li>
     <li><a href="html/main_pages/kontaktformular.html">Kontaktformular</a></li>

     
<!-- Seiten von Merlin -->
     
</body>
</html>