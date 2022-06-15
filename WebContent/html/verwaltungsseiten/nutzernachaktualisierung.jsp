<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="../../css/verwaltungsseiten/nutzernachaenderungStil.css" />
<title>Nutzer aktualisiert</title>
</head>
<body>
	<header>
		<h1>Nutzer aktualisiert</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main class="fade-in">
		<div id="nutzerkarte">
			<div>
				<h2>Nutzer nach den durchgeführten Veränderungen</h2>
			</div>
			<div>
				<img id="profilbild" src="../../ProfilbildLadenServlet?nn=${veranderternutzer.name}" />
			</div>
			<div id="nutzername">${veranderternutzer.name}</div>
			<div id="email">${veranderternutzer.email}</div>
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>