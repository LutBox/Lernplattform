<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../../css/verwaltungsseiten/suchergebnisseStil.css" />
<title>Suchergebnisse</title>
</head>
<body>
	<header>
		<h1>Suchergebnisse</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main class="fade-in">
		<div class="row fade-in">
			<div class="grid12">
				<h2>
					Suche: "<em>${fragment}</em>"
				</h2>
			</div>
		</div>
		<c:if test="${suchergebnisse == null}"><div class="platzhalter"><h3>Keine Nutzer gefunden!</h3></div></c:if>
		<c:forEach items="${suchergebnisse}" var="ergebnis">
			<div class="row">
				<div class="grid12 suchergebnis">
					<div class="grid1">
						<img class="profilbild"
							src="../../ProfilbildLadenServlet?nn=${ergebnis.name}" />
					</div>
					<div class="grid8">
						<table>
							<tr>
								<th class="beschreibung">Name:</th>
								<td>${ergebnis.name}
								<td />
							</tr>
							<tr>
								<th class="beschreibung">E-Mail:</th>
								<td>${ergebnis.email}
								<td />
							</tr>
							<tr>
								<th class="beschreibung">Passwort:</th>
								<td>${ergebnis.passwort}
								<td />
							</tr>
							<tr>
								<th class="beschreibung">Status:</th>
								<c:if test="${ergebnis.admin==0}">
									<td>Nutzer</td>
								</c:if>
								<c:if test="${ergebnis.admin==1}">
									<td>Admin</td>
								</c:if>
							</tr>
						</table>
					</div>
					<div class="grid2">
						<table>
							<tr>
								<th>Memory</th>
								<td>${ergebnis.punkteBilderMemorie}</td>
							<tr />
							<tr>
								<th>Ordnen</th>
								<td>${ergebnis.punkteBilderOrdnen}</td>
							<tr />
							<tr>
								<th>Bilder</th>
								<td>${ergebnis.punkteBilderBilderWort}</td>
							<tr />
							<tr>
								<th>Mathe</th>
								<td>${ergebnis.punkteMathe}</td>
							<tr />
							<tr>
								<th>JNR</th>
								<td>${ergebnis.punkteJumpnrun}</td>
							</tr>
						</table>
					</div>
					<div class="grid1">
						<form method="post" action="../../NutzerBearbeitenServlet">
							<input type="hidden" name="nn" value="${ergebnis.name}" />
							<button type="submit" class="noStandardButton">
								<img class="buttonImg"
									src="../../bilder/verwaltung/bearbeiten.png" />
							</button>
						</form>
						<form class ="loeschenformular" method="post"
							action="../../NutzerLoeschenServlet">
							<input type="hidden" name="zuloeschenderNutzer"
								value="${ergebnis.name}" />
							<button type="submit" class="noStandardButton">
								<img class="buttonImg"
									src="../../bilder/verwaltung/entfernen.png" />
							</button>
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>
