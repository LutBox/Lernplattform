<%--
Erstellt von Lukas Theinert
--%>

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />

<base href="${pageContext.request.requestURI}"/>
<meta charset="ISO-8859-1">
<title>Spiel Starten</title>
</head>
<body>

<h1>Spiel Starten</h1>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>  

<br><p>Schwierigkeitsgrad aus Servlet: ${schwierigkeitServlet}
<br>Schwierigkeitsgrad aus Bean: ${spielStartenBean.schwierigkeit}</p>

<br>

<br><p>Spielart aus Servlet: ${spielartServlet}
<br>Spielart aus Bean: ${spielStartenBean.spielart}</p>


	<form id="Spielstarten" action="${pageContext.request.contextPath}/SpielMatheServlet" method="post" accept-charset="UTF-8">

		<button name="spielen" type="submit">Spielen!</button>

	</form>


</body>
</html>