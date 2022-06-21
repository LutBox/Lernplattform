<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="../../css/verwaltungsseiten/nutzeraktualisierenStil.css" />
	<script type="text/javascript" src="../../js/verwaltungsskripte/nutzerkonfiguration.js" defer></script>
	<%@include file="../jspf/noSkript.jspf"%>
	<meta charset="UTF-8">
	<title>Nutzer aktualisieren</title>
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
							value="${zuverwaltendernutzer.name}"
							pattern="[A-Za-z0-9_^ &lt;&gt;&#34;']+"
							title="Bitte geben Sie den neuen Name für den Nutzer an  (Maximal 96 Zeichen, A-Z, a-z, 0-9)." />
					</div>
					<div class="inputfeld">
						<label for="neueEmail">Neue E-Mail</label> <input name="neueEmail"
							id="neueEmail" type="email" value="${zuverwaltendernutzer.email}"
							placeholder="e-mail" maxlength="64"
							title="Bitte geben Sie die neue E-Mail des Nutzers an" />
					</div>
					<div class="inputfeld">
						<label for="neuesPasswort">Neues Passwort</label> <input
							name="passwort" id="neuesPasswort" type="text" maxlength="128"
							value="${zuverwaltendernutzer.passwort}"
							title="Bitte geben Sie das neue Passwort des Nutzers an (Mindestens 96 Zeichen ohne Leerzeichen)." />
						<label for="passwort2">Neues Passwort wiederholen</label> <input
							name="passwort2" id="passwort2" type="text" maxlength="128"
							value="${zuverwaltendernutzer.passwort}"
							title="Bitte wiederholen Sie das neue Passwort des Nutzers" />
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
						<label for="neuesProfilbild">Profilbild hochladen</label> <input id="profilbildupload"
							type="file" name="neuesProfilbild" id="neuesProfilbild"
							accept="image/*"
							title="Bitte laden Sie hier das neue Profilbild des Nutzers hoch" />
					</div>
					<div class="buttonbox inputfeld">
						<button type="submit">Absenden</button>
						<button type="reset">Zurücksetzen</button>
						<a class="buttonLink" class="linkZuButton"
							href="./nutzerverwaltung.jsp">Abbrechen</a>
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