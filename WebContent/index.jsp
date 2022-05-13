<%--
Erstellt von Lukas Theinert
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.requestURI}"/>
<meta charset="UTF-8">
<title>Lernplattform</title>
</head>
<body>

<h1>Lernplattform Startseite</h1>


	<nav>
		<%@include file="html/jspf/navigation.jspf"%>
	</nav>   
          
<br>

    
     
<!-- Seiten von Merlin -->
<%@include file="./html/jspf/signup-regist-tmp-nav.jspf"%>
     
</body>
</html>