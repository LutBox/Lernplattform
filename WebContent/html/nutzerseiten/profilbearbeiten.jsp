<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../../css/nutzerseiten/profilbearbeitenStil.css" />
<script type="text/javascript"
	src="../../js/nutzerskripte/profilkonfiguraration.js" defer></script>
<%@include file="../jspf/noSkript.jspf"%>
<title>Profil bearbeiten</title>
</head>
<body>
	<header>
		<h1>Profil bearbeiten</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main class="fade-in">
		<form id="profilkonfigurationsform" method="post"
			action="../../ProfilAktualisierenServlet"
			enctype="multipart/form-data" accept-charset="UTF-8">
			<fieldset>
				<legend>Profil bearbeiten</legend>
				<div class="inputfeld">
					<label for="neuerName">Neuer Nutzername: </label> <input
						name="neuerName" id="neuerName" type="text"
						placeholder="Neuer Nutzername" maxlength="64"
						value="${nutzer.name}" pattern="[A-Za-z0-9_]+"
						title="Bitte geben Sie Ihren neuen Nutzernamen an (Maximal 96 Zeichen, A-Z, a-z, 0-9)." />
				</div>
				<div class="inputfeld">
					<label for="email">Neue E-Mail:</label> <input name="neueEmail"
						id="neuEmail" type="email" value="${nutzer.email}"
						placeholder="e-mail" maxlength="64"
						title="Bitte geben Sie Ihre neue E-mail an." />
				</div>
				<div class="inputfeld">
					<label for="passwort">Neues Passwort:</label> <input
						name="passwort" id="neuesPasswort" type="password" maxlength="128"
						title="Bitte geben Sie Ihr neues Passwort an." />
				</div>
				<div class="inputfeld">
					<label for="passwort2">Neues Passwort wiederholen:</label> <input
						name="passwort2" id="passwort2" type="password" maxlength="128"
						title="Bitte wiederholen Sie ihr neues Passwort an" />
				</div>
				<div class="inputfeld">
					<label for="profilbild">Profilbild hochladen:</label> <input
						type="file" name="neuesProfilbild" id="neuesProfilbild"
						accept="image/*"
						title="Bitte laden Sie hier ihr neues Profilbild hoch" />
				</div>
				<div class="buttonbox inputfeld">
					<button type="submit">Absenden</button>
					<button type="reset">Zurücksetzen</button>
					<a class="buttonLink" href="./nutzerHauptseite.jsp">Abbrechen</a>
				</div>
			</fieldset>
		</form>
		<div id="infotext">
			<span id="infoicon">&#9432; </span><span class="fade-in"><c:out
					value="${forminfotext}" default="Bitte geben Sie Ihre Daten an." /></span>
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>