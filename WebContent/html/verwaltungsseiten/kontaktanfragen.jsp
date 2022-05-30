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
<title>Kontaktanfragen</title>
<link rel="stylesheet" href="../../css/adminstilvorlage.css" />
</head>
<body>
	<header>
		<h1>Kontaktanfragen</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<h1>Kontaktanfragen</h1>
		<table border="solid">
			<thead>
				<tr>
					<th>Gelesen</th>
					<th>Name</th>
					<th>Adresse</th>
					<th>MSG</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox" /></td>
					<td>nutzernameX</td>
					<td>nutzer@mail.com</td>
					<td>msg</td>
					<td><a href="#">Antworten</a></td>
				</tr>
			</tbody>
		</table>
	</main>
		<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>