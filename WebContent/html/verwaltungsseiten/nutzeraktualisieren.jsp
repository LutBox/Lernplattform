<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Nutzer aktualisieren</title>
<link rel="stylesheet" type="text/css"
	href="../../css/verwaltungsseiten/nutzeraktualisierenStil.css" />
<script type="text/javascript"
	src="../../js/verwaltungsskripte/nutzerkonfiguration.js" defer></script>
<%@include file="../jspf/noSkript.jspf"%>
</head>
<body>
	<header>
		<h1>Nutzerverwaltung</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main class="fade-in">
		<div id="maincontainer">
			<form id="nutzerkonfigurationsform" method="post"
				action="../../NutzerAktualisierenServlet"
				enctype="multipart/form-data" accept-charset="UTF-8">
				<fieldset>
					<legend>Nutzer aktualisieren</legend>
					<div class="inputfeld">
						<label for="neuerName">Neuer Nutzername</label> <input
							name="neuerName" id="neuerName" type="text"
							placeholder="Neuer Nutzername" maxlength="64"
							pattern="[A-Za-z0-9_]+" value="${zuverwaltendernutzer.name}"
							title="Bitte geben Sie den neuen Name für den Nutzer an  (Maximal 64 Zeichen, A-Z, a-z, 0-9)."
							required />
					</div>
					<div class="inputfeld">
						<label for="neueEmail">Neue E-Mail</label> <input name="neueEmail"
							id="neueEmail" type="email" value="${zuverwaltendernutzer.email}"
							placeholder="e-mail" maxlength="64"
							title="Bitte geben Sie die neue E-Mail des Nutzers an" required />
					</div>
					<div class="inputfeld">
						<label for="neuesPasswort">Neues Passwort</label> <input
							name="passwort" id="neuesPasswort" type="text" maxlength="128"
							value="${zuverwaltendernutzer.passwort}" pattern="[A-Za-z0-9_]+"
							title="Bitte geben Sie das neue Passwort des Nutzers an (Maximal 128 Zeichen, A-Z, a-z, 0-9)."
							required />
					</div>
					<div class="inputfeld">
						<label for="passwort2">Neues Passwort wiederholen</label> <input
							name="passwort2" id="passwort2" type="text" maxlength="128"
							value="${zuverwaltendernutzer.passwort}"
							title="Bitte wiederholen Sie das neue Passwort des Nutzers"
							required />
					</div>
					<div class="inputfeld">
						<label>Status</label><input type="hidden" id="aktuellerstatus"
							value="${zuverwaltendernutzer.admin}" /> <input type="radio"
							name="nutzerart" id="regnutzer" value="0"
							title="Den Nutzer als regulären Nutzer konfigurieren. Als regulärer Nutzer kann der Nutzer den vollen Spieleumfang genießen und an Wettkämpfen teilnehmen." /><label
							for="regnutzer">Nutzer</label> <input type="radio"
							name="nutzerart" value="1" id="administrator"
							title="Den Nutzer als Administrator konfigurieren. Als Administrator kann der Nutzer die anderen Nutzer sowie die Kontaktanfragen verwalten." /><label
							for="administrator">Admin</label>
					</div>
					<div class="inputfeld">
						<label for="neuesProfilbild">Profilbild hochladen</label> <input
							type="file" name="neuesProfilbild" id="neuesProfilbild"
							accept="image/*"
							title="Bitte laden Sie hier das neue Profilbild des Nutzers hoch" />
					</div>
					<div class="buttonbox inputfeld">
						<button id="absenden" type="submit">Absenden</button>
						<button type="reset">Zurücksetzen</button>
						<a class="buttonLink" href="./nutzerverwaltung.jsp">Abbrechen</a>
					</div>
				</fieldset>
			</form>
			<div id="infotext">
				<span id="infoicon">&#9432; </span><span class="fade-in"> <c:out
						value="${forminfotext}"
						default="Bitte geben Sie die neuen Nutzerdaten an." />
				</span>
			</div>
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>