<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../../css/nutzerseiten/anmeldungStil.css" />
<script type="text/javascript" src="../../js/standard.js" defer></script>
<title>Anmeldung</title>
</head>
<body>
	<header>
		<h1>Lernplattform</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<form method="post" action="../../AnmeldungServlet">
			<fieldset>
				<legend>Anmeldung</legend>
				<div>
					<label for="name">Nutzername: </label> <input name="name" id="name"
						type="text" placeholder="Nutzername" maxlength="64"
						required="required" title="Bitte geben Sie ihren Nutzernamen an" />
				</div>
				<div>
					<label for="passwort">Passwort: </label><input name="passwort"
						id="passwort" type="password" maxlength="128"
						placeholder="*******" required="required"
						title="Bitte geben Sie ihr Passwort an" />
				</div>
				<div>
					<button type="submit">Absenden</button>
					<button type="reset">Zurücksetzen</button>
				</div>
			</fieldset>
		</form>
		<div id="infotext">
			<c:out value="${forminfotext}"
				default="Bitte geben sie ihre Anmeldedaten an." />
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>