<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css"
	href="../../css/nutzerseiten/registrierenStil.css" />
<script type="text/javascript" src="../../js/nutzeraenderung.js"
	charset="UTF-8" defer></script>
<%@include file="../jspf/noSkript.jspf"%>
<title>Registrierung</title>
</head>
<body>
	<header>
		<h1>Lernplattform</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main class="fade-in">
		<form id="aenderungsformular" method="post"
			action="../../RegistrierungServlet" enctype="multipart/form-data">
			<fieldset>
				<legend>Registrierung</legend>
				<div>
					<label for="name">Nutzername: </label>
					<!-- vgl. w3schools https://www.w3schools.com/tags/att_input_pattern.asp START -->
					<input name="name" id="name" type="text" placeholder="Nutzername"
						maxlength="96" required="required" pattern="[^ ]+"
						title="Bitte geben Sie einen Nutzernamen an (Maximal 96 Zeichen, ohne Leerzeichen)." />
					<!-- vgl. w3schools https://www.w3schools.com/tags/att_input_pattern.asp END -->
				</div>
				<div>
					<label for="email">E-Mail:</label> <input name="email" id="email"
						type="email" value="${anfrage.email}" placeholder="e-mail"
						maxlength="64" required="required"
						title="Bitte geben Sie ihre E-Mail an" />
				</div>
				<div>
					<label for="passwort">Passwort:</label> <input name="passwort"
						id="passwort" type="password" maxlength="96" required="required"
						value="${anfrage.passwort}" placeholder="*******" pattern="[^ ]+"
						title="Bitte geben Sie Ihr gewünschtes Passwort an (Maximal 96 Zeichen)." />
				</div>
				<div>
					<label for="passwort2">Passwort wiederholen:</label> <input
						name="passwort2" id="passwort2" type="password" maxlength="64"
						required="required" placeholder="*******"
						value="${anfrage.passwort}" required="required" pattern="[^ ]+"
						title="Bitte wiederholen Sie Ihr Passwort" />
				</div>
				<div>
					<label for="profilbild">Profilbild hochladen:</label> <input
						type="file" name="profilbild" id="profilbild" accept="image/*"
						title="Bitte laden Sie hier Ihr Profilbild hoch" />
				</div>
				<div class="buttonbox">
					<button id="absenden" type="submit">Absenden</button>
					<button type="reset">Zurücksetzen</button>
				</div>
			</fieldset>
		</form>
		<div id="infotext">
			<span id="infoicon">&#9432; </span><span class="fade-in"> <c:out
					value="${forminfotext}" default="Bitte geben sie ihre Daten an." />
			</span>
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>