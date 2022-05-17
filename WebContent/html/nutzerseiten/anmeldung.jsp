<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Anmeldung</title>
</head>
<body>
	<header>
		<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>
	</header>
	<h1>Anmeldung</h1>
	<form method="POST" action="../../AnmeldungServlet">
		<label for="name">Nutzername: </label>
		<br/><input name="name" id="name" type="text" placeholder="Nutzername" maxlength="64" required="required"><c:out value="${name}" default=""/></input>
		<br/><label for="passwort">Passwort: </label>
		<br><input name="passwort" id="passwort" type="password" maxlength="128" required="required"></input>
		<br/><br/><c:out value="${anmeldunginfotext}" default="Bitte geben sie ihre Anmeldedaten an."/>
		<br/><button type="submit">Absenden</button>
		<br/>
		<br><button type="reset">Zurücksetzen</button>
	</form>
</body>
</html>