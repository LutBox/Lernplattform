<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nutzerverwaltung</title>
</head>
<body>
	<header>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<h1>Nutzerverwaltung</h1>
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
</body>
</html>