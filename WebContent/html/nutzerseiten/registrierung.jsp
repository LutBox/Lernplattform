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
<title>Registrierung</title>
<link rel="stylesheet" href="../../css/adminstilvorlage.css" />
</head>
<body>
	<header>
	<h1>Registrierung</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<form method="post" action="../../RegistrierungServlet"
			enctype="multipart/form-data">
			<fieldset>
				<div class="eingabefeld">
					<label for="name">Nutzername: </label> <br /> <input name="name"
						id="name" type="text" placeholder="Nutzername" maxlength="64"
						required="required" /> <br /> <label for="email">E-Mail:</label>
					<br /> <input name="email" id="email" type="email"
						value="${anfrage.email}" placeholder="e-mail" maxlength="64"
						required="required"> </input> <br /> <label for="passwort">Passwort:</label>
					<br /> <input name="passwort" id="passwort" type="password"
						maxlength="128" required="required" value="${anfrage.passwort}"
						placeholder="****" /> <br /> <label for="passwort2">Passwort
						wiederholen:</label> <br> <input name="passwort2" id="passwort2"
						type="password" maxlength="128" required="required"
						placeholder="****" value="${anfrage.passwort}" /> <br /> <label
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
		<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>