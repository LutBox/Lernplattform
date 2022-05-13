<%-- Erstellt von Merlin Weinthaler --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Nutzer aktualisieren</title>
</head>
<body>
	<p><a href="./admin_startseite.html">zur&uuml;ck zur Verwaltung</a></p>
	<h1>Nutzer aktualisieren</h1>
	
	<form id="myForm" method="post" action="demo02servlet">
			<fieldset><legend>Benutzer aktualisieren</legend>
				<div>
				  <label for="benutzername">Benutzername:</label>
				  <input type="text" name="benutzername" id="Nachname" placeholder="Vorbelegung BN">
				</div>
				<div>
				  <label for="Nachname">Nachname:</label>
				  <input type="text" name="Nachname" id="name" placeholder="Vorbelegung NN">
				</div>
				<div>
				  <label for="vname">Vorname:</label>
				  <input type="text" name="vname" id="vname" placeholder="Vorbelegung VN">
				</div>
				<div>
				  <label for="passwort">Passwort:</label>
				  <input type="password" name="passwort" id="passwort" placeholder="Vorbelegung PW">
				</div>
				<div>
				  <input type="checkbox" name="reply" id="reply" value="reply">
				  <label for="reply">Benutzer informieren</label>
				</div>
				<div>
				  <button type="submit" name="absenden" value="absenden">Absenden</button>
				  <button type="reset" name="reset" value="reset">Zurücksetzen</button>
				</div>
			</fieldset>
		</form>
	
	<p><a href="./admin_startseite.html">zur&uuml;ck zur Verwaltung</a></p>
</body>
</html>