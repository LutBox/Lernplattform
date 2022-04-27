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
<title>Schnelles Spiel</title>
</head>
<body>

<h1>Schnelles Spiel</h1>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>  

<br><h2>Danke fürs Spielen! :)</h2>
<br><p>Schwierigkeitsgrad aus Servlet: ${schwierigkeitServlet}
<br>Schwierigkeitsgrad aus Bean: ${spielStartenBean.schwierigkeit}</p>

<br>

<br><p>Spielart aus Servlet: ${spielartServlet}
<br>Spielart aus Bean: ${spielStartenBean.spielart}</p>


</body>
</html>