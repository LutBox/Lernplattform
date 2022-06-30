<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Anmeldung</title>
<link rel="stylesheet" type="text/css"
	href="../../css/nutzerseiten/anmeldungStil.css" />
<script type="text/javascript" src="../../js/cookiemonster.js" defer></script>
</head>
<body>
	<header>
		<h1>Lernplattform</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main class="fade-in">
		<form id="anmeldeformular" method="post"
			action="../../AnmeldungServlet">
			<fieldset>
				<legend>Anmeldung</legend>
				<div class="inputfeld">
					<label for="name">Nutzername: </label> <input name="name" id="name"
						type="text" placeholder="Nutzername" maxlength="64"
						pattern="[^ &lt;&gt;&#34;']+"
						title="Bitte geben Sie Ihren Nutzernamen an." required />
				</div>
				<div class="inputfeld">
					<label for="passwort">Passwort: </label><input name="passwort"
						id="passwort" type="password" maxlength="128"
						placeholder="*******" pattern="[^ ]+"
						title="Bitte geben Sie Ihr Passwort an." required />
				</div>
				<div class="buttonbox inputfeld">
					<button type="submit" title="Klicken, um Anmeldung durchzuführen.">Absenden</button>
					<button type="reset" title="Klicken, um das Formular zurückzusetzen.">Zurücksetzen</button>
				</div>
			</fieldset>
		</form>
		<div id="infotext">
			<span id="infoicon">&#9432; </span><span class="fade-in"> <c:out
					value="${forminfotext}"
					default="Bitte geben Sie Ihre Anmeldedaten an." />
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