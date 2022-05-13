<%--
Erstellt von Lukas Theinert
--%>


<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta charset="ISO-8859-1">
<title>Images</title>
</head>
<body>

	<h1>Bilder anzeigen</h1>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>

	<%--    
	<br><em>Bilder: </em><img src="${pageContext.request.contextPath}/BildAnzeigenServlet">


	<form:select path="bilderListe">
		<form:options items="${bilderListe}"></form:options>
	</form:select>
	--%>
	<c:forEach var="bilderListe" items="${bilderListe}">
		<br>
		<img src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${bilderListe.bild1ID}">
	</c:forEach>


</body>
</html>