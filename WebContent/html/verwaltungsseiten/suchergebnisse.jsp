<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/spieleseiten/spielehauptseite.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/spielehauptseite.js" defer></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/standard.js" defer></script>
<title>Suchergebnisse</title>
<link rel="stylesheet" href="../../css/adminstilvorlage.css" />
</head>
<body>
	<header>
		<h1>Suchergebnisse</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<h1>Suchergebnisse</h1>
		<table border="solid">
			<tr>
				<th></th>
				<th>Name</th>
				<th>Email</th>
				<th>Passwort</th>
				<th>Nutzerart</th>
				<th>Punkte</th>
				<th>Punkte</th>
				<th>Punkte</th>
				<th>Punkte</th>
				<th>Punkte</th>
				<th>Bearbeiten</th>
				<th>Löschen</th>
			</tr>
			<c:forEach items="${suchergebnisse}" var="ergebnis">
				<tr>
					<td><img
						src="../../ProfilbildLadenServlet?nn=${ergebnis.name}" /></td>
					<td>${ergebnis.name}</td>
					<td>${ergebnis.email}</td>
					<td>${ergebnis.passwort}</td>
					<td><c:if test="${ergebnis.admin==0}">Nutzer</c:if> <c:if
							test="${ergebnis.admin==1}">Admin</c:if></td>
					<td>${ergebnis.punkteBilderMemorie}</td>
					<td>${ergebnis.punkteBilderOrdnen}</td>
					<td>${ergebnis.punkteBilderBilderWort}</td>
					<td>${ergebnis.punkteMathe}</td>
					<td>${ergebnis.punkteJumpnrun}</td>
					<td><form method="post"
							action="../../NutzerBearbeitenServlet?nn=${ergebnis.name}">
							<button>Bearbeiten</button>
						</form></td>
					<td>
						<form method="post"
							action="../../NutzerLoeschenServlet?zuloeschenderNutzer=${ergebnis.name}">
							<button>Löschen</button>
						</form>
					</td>
				<tr />
			</c:forEach>
		</table>
	</main>
		<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>