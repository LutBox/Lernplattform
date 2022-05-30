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
		<p>
			<span>${anzahlungelesene}</span> ungelesene Nachrichten<br /> <span>${anzahlarchivierte}</span>
			Nachrichten archiviert
		</p>
		<c:choose>
			<c:when test="${anzahlungelesene > 0}">
				<table>
					<thead>
						<tr>
							<th>Ungelesene Kontaktanfragen</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ungelesene}" var="nachricht">
							<tr>
								<td>Von: ${nachricht.email}</td>
								<td><a href="mailto:${nachricht.email}">Antworten</a></td>
								<td>
									<form method="post"
										action="../../GelesenMarkierenServlet?kanr=${nachricht.kanr}">
										<button type="submit">Als gelesen markieren</button>
									</form>
								</td>
								<td>
									<form method="post"
										action="../../KontaktanfrageLoeschenServlet?kanr=${nachricht.kanr}">
										<button type="submit">Löschen</button>
									</form>
								</td>
							</tr>
							<tr>
								<td>${nachricht.nachricht}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h1>Keine ungelesenen Nachrichten</h1>
			</c:otherwise>
		</c:choose>
		<table>
			<thead>
				<tr>
					<th>Archivierte Kontaktanfragen</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${archiviert}" var="nachricht">
					<tr>
						<td>Von: ${nachricht.email}</td>
						<td><a href="mailto:${nachricht.email}">Antworten</a></td>
						<td>
							<form method="post"
								action="../../GelesenMarkierenServlet?kanr=${nachricht.kanr}">
								<button type="submit">Als gelesen markieren</button>
							</form>
						</td>
						<td>
							<form method="post"
								action="../../KontaktanfrageLoeschenServlet?kanr=${nachricht.kanr}">
								<button type="submit">Löschen</button>
							</form>
						</td>
					</tr>
					<tr>
						<td>${nachricht.nachricht}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>