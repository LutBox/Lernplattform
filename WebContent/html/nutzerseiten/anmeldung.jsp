<%-- @author Merlin --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spielehauptseite.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spielehauptseite.js" defer></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>
<title>Anmeldung</title>
<link rel="stylesheet" href="../../css/adminstilvorlage.css"/>
</head>
<body>
	<header>
		<h1>Anmeldung</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<form method="post" action="../../AnmeldungServlet">
			<fieldset>
				<div class="eingabefeld">
					<label for="name">Nutzername: </label> <br /> <input name="name"
						id="name" type="text" placeholder="Nutzername" maxlength="64"
						required="required" /> <br /> <label for="passwort">Passwort:
					</label> <br> <input name="passwort" id="passwort" type="password"
						maxlength="128" placeholder="****" required="required" />
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
<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>