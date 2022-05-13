<%-- Erstellt von Merlin Weinthaler --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Registrierung</title>
</head>
<body>
	<header>
		<nav>
			<a href="../../index.jsp">Startseite</a>
			<a href="./anmeldung.jsp">Anmeldung</a>
		</nav>
	</header>
	<h1>Registrierung</h1>
	<form method ="post" action="../../RegistrierungServlet">
		<label for="name">Nutzername: </label>
		<br/><input name="name" id="name" type="text" placeholder="Nutzername" pattern="{3,64}" maxlength="64" required="required"><c:out value="${anfrage.name}" default=""/></input>
		<br/><label for="email">E-Mail: </label>
		<br><input name="email" id="email" type="email" placeholder="e-mail" pattern="{3,64}" maxlength="64" required="required"><c:out value="${anfrage.email}" default=""/></input>
		<br/><label for="passwort">Passwort: </label>
		<br><input name="passwort" id="passwort" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,128}" maxlength="128" required="required" title="Das Passwort muss mindestens 8 Zeichen lang, mindestens eine Ziffer, mindestens einen Großbuchstaben und mindestens einen Kleinbuchstaben beinhalten."></input>
		<br/><label for="passwort2">Passwort wiederholen: </label>
		<br><input name="passwort2" id="passwort2" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,128}" maxlength="128" required="required" titel="Die Passwörter müssen übereinstimmen."></input>
		<br/>
		<br/><button type="submit">Absenden</button>
		<br/>
		<br><button type="reset">Zurücksetzen</button>
	</form>
	<br/><c:out value="${registrierunginfotext}"/>
	<br/>
</body>
</html>