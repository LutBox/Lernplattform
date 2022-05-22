<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mitgliederbereich</title>
</head>
<body>
	<header>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<h1>Mitgliederbereich</h1>
		<div>
			<img src="../../ProfilbildLadenServlet?bildnr=${nutzer.bildnr}" />
			<br />Nutzername: ${nutzer.name} <br />Email: ${nutzer.email} <br />Punktestand:
			${nutzer.punkte} <br />Dateiname: ${nutzer.bildnr}
		</div>
		<div>
			<a href="../spieleseiten/spielehaupseite.jsp">Spieleübersicht</a>
		</div>
	</main>
</body>
</html>