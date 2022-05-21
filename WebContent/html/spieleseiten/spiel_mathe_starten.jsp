<%--
Erstellt von Lukas Theinert
--%>

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

<base href="${pageContext.request.requestURI}"/>
<meta charset="ISO-8859-1">
<title>Spiel Starten</title>
</head>
<body>

	<header>
		<h1>Mathespiel starten</h1>	
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	
	<!-- Flex-Item 1 -->
	<div id="flexarea"> 
	
	<!-- Flex-Item 2 -->
	<article>

<br><p>Schwierigkeitsgrad aus Servlet: ${schwierigkeitServlet}
<br>Schwierigkeitsgrad aus Bean: ${spielStartenBean.schwierigkeit}</p>

<br>

<br><p>Spielart aus Servlet: ${spielartServlet}
<br>Spielart aus Bean: ${spielStartenBean.spielart}</p>


	<form id="Spielstarten" action="${pageContext.request.contextPath}/SpielMatheServlet" method="post" accept-charset="UTF-8">

		<button name="spielen" type="submit">Spielen!</button>

	</form>

				<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
	
	</article>

		
	</div>
	<!-- Ende der FLEXBOX -->
	<br> <br> <br> <br>
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>

</body>
</html>