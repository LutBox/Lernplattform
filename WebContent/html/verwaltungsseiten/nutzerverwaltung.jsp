<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/verwaltungsseiten/nutzerverwaltungStil.css" />
<title>Nutzerverwaltung</title>
</head>
<body>
	<header>
		<h1>Nutzerverwaltung</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main class="fade-in">
		<div id="suche">
			<form id="nutzersucheform" method="post" action="../../NutzerSucheServlet">
				<fieldset>
					<legend>Nutzersuche</legend>
					<div>
						<label for="fragment">Name:</label> <input id="fragment"
							name="fragment" type="text" required="required" pattern="[^ ]+"
							title="Fragment eines Nutzernamens" />
					</div>
					<label>Anzahl der Ergebnisse: </label>
					<div class="option">
						<label for="10ergebnisse">10</label> <input type="radio"
							name="anzahlErgebnisse" value="10" id="10ergebnisse"
							required="required" title="Maximal 10 Suchergebnisse" />
					</div>
					<div class="option">
						<label for="100ergebnisse">100</label> <input type="radio"
							name="anzahlErgebnisse" value="100" id="100ergebnisse"
							title="Maximal 100 Suchergebnisse" />
					</div>
					<div class="option">
						<label for="250ergebnis">250</label> <input type="radio"
							name="anzahlErgebnisse" id="250ergebnis" value="250"
							title="Maximal 250 Suchergebnisse" />
					</div>
					<div>
						<button type="submit">Suchen</button>
					</div>
				</fieldset>
			</form>
		</div>
		<div id="suchergebnisse">
		<c:forEach var="nutzer" items="${suchergebnisse}">
		
		</c:forEach>
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>