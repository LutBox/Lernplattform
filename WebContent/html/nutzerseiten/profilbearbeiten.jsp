<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../css/nutzerseiten/profilbearbeitenStil.css" />
<script type="text/javascript" src="../../js/standard.js" defer></script>
<title>Profil bearbeiten</title>
</head>
<body>
	<header>
		<h1>Profil bearbeiten</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<form method="post" action="../../ProfilAktualisierenServlet"
			enctype="multipart/form-data">
			<fieldset>
				<legend>Profil bearbeiten</legend>
				<div>
					<label for="neuerName">Neuer Nutzername: </label> <input
						name="neuerName" id="neuerName" type="text"
						placeholder="Neuer Nutzername" maxlength="64"
						value="${nutzer.name}" title="Bitte geben Sie ihren neuen Nutzernamen an"/>
				</div>
				<div>
					<label for="email">Neue E-Mail:</label> <input name="neueEmail"
						id="neuEmail" type="email" value="${nutzer.email}"
						placeholder="e-mail" maxlength="64" title="Bitte geben Sie ihre neue E-mail an"/>
				</div>
				<div>
					<label for="neuesPasswort">Neues Passwort:</label> <input
						name="neuesPasswort" id="neuesPasswort" type="password"
						maxlength="128" title="Bitte geben Sie ihr neues Passwort an"/>
				</div>
				<div>
					<label for="passwort2">Neues Passwort wiederholen:</label> <input
						name="passwort2" id="passwort2" type="password" maxlength="128" title="Bitte wiederholen Sie ihr neues Passwort an" />
				</div>
				<div>
					<label for="profilbild">Profilbild hochladen:</label> <input
						type="file" name="neuesProfilbild" id="neuesProfilbild"
						accept="image/*" title="Bitte laden Sie hier ihr neues Profilbild hoch"/>
				</div>
				<div></div>
				<div>
					<button type="submit">Absenden</button>

					<button type="reset">Zurücksetzen</button>
					<a class="buttonLink" href="./nutzerHauptseite.jsp">Abbrechen</a>
				</div>
			</fieldset>
		</form>
		<div id="infotext">
			<c:out value="${forminfotext}"
				default="Bitte geben sie ihre Daten an." />
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>