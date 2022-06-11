<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../css/nutzerseiten/registrierenStil.css" />
<script type="text/javascript"
	src="../../js/standard.js" defer></script>
	<script type="text/javascript"
	src="../../js/passwortkontrolle.js" defer></script>
<title>Registrierung</title>
</head>
<body>
	<header>
		<h1>Lernplattform</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<form id="registrierungform" method="post" action="../../RegistrierungServlet" enctype="multipart/form-data">
			<fieldset>
				<legend>Registrierung</legend>
				<div>
					<label for="name">Nutzername: </label> <input name="name" id="name"
						type="text" placeholder="Nutzername" maxlength="96"
						required="required" title="Bitte geben Sie ihren Nutzernamen an (Maximal 96 Zeichen)."/>
						<span></span>
				</div>
				<div>
					<label for="email">E-Mail:</label> <input name="email" id="email"
						type="email" value="${anfrage.email}" placeholder="e-mail"
						maxlength="64" required="required" title="Bitte geben Sie ihre E-Mail an"/>
					<span></span>
				</div>
				<div>
					<label for="passwort">Passwort:</label> <input name="passwort"
						id="passwort" type="password" maxlength="96" required="required"
						value="${anfrage.passwort}" placeholder="*******" title="Bitte geben Sie ihr Passwort an (Maximal 96 Zeichen)."/>
					<span></span>
				</div>
				<div>
					<label for="passwort2">Passwort wiederholen:</label>
				</div>
				<div>
					<input name="passwort2" id="passwort2" type="password"
						maxlength="64" required="required" placeholder="*******"
						value="${anfrage.passwort}" required="required" title="Bitte wiederholen Sie ihr Passwort" />
					<span></span>
				</div>
				<div>
					<label for="profilbild">Profilbild hochladen:</label> <input
						type="file" name="profilbild" id="profilbild" accept="image/*" title="Bitte laden Sie hier ihr Profilbild hoch"/>
				</div>
				<div>

					<button id="absenden" type="submit">Absenden</button>
					<button type="reset">Zurücksetzen</button>
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