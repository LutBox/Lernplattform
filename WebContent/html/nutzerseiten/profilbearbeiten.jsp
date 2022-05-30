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
<title>Profil bearbeiten</title>
<link rel="stylesheet" href="../../css/adminstilvorlage.css"/>
</head>
<body>
	<header>
		<h1>Profil bearbeiten</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main>
		<form method="post" action="../../ProfilAktualisierenServlet"
			enctype="multipart/form-data">
			<fieldset>
				<div class="eingabefeld">
					<label for="neuerName">Neuer Nutzername: </label> <br /> <input
						name="neuerName" id="neuerName" type="text"
						placeholder="Neuer Nutzername" maxlength="64"
						value="${nutzer.name}" /> <br /> <label for="email">Neue
						E-Mail:</label> <br /> <input name="neueEmail" id="neuEmail" type="email"
						value="${nutzer.email}" placeholder="e-mail" maxlength="64" /> <br />
					<label for="neuesPasswort">Neues Passwort:</label> <br /> <input
						name="neuesPasswort" id="neuesPasswort" type="password"
						maxlength="128" /> <br /> <label for="passwort2">Neues
						Passwort wiederholen:</label> <br> <input name="passwort2"
						id="passwort2" type="password" maxlength="128" /> <br /> <label
						for="profilbild">Profilbild hochladen:</label> <br /> <input
						type="file" name="neuesProfilbild" id="neuesProfilbild"
						accept="image/*" />
				</div>
				<div class="infotext">
					<c:out value="${registrierunginfotext}"
						default="Bitte geben sie ihre Daten an." />
				</div>
				<div class="formularknopf">
					<button type="submit">Absenden</button>
					<br />
					<button type="reset">Zurücksetzen</button>
					<br /> <a href="./nutzerHauptseite.jsp">Abbrechen</a>
				</div>
			</fieldset>
		</form>
	</main>
		<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>