<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Suchergebnisse</title>
</head>
<body>
	<header>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<h1>Suchergebnisse</h1>
		<table border="solid">
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Passwort</th>
				<th>Punkte</th>
				<th>Status</th>
				<th>Bearbeiten</th>
			</tr>
			<c:forEach items="${suchergebnisse}" var="ergebnis">
				<tr>
					<td>${ergebnis.name}</td>
					<td>${ergebnis.email}</td>
					<td>${ergebnis.passwort}</td>
					<td>${ergebnis.punkte}</td>
					<td><c:if test="${ergebnis.admin==0}">Nutzer</c:if> <c:if
							test="${ergebnis.admin==1}">Admin</c:if></td>
					<td><a href="./nutzeraktualisieren.jsp">bearbeiten</a></td>
				<tr />
			</c:forEach>
		</table>
	</main>
</body>
</html>