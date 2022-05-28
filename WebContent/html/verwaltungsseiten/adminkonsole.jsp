<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spielehauptseite.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spielehauptseite.js" defer></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>
<title>Admin Konsole</title>
<link rel="stylesheet" href="../../css/adminstilvorlage.css" />
</head>
<body>
	<header>
		<h1>Administrator Konsole</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<p>Willkommen im Administratorbereich! Hier können sie die
			Spieleinhalte sowie die Nutzer verwalten.</p>
	</main>
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>