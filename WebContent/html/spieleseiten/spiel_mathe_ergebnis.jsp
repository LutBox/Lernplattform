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
<title>Spielergebnis</title>
</head>
<body>

<h1>Spielergebnis</h1>

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

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>  

</body>
</html>