<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Anmeldung</title>
</head>
<body>
	<header>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<h1>Anmeldung</h1>
		<form method="post" action="../../AnmeldungServlet">
			<fieldset>
				<div class="eingabefeld">
					<label for="name">Nutzername: </label> <br /> <input name="name"
						id="name" type="text" placeholder="Nutzername" maxlength="64"
						required="required" /> <br /> <label for="passwort">Passwort:
					</label> <br> <input name="passwort" id="passwort" type="password"
						maxlength="128" required="required" />
				</div>
				<div class="infotext">
					<c:out value="${anmeldunginfotext}"
						default="Bitte geben sie ihre Anmeldedaten an." />
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