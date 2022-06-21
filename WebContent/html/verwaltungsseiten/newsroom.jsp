<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="../../css/verwaltungsseiten/newsroomStil.css" />
<script type="text/javascript"
	src="../../js/verwaltungsskripte/newsroom.js"></script>
<script type="text/javascript" src="../../js/standard.js" defer></script>
<%@include file="../jspf/noSkript.jspf"%>
<meta charset="UTF-8">
<title>Newsroom</title>
</head>
<body>
	<header>
		<h1>Newsroom</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<div class="rand"></div>
		<div id="display" class="fade-in">
			<c:forEach items="${neuigkeiten}" var="neuigkeit">
				<div class="neuigkeit">
					<p>
						<c:out value="${neuigkeit.nachricht}"></c:out>
					</p>
					<p>
						<c:out value="${neuigkeit.zeitstempel}"></c:out>
					</p>
					<form action="../../NeuigkeitEditierenServlet">
						<input type="hidden" name="zennr" value="${neuigkeit.nnr}" />
						<button class="editierenButton noStandardButton" type="button">
							<img class="buttonImg"
								src="../../bilder/verwaltung/bearbeiten.png" />
						</button>
					</form>
					<form class="loeschenform" action="../../NeuigkeitLoeschenServlet">
						<input class="zlnnr" type="hidden" name="zlnnr"
							value="${neuigkeit.nnr}" />
						<button class="neuigkeitLoeschenButton noStandardButton"
							type="button" titel="Klicken um Post zu löschen">
							<img class="buttonImg"
								src="../../bilder/verwaltung/entfernen.png" />
						</button>
					</form>
				</div>
			</c:forEach>
		</div>
		<div id="neuAnlegenMaske" class="fade-in">
			<form method="POST" action="../../NeuigkeitEinstellenServlet"
				accept-charset="UTF-8">
				<legend>News neu anlegen</legend>
				<label for="neuigkeitNeu">Neuigkeit</label>
				<textarea id="neuerPost" name="neuigkeitNeu" rows="4" cols="30"
					placeholder="Was ist neu?"
					titel="Bitte geben sie hier Neuigkeiten ein." required></textarea>
				<button id="postenButton" type="button">Posten</button>
				<button id="postenAbbrButton" type="button">Abbrechen</button>
			</form>
		</div>
		<div id="aktualisierenMaske" class="fade-in">
			<form method="POST" action="../../NeuigkeitAktualisierenServlet"
				accept-charset="UTF-8">
				<legend>News aktualisieren</legend>
				<input name="zennr" type="hidden"
					value="${zueditierendeNeuigkeit.nnr}" /> <label
					for="neuigkeitAktualisiert">Neuigkeit</label>
				<textarea id="neuigkeitAktualisiert" name="neuigkeitAktualisiert"
					rows="4" cols="30" titel="Bitte geben sie hier Neuigkeiten ein."
					required>${zueditierendeNeuigkeit.nachricht}</textarea>
				<button id="aktualisierenButton" type="button">Aktualisieren</button>
				<button id="aktualisierenAbbrButton">Aktualisierung
					Abbrechen</button>
			</form>
		</div>
		<button id="neuAnlegenButton" type="button"
			title="Klicken um einen neuen, öffentlichen Post zu verfassen.">News
			anlegen</button>
		<div id="maskenvorhang"></div>
		<button type="button" class="goToTopButton" id="goToTopButton"
			titel="Klicken um zum Seitenanfang zurück zu springen.">Seitenanfang</button>
		<div class="rand"></div>
	</main>
	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>