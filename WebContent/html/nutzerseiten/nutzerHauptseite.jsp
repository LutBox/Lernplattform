<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="../../css/nutzerseiten/nutzerHauptseiteStil.css" />
<script type="text/javascript" src="../../js/standard.js" defer></script>
<meta charset="UTF-8">
<title>Nutzerbereich</title>
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
		<main class="flexitem">
			<div id="nutzerkarte">
				<div class="karteninhalt">
					<h2 class="nutzername zentriert">- ${nutzer.name} -</h2>
				</div>
				<div class="karteninhalt">
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
		<aside class="flexitem">
			<h2>Bestenliste:</h2>
			<br>
			<div id="spieleBeschreibung"></div>
		</aside>
	</div>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>