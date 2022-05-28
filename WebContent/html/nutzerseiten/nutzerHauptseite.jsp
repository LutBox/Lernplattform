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
<meta charset="UTF-8">
<title>Mitgliederbereich</title>
<link rel="stylesheet" href="../../css/adminstilvorlage.css" />
</head>
<body>
	<header>
		<h1>Nutzerbereich</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<div id="flexarea">
		<aside>
			<h2>Top-News</h2>
			<p>Forum-Threads</p>
		</aside>
		<main>
			<h1>Mitgliederbereich</h1>
			<div>
				<img src="../../ProfilbildLadenServlet?nn=${nutzer.name}" /> <br />Nutzername:
				${nutzer.name} <br />Email: ${nutzer.email}
			</div>
			<div>
				<a href="../spieleseiten/spielehaupseite.jsp">Spieleübersicht</a>
			</div>
		</main>
		<aside>
			<h2>Beschreibung:</h2>
			<br>
			<div id="spieleBeschreibung"></div>
		</aside>
	</div>
	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>