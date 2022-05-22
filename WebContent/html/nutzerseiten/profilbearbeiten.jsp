<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profil bearbeiten</title>
</head>
<body>
	<header>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<h1>Profil bearbeiten</h1>
		<form method="post" action="../../ProfilAktualisierenServlet"
			enctype="multipart/form-data">
			<fieldset>
				<div class="eingabefeld">
					<label for="name">Nutzername: </label> <br /> <input name="name"
						id="name" type="text" placeholder="Nutzername" maxlength="64"
						required="required" value="${nutzer.name}" /> <br /> <label for="email">E-Mail:</label>
					<br /> <input name="email" id="email" type="email"
						value="${nutzer.email}" placeholder="e-mail" maxlength="64"
						required="required"/> <br /> <label for="passwort">Passwort:</label>
					<br /> <input name="passwort" id="passwort" type="password"
						maxlength="128" required="required"
						title="Das Passwort muss mindestens 8 Zeichen lang, mindestens eine Ziffer, mindestens einen Großbuchstaben und mindestens einen Kleinbuchstaben beinhalten." />
					<br /> <label for="passwort2">Passwort wiederholen:</label> <br>
					<input name="passwort2" id="passwort2" type="password"
						maxlength="128" required="required"
						titel="Die Passwörter müssen übereinstimmen." /> <br /> <label
						for="profilbild">Profilbild hochladen:</label> <br /> <input
						type="file" name="profilbild" id="profilbild" accept="image/*" />
				</div>
				<div class="infotext">
					<c:out value="${registrierunginfotext}"
						default="Bitte geben sie ihre Daten an." />
				</div>
				<div class="formularknopf">
					<button type="submit">Absenden</button>
					<br />
					<button type="reset">Zurücksetzen</button>
				</div>
			</fieldset>
		</form>
	</main>
</body>
</html>