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
<title>Nutzerverwaltung</title>
<link rel="stylesheet" href="../../css/adminstilvorlage.css" />
</head>
<body>
	<header>
		<h1>Nutzerverwaltung</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<form method="post" action="../../NutzerSucheServlet">
			<fieldset>
				<label for="fragment">Suche:</label> <input id="fragment"
					name="fragment" type="text" required="required" /> <br /> <label>Anzahl
					der Ergebnisse: </label> <br />
				<label for="1ergebnis">1</label> <input type="radio"
					name="anzahlErgebnisse" id="1ergebnis" value="1" /><br />
				<label for="10ergebnisse">10</label> <input type="radio"
					name="anzahlErgebnisse" value="10" id="10ergebnisse" /><br />
				<label for="100ergebnisse">100</label> <input type="radio"
					name="anzahlErgebnisse" value="100" id="100ergebnisse" /> <br />
				<button type="submit">Suchen</button>
			</fieldset>
		</form>
	</main>
		<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>