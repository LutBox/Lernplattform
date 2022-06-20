<%--
Erstellt von Merlin Weinthaler und Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="de">
<head>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spielehauptseite.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/spielehauptseite.js" defer></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>
	
	<link rel="stylesheet" href="../../css/adminstilvorlage.css" />
	
	<title>Spielekonfigurator</title>
</head>
<body>

	<header>
		<h1>Spielekonfigurator</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	
	<main>
		<ul>
			<li><a href="${pageContext.request.contextPath}/html/verwaltungsseiten/bildBearbeiten.jsp">Bild bearbeiten</a></li>
			<li><a href="${pageContext.request.contextPath}/AlleBilderAnzeigenServlet">Bilder Anzeigen</a></li>
			<li><a href="${pageContext.request.contextPath}/html/verwaltungsseiten/bildHochladenFertig.jsp">Bild hochladen</a></li>
		</ul>
	</main>
	
	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
	
</body>

</html>