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
<title>Mathespielergebnis</title>
</head>
<body>

	<header>
		<h1>Spieleübersicht</h1>	
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	
	<!-- Flex-Item 1 -->
	<div id="flexarea">
	
	<!-- Flex-Item 2 -->
	<article>

<h1>Matheergebnis</h1>

	<c:set var="nutzerErgebnis" value="${spielMatheBean.nutzerErgebnis1}"/>
	<c:set var="ergebnis" value="${spielMatheBean.ergebnis1}"/>
<c:choose>
    <c:when test="${nutzerErgebnis == ergebnis}" >
        Dein Ergebnis war richtig :D 
        <br />
    </c:when>    
    <c:otherwise>
        Dein Ergebnis war falsch D: 
        <br />
    </c:otherwise>
</c:choose>

<br><p>Nutzerergebnis: ${spielMatheBean.nutzerErgebnis1}
<br>Ergebnis: ${spielMatheBean.ergebnis1}</p>


<br><p>Datenbankeintrag:
<br><em>Aufgabe:</em>${datenDB.aufgabe}
<br><em>Ergebnis:</em>${datenDB.ergebnis1}
<br><em>Nutzerergebnis:</em>${datenDB.nutzerErgebnis1}</p>

				<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
	
	</article>
		
	</div>
	<!-- Ende der FLEXBOX -->
	<!-- Ende der FLEXBOX -->
	<br> <br> <br> <br>
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>

</body>
</html>