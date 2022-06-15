<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${suchergebnisse == null || empty suchergebnisse}">
		<div class="row">
			<div class="grid12">
				<p id="keineTreffer">Keine Treffer!</p>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="ergebnis" items="${suchergebnisse}" varStatus="status">
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
								<td><c:out value="${ergebnis.name}"></c:out>
								<td />
							</tr>
							<tr>
								<th class="beschreibung">E-Mail:</th>
								<td><c:out value="${ergebnis.email}"></c:out>
								<td />
							</tr>
							<tr>
								<th class="beschreibung">Passwort:</th>
								<td><c:out value="${ergebnis.passwort}"></c:out>
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
								<td><c:out value="${ergebnis.punkteBilderMemorie}"></c:out></td>
							<tr />
							<tr>
								<th>Ordnen</th>
								<td><c:out value="${ergebnis.punkteBilderOrdnen}"></c:out></td>
							<tr />
							<tr>
								<th>Bilder</th>
								<td><c:out value="${ergebnis.punkteBilderBilderWort}"></c:out></td>
							<tr />
							<tr>
								<th>Mathe</th>
								<td><c:out value="${ergebnis.punkteMathe}"></c:out></td>
							<tr />
							<tr>
								<th>JNR</th>
								<td><c:out value="${ergebnis.punkteJumpnrun}"></c:out></td>
							</tr>
						</table>
					</div>
					<div class="grid1">
						<form method="post" action="../../NutzerBearbeitenServlet">
							<input type="hidden" name="nn" value="${ergebnis.name}" />
							<button type="submit" class="noStandardButton" title="${ergebnis.name} bearbeiten">
								<img class="buttonImg"
									src="../../bilder/verwaltung/bearbeiten.png" />
							</button>
						</form>
						<form class="loeschenformular" method="post"
							action="../../NutzerLoeschenServlet">
							<input class="nutzerMitNameXLoeschen" type="hidden"
								 value="${ergebnis.name}" />
							<button type="button" class="noStandardButton" title="${ergebnis.name} löschen">
								<img class="buttonImg"
									src="../../bilder/verwaltung/entfernen.png" />
							</button>
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>

