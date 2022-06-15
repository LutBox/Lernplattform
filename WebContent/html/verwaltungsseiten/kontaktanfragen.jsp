<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../../css/verwaltungsseiten/kontaktanfragenStil.css" />
<script type="text/javascript" src="../../js/kontaktanfragen.js" defer></script>
<script type="text/javascript" src="../../js/standard.js" defer></script>
<%@include file="../jspf/noSkript.jspf"%>
<title>Kontaktanfragen</title>
</head>
<body>
	<header>
		<h1>Kontaktanfragen</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main class="fade-in">
		<div class="row">
			<p class="grid12">
				Sie haben:<br /> <em>${anzahlungelesene} </em>ungelesene
				Nachrichten <em>${anzahlarchivierte} </em>archivierte Nachrichten
			</p>
		</div>
		<div class="row">
			<div class="grid12">
				<h2>- Ungelesene Kontaktanfragen -</h2>
			</div>
		</div>
		<c:forEach items="${ungelesene}" var="nachricht">
			<div class="row fade-in">
				<div class="grid12 kontaktanfrage">
					<div class="grid3 email">${nachricht.email}</div>
					<div class="grid7 nachricht">${nachricht.nachricht}</div>
					<div class="grid2 knoepfe">
						<form method="post" action="../../UngelesenMarkierenServlet">
							<a class="buttonLink" href="mailto:${nachricht.email}"
								title="Antworten"><img class="buttonImg"
								src="../../bilder/verwaltung/antworten.png" /></a> <input
								type="hidden" name="kanr" value="${nachricht.kanr}" />
							<button class="noStandardButton" type="submit"
								title="Als ungelesen markieren">
								<img class="buttonImg"
									src="../../bilder/verwaltung/ungelesen.png" />
							</button>
						</form>
						<form class="loeschenformular" method="post"
							action="../../KontaktanfrageLoeschenServlet">
							<input type="hidden" name="kanr" value="${nachricht.kanr}" />
							<button class="noStandardButton" type="submit" title="Ungelesene Nachricht von ${nachricht.email} löschen">
								<img class="buttonImg"
									src="../../bilder/verwaltung/entfernen.png" />
							</button>
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
		<br />
		<div class="row">
			<div class="grid12">
				<h2>- Archivierte Kontaktanfragen -</h2>
			</div>
		</div>
		<c:forEach items="${archiviert}" var="nachricht">
			<div class="row">
				<div class="grid12 kontaktanfrage">
					<div class="grid3 email">${nachricht.email}</div>
					<div class="grid7 nachricht">${nachricht.nachricht}</div>
					<div class="grid2 rechtsausgerichtet">
						<form method="post" action="../../UngelesenMarkierenServlet">
							<a class="buttonLink" href="mailto:${nachricht.email}"
								title="Antworten"><img class="buttonImg"
								src="../../bilder/verwaltung/antworten.png" /></a> <input
								type="hidden" name="kanr" value="${nachricht.kanr}" />
							<button class="noStandardButton" type="submit"
								title="Als ungelesen markieren">
								<img class="buttonImg"
									src="../../bilder/verwaltung/ungelesen.png" />
							</button>
						</form>
						<form class="loeschenformular" method="post"
							action="../../KontaktanfrageLoeschenServlet">
							<input type="hidden" name="kanr" value="${nachricht.kanr}" />
							<button class="noStandardButton" type="submit" title="Archivierte Nachricht von ${nachricht.email} löschen">
								<img class="buttonImg"
									src="../../bilder/verwaltung/entfernen.png" />
							</button>
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
		<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>