<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css" href="../../css/verwaltungsseiten/nutzeraktualisierenStil.css" />
<script type="text/javascript"
	src="../../js/standard.js" defer></script>
<title>Nutzer aktualisieren</title>
</head>

<body>
	<header>
		<h1>Nutzerverwaltung</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<form id="neueNutzerdatenFrom" method="post"
			action="../../NutzerAktualisierenServlet"
			enctype="multipart/form-data">
			<fieldset>
				<legend>Nutzer aktualisieren</legend>
				<div>
					<label for="neuerName">Neuer Nutzername: </label> <input
						name="neuerName" id="neuerName" type="text"
						placeholder="Neuer Nutzername" maxlength="64"
						value="${zuverwaltendernutzer.name}" title="Bitte geben Sie den neuen Nutzernamen an"/>
				</div>
				<div>
					<label for="neueEmail">Neue E-Mail:</label> <br /> <input
						name="neueEmail" id="neueEmail" type="email"
						value="${zuverwaltendernutzer.email}" placeholder="e-mail"
						maxlength="64" title="Bitte geben Sie die neue E-Mail des Nutzers an"/>
				</div>
				<div>
					<label for="neuesPasswort">Neues Passwort:</label> <input
						name="neuesPasswort" id="neuesPasswort" type="text"
						maxlength="128" value="${zuverwaltendernutzer.passwort}" title="Bitte geben Sie das neue Passwort des Nutzers an"/>
				</div>
				<div>
					<label for="passwort2">Neues Passwort wiederholen:</label> <input
						name="passwort2" id="passwort2" type="text" maxlength="128"
						value="${zuverwaltendernutzer.passwort}" title="Bitte wiederholen Sie das neue Passwort des Nutzers"/>
				</div>
				<div>
					<label for="regnutzer">Nutzer</label> <input type="radio"
						name="nutzerart" id="regnutzer" value="0" />
				</div>
				<div>
					<label for="administrator">Admin</label> <input type="radio"
						name="nutzerart" value="1" id="administrator" />
				</div>
				<div>
					<label for="neusProfilbild">Profilbild hochladen:</label> <input
						type="file" name="neuesProfilbild" id="neuesProfilbild"
						accept="image/*" title="Bitte laden Sie hier das neue Profilbild des Nutzers hoch"/>
				</div>
				<div>
					<button type="submit">Absenden</button>
					<button type="reset">Zurücksetzen</button>
					<a class="buttonLink" class="linkZuButton" href="./suchergebnisse.jsp">zur&uuml;ck zu den Suchergebnissen</a>
				</div>
			</fieldset>
		</form>
		<div id="infotext">
			<c:out value="${forminfotext}"
				default="Bitte geben sie die neuen Nutzerdaten an." />
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>

</html>