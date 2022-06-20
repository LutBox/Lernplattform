<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="de">
<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

    <base href="${pageContext.request.requestURI}"/>

    <title>Bilder hochgeladen</title>
</head>
<body>

		<h1>Bild erfolgreich hochgeladen</h1>

<br><p>Datenbankeintrag:
<br><em>Tabelle Bild - ID:</em>${datenDB.bild1ID}
<br><em>Tabelle Bild - Kategorie:</em>${datenDB.bild1Kategorie}
<br><em>Tabelle Bild - Stream:</em>${datenDB.bild1Stream}
<br><em>Tabelle Bild - Bild:</em><img src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${datenDB.bild1ID}"></p>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>  

</body>
</html>