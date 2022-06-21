<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="../../css/nutzerseiten/anmeldungStil.css" />
<%@include file="../jspf/noSkript.jspf"%>
<title>Anmeldung</title>
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
						required="required" pattern="[^ &lt;&gt;&#34;']+"
						title="Bitte geben Sie ihren Nutzernamen an." />
				</div>
				<div class="inputfeld">
					<label for="passwort">Passwort: </label><input name="passwort"
						id="passwort" type="password" maxlength="128"
						placeholder="*******" required="required" pattern="[^ ]+"
						title="Bitte geben Sie Ihr Passwort an." />
				</div>
				<div class="buttonbox inputfeld">
					<button type="submit">Absenden</button>
					<button type="reset">Zurücksetzen</button>
				</div>
			</fieldset>
		</form>
		<div id="infotext">
			<span id="infoicon">&#9432; </span><span class="fade-in"> <c:out value="${forminfotext}"
					default="Bitte geben Sie Ihre Anmeldedaten an." />
			</span>
		</div>
	</main>
	<footer id="footer">
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>