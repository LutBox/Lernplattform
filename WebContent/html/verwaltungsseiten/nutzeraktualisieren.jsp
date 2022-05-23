<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Nutzer aktualisieren</title>
</head>
<body>
	<p>
		<a href="./admin_startseite.html">zur&uuml;ck zur Verwaltung</a>
	</p>
	<h1>Nutzer aktualisieren</h1>

	<form id="myForm" method="post" action="demo02servlet">
		<fieldset>
			<div class="eingabefeld">
					<label for="neuerName">Neuer Nutzername: </label> <br /> <input
						name="neuerName" id="neuerName" type="text"
						placeholder="Neuer Nutzername" maxlength="64"
						value="${zuverwaltendernutzer.name}" required="required" /> <br /> <label
						for="email">Neue E-Mail:</label> <br /> <input name="neueEmail"
						id="neuEmail" type="email" value="${zuverwaltendernutzer.email}"
						placeholder="e-mail" maxlength="64" /> <br /> <label
						for="neuesPasswort">Neues Passwort:</label> <br /> <input
						name="neuesPasswort" id="neuesPasswort" type="password"
						maxlength="128" value="${zuverwaltendernutzer.passwort}" required="required"
						title="Das Passwort muss mindestens 8 Zeichen lang, mindestens eine Ziffer, mindestens einen Großbuchstaben und mindestens einen Kleinbuchstaben beinhalten." />
					<br /> <label for="passwort2">Neues Passwort wiederholen:</label>
					<br> <input name="passwort2" id="passwort2" type="password"
						maxlength="128" titel="Die Passwörter müssen übereinstimmen."
						required="required" /> <br /> <label for="profilbild">Profilbild
						hochladen:</label> <br /> <input type="file" name="neuesProfilbild"
						id="neuesProfilbild" accept="image/*" required="required" />
				</div>
				<div class="infotext">
					<c:out value="${registrierunginfotext}"
						default="Bitte geben sie ihre Daten an." />
				</div>
				<div class="formularknopf">
					<button type="submit">Absenden</button>
					<br />
					<button type="reset">Zurücksetzen</button>
					<br /> <a href="./nutzerhauptseite.jsp">Abbrechen</a>
				</div>
		</fieldset>
	</form>
	<p>
		<a href="./suchergebnisse.jsp">zur&uuml;ck zu den Suchergebnissen</a>
		<a href="./adminkonsole.jsp">zur&uuml;ck zur Verwaltung</a>
	</p>
</body>
</html>