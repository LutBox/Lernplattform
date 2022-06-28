<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Registrierung</title>
<link rel="stylesheet" type="text/css"
	href="../../css/nutzerseiten/registrierenStil.css" />
<script type="text/javascript"
	src="../../js/nutzerskripte/profilkonfiguraration.js" defer></script>
<script type="text/javascript" src="../../js/cookiemonster.js" defer></script>
</head>
<body>
	<header>
		<h1>Lernplattform</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main class="fade-in">
		<form id="profilkonfigurationsform" method="post"
			action="../../RegistrierungServlet" enctype="multipart/form-data"
			accept-charset="UTF-8">
			<fieldset>
				<legend>Registrierung</legend>
				<div class="inputfeld">
					<label for="name">Nutzername: </label>
					<!-- vgl. w3schools https://www.w3schools.com/tags/att_input_pattern.asp START -->
					<input name="name" id="name" type="text" placeholder="Nutzername"
						maxlength="64" pattern="[A-Za-z0-9_]+"
						title="Bitte geben Sie einen Nutzernamen an (Maximal 96 Zeichen, A-Z, a-z, 0-9)."
						required />
					<!-- vgl. w3schools https://www.w3schools.com/tags/att_input_pattern.asp END -->
				</div>
				<div class="inputfeld">
					<label for="email">E-Mail:</label> <input name="email" id="email"
						type="email" value="${anfrage.email}" placeholder="e-mail"
						maxlength="64" title="Bitte geben Sie ihre E-Mail an" required />
				</div>
				<div class="inputfeld">
					<label for="passwort">Passwort:</label> <input name="passwort"
						id="passwort" type="password" maxlength="128"
						value="${anfrage.passwort}" placeholder="*******" pattern="[A-Za-z0-9_]+"
						title="Bitte geben Sie Ihr gewünschtes Passwort an (Maximal 96 Zeichen, A-Z, a-z, 0-9)."
						required />
				</div>
				<div class="inputfeld">
					<label for="passwort2">Passwort wiederholen:</label> <input
						name="passwort2" id="passwort2" type="password" maxlength="128"
						placeholder="*******" value="${anfrage.passwort}" pattern="[A-Za-z0-9_]+"
						title="Bitte wiederholen Sie Ihr Passwort" required />
				</div>
				<div class="inputfeld">
					<label for="neuesProfilbild">Profilbild hochladen:</label> <input
						type="file" name="neuesProfilbild" id="neuesProfilbild"
						accept="image/*" title="Bitte laden Sie hier Ihr Profilbild hoch" />
				</div>
				<div class="buttonbox inputfeld">
					<button id="absenden" type="submit">Absenden</button>
					<button type="reset">Zurücksetzen</button>
				</div>
			</fieldset>
		</form>
		<div id="infotext">
			<span id="infoicon">&#9432; </span><span class="fade-in"> <c:out
					value="${forminfotext}" default="Bitte geben Sie Ihre Daten an." />
			</span>
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
	<%@include file="../jspf/cookiemonster.jspf"%>
	<%@include file="../jspf/noSkript.jspf"%>
</body>
</html>