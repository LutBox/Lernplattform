<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../../css/verwaltungsseiten/suchergebnisseStil.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/standard.js" defer></script>
<title>Suchergebnisse</title>
</head>
<body>
	<header>
		<h1>Suchergebnisse</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<div class="row">
			<div class="grid12">
				<h2>
					Suche: "<em>${fragment}</em>"
				</h2>
			</div>
		</div>
		<c:forEach items="${suchergebnisse}" var="ergebnis">
			<div class="row">
				<div class="grid1"></div>
				<div class="grid10 suchergebnis">
					<div class="grid1 vertikal-zentriert">
						<img class="profilbild"
							src="../../ProfilbildLadenServlet?nn=${ergebnis.name}" />
					</div>
					<div class="grid8">
						<p>
							<span class="beschreibung">Name: </span>${ergebnis.name}<br /> <span
								class="beschreibung">E-Mail: </span>${ergebnis.email}<br /> <span
								class="beschreibung">Passwort: </span>${ergebnis.passwort}<br />
							<span class="beschreibung">Status: </span>
							<c:if test="${ergebnis.admin==0}">Nutzer</c:if>
							<c:if test="${ergebnis.admin==1}">Admin</c:if>
						</p>
					</div>
					<div class="grid2">
						Memory: ${ergebnis.punkteBilderMemorie}<br /> Ordnen:
						${ergebnis.punkteBilderOrdnen}<br />Bilder:
						${ergebnis.punkteBilderBilderWort}<br /> Mathe:
						${ergebnis.punkteMathe}<br />JNR: ${ergebnis.punkteJumpnrun}
					</div>
					<div class="grid1">
						<form method="post">
							<input type="hidden" name="nn" value="${ergebnis.name}" />
							<button class="noStandardButton"
								formaction="../../NutzerBearbeitenServlet">
								<img class="buttonImg"
									src="../../bilder/verwaltung/bearbeiten.png" />
							</button>
							<input type="hidden" name="zuloeschenderNutzer"
								value="${ergebnis.name}" />
							<button class="noStandardButton"
								formaction="../../NutzerLoeschenServlet">
								<img class="buttonImg"
									src="../../bilder/verwaltung/entfernen.png" />
							</button>
						</form>
					</div>
				</div>
				<div class="grid1"></div>
			</div>
		</c:forEach>
		<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
		<div class="row">
			<div class="grid12"></div>
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>