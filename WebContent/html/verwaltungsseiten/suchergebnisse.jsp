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
	<h1>Suchergebnisse</h1>
	<table border="solid">
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Löschen</th>
			<th>Bearbeiten</th>
			<th>Zum Admin machen</th>
		</tr>
		<c:forEach items="${suchergebnisse}" var="ergebniss">
			<tr>
				<td>${ergebniss.name}
				<td>${ergebniss.email}</td>
				<td><a href="#">löschen</a></td>
				<td><a href="#">bearbeiten</a></td>
				<td><a href="#">zum Admin machen</a></td>
			<tr />
		</c:forEach>
	</table>
</body>
</html>