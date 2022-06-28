<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Newsroom</title>
<link rel="stylesheet"
	href="../../css/verwaltungsseiten/newsroomStil.css" />
<script type="text/javascript"
	src="../../js/verwaltungsskripte/newsroom.js"></script>
<script type="text/javascript" src="../../js/standard.js" defer></script>
</head>
<body>
	<%@include file="../jspf/aktuellerNutzer.jspf"%>
	<header>
		<h1>Newsroom</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<div class="rand"></div>
		<div id="display" class="fade-in">
			<c:forEach items="${neuigkeiten}" var="neuigkeit">
				<div class="neuigkeit">
					<p class="nachrichttext">
						<c:out value="${neuigkeit.nachricht}"></c:out>
					</p>
					<p class="zeitstempel">
						<c:out value="${neuigkeit.zeitstempel}"></c:out>
					</p>
					<form class="editierenform"
						action="../../NeuigkeitEditierenServlet">
						<input type="hidden" class="zueditierendeNeuigkeitNummer"
							value="${neuigkeit.nnr}" /> <input type="hidden"
							class="zennachricht" value="${neuigkeit.nachricht}" />
						<button class="editierenButton noStandardButton" type="button"
							title="Klicken um Neuigkeit zu editieren">
							<img class="buttonImg"
								src="../../bilder/verwaltung/bearbeiten.png" alt="Bearbeiten" />
						</button>
					</form>
					<form class="loeschenform" action="../../NeuigkeitLoeschenServlet">
						<input class="zlnnr" type="hidden" value="${neuigkeit.nnr}" />
						<button class="neuigkeitLoeschenButton noStandardButton"
							type="button" title="Klicken um Post zu löschen">
							<img class="buttonImg"
								src="../../bilder/verwaltung/entfernen.png" alt="Löschen" />
						</button>
					</form>
					<br />
					<hr class="neuigkeitentrenner" />
					<br />
				</div>
			</c:forEach>
		</div>
		<div id="neuAnlegenMaske" class="fade-in">
			<form method="POST" action="../../NeuigkeitEinstellenServlet"
				accept-charset="UTF-8">
				<label for="neuigkeitNeu">Neuigkeit einstellen</label>
				<textarea id="neuigkeitNeu" name="neuigkeitNeu" rows="4" cols="30"
					placeholder="Was ist neu?"
					title="Bitte geben sie hier eine Neuigkeiten ein." required></textarea>
				<button id="postenButton" type="button">Posten</button>
				<button id="postenAbbrButton" type="button">Abbrechen</button>
			</form>
		</div>
		<div id="aktualisierenMaske" class="fade-in">
			<form method="POST" action="../../NeuigkeitAktualisierenServlet"
				accept-charset="UTF-8">
				<input id="zennr" name="zennr" type="hidden"
					value="${zueditierendeNeuigkeit.nnr}" /> <label
					for="neuigkeitAktualisiert">Neuigkeit Aktualisieren</label>
				<textarea id="neuigkeitAktualisiert" name="neuigkeitAktualisiert"
					rows="4" cols="30"
					title="Bitte geben sie hier die aktualisierte Neuigkeiten ein."
					required></textarea>
				<button id="aktualisierenButton" type="button">Aktualisieren</button>
				<button id="aktualisierenAbbrButton" type="button">Abbrechen</button>
			</form>
		</div>
		<button id="neuAnlegenButton" type="button"
			class="noStandardButton fade-in"
			title="Klicken um einen neuen, öffentlichen Post zu verfassen.">
			<img class="buttonImg" src="../../bilder/verwaltung/hinzufuegen.png"
				alt="Neuen Post verfassen" />
		</button>
		<div id="maskenvorhang"></div>
		<button type="button" class="goToTopButton noStandardButton fade-in"
			id="goToTopButton"
			title="Klicken um zum Seitenanfang zurück zu springen.">
			<img class="buttonImg" src="../../bilder/verwaltung/goToTopIcon.png"
				alt="Zum Seitenanfang springen" />
		</button>
		<div class="rand"></div>
	</main>
	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
	<%@include file="../jspf/noSkript.jspf"%>
</body>
</html>