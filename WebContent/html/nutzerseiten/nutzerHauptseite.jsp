<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../../css/nutzerseiten/nutzerHauptseiteStil.css" />
	<script type="text/javascript" src="../../js/keinProfilbild.js" defer></script>
	<script type="text/javascript"
	src="../../js/cookiemonster.js" defer></script>
	<%@include file="../jspf/noSkript.jspf"%>
	<meta charset="UTF-8">
	<title>Nutzerbereich</title>
</head>
<body>
	<header>
		<h1>Nutzerbereich</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<div id="flexarea">
		<aside class="flexitem fade-in">
			<h2>Top-News</h2>
			<c:forEach items="${neuigkeiten}" var="neuigkeit">
				<div class="neuigkeit">
					<p>
						<c:out value="${neuigkeit.nachricht}"></c:out>
					</p>
					<p class="zeitstempel">
						<c:out value="${neuigkeit.zeitstempel}"></c:out>
					</p>
					<br/>
					<hr class="neuigkeitentrenner"/>
					<br/>
				</div>
			</c:forEach>
		</aside>
		<main class="flexitem fade-in">
			<div id="nutzerkarte">
				<div>
					<h2 class="nutzername zentriert">- <c:out value="${nutzer.name}"></c:out> -</h2>
				</div>
				<div>
					<img class="profilbild"
						src="../../ProfilbildLadenServlet?nn=${nutzer.name}" />
				</div>
				<div class="karteninhalt">
					<p class="email zentriert">${nutzer.email}</p>
				</div>
			</div>
			<div id="punktestaende" class="zentriert">
				<table>
					<thead>
						<tr>
							<th class="topleft">Mathe</th>
							<th>4 Bilder 1 Wort</th>
							<th>Bilder ordnen</th>
							<th>Bildermemorie</th>
							<th class="topright">Jump N Run</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="bottomleft">${nutzer.punkteMathe}</td>
							<td>${nutzer.punkteBilderBilderWort}</td>
							<td>${nutzer.punkteBilderOrdnen}</td>
							<td>${nutzer.punkteBilderMemorie}</td>
							<td class="bottomright">${nutzer.punkteJumpnrun}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</main>
		<aside class="flexitem fade-in">
			<h2>Bestenliste:</h2>
			<br>
			<div id="spieleBeschreibung"></div>
		</aside>
	</div>
	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
	<%@include file="../jspf/cookiemonster.jspf"%>
</body>
</html>