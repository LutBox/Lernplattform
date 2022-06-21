<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../../css/nutzerseiten/registrierenStil.css" />
<script type="text/javascript"
	src="../../js/nutzerskripte/profilkonfiguraration.js" defer></script>
<script type="text/javascript"
	src="../../js/cookiemonster.js" defer></script>
<%@include file="../jspf/noSkript.jspf"%>
<meta charset="UTF-8">
<title>Registrierung</title>
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
						maxlength="96" required="required" pattern="[A-Za-z0-9_]+"
						title="Bitte geben Sie einen Nutzernamen an (Maximal 96 Zeichen, A-Z, a-z, 0-9)." />
					<!-- vgl. w3schools https://www.w3schools.com/tags/att_input_pattern.asp END -->
				</div>
				<div class="inputfeld">
					<label for="email">E-Mail:</label> <input name="email" id="email"
						type="email" value="${anfrage.email}" placeholder="e-mail"
						maxlength="64" required="required"
						title="Bitte geben Sie ihre E-Mail an" />
				</div>
				<div class="inputfeld">
					<label for="passwort">Passwort:</label> <input name="passwort"
						id="passwort" type="password" maxlength="96" required="required"
						value="${anfrage.passwort}" placeholder="*******" pattern="[^ ]+"
						title="Bitte geben Sie Ihr gewünschtes Passwort an (Maximal 96 Zeichen)." />
				</div>
				<div class="inputfeld">
					<label for="passwort2">Passwort wiederholen:</label> <input
						name="passwort2" id="passwort2" type="password" maxlength="64"
						required="required" placeholder="*******"
						value="${anfrage.passwort}" required="required" pattern="[^ ]+"
						title="Bitte wiederholen Sie Ihr Passwort" />
				</div>
				<div class="inputfeld">
					<label for="profilbild">Profilbild hochladen:</label> <input
						type="file" name="profilbild" id="profilbild" accept="image/*"
						title="Bitte laden Sie hier Ihr Profilbild hoch" />
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
</body>
</html>