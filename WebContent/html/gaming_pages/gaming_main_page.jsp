<%--
Erstellt von Lukas Theinert
--%>

<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta charset="ISO-8859-1">
<title>Games</title>
</head>
<body>

	<h1>Übersichtsseite: Spiele</h1>
	
		<nav>
			<%@include file="../jspf/navigation.jspf"%>
		</nav>

	<form id="Spielstarten" action="${pageContext.request.contextPath}/SpielStartenServlet" method="post" accept-charset="UTF-8">
	
			<p>Spieleauswahl:</p>

		<div>
			<input type="radio" name="Spielart" id="mathe" value="mathe" required>
			<label for="mathe">Mathe</label>
		</div>

		<div>
			<input type="radio" name="Spielart" id="deutsch" value="deutsch">
			<label for="deutsch">Deutsch</label>
		</div>

		<div>
			<input type="radio" name="Spielart" id="zufall" value="zufall">
			<label for="zufall">Zufall</label>
		</div>

		<br> <br>

		<p>Schwierigkeitsgrad:</p>

		<div>
			<input type="radio" name="Schwierigkeit" id="leicht" value="leicht" required>
			<label for="leicht">Zu jung zum sterben</label>
		</div>

		<div>
			<input type="radio" name="Schwierigkeit" id="mittel" value="mittel">
			<label for="mittel">Albtraum</label>
		</div>

		<div>
			<input type="radio" name="Schwierigkeit" id="schwer" value="schwer">
			<label for="schwer">Todesmarsch</label>
		</div>
		
		<br> <br>
		
		<button name="spielen" type="submit">Spielen!</button>

	</form>

</body>
</html>