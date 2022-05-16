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

	<form id="Spielstarten"
		action="${pageContext.request.contextPath}/SpielStartenServlet"
		method="post" accept-charset="UTF-8">

		<p>Spieleauswahl:</p>

<%-- 
---------- Mathe ---------- 
--%>
		<div>
			<fieldset>
				<legend>
					<input type="radio" name="Spielart" id="mathe" value="mathe"
						required><label for="mathe">Mathe</label>
				</legend>
				<div>
					<input type="radio" name="Schwierigkeit" id="leicht" value="leicht" required>
					<label for="leicht">Zu jung zum sterben</label>

					<input type="radio" name="Schwierigkeit" id="mittel" value="mittel">
					<label for="mittel">Albtraum</label>

					<input type="radio" name="Schwierigkeit" id="schwer" value="schwer">
					<label for="schwer">Todesmarsch</label>
				</div>
			</fieldset>
		</div>
	
<br>
<%-- 
---------- 4 Bilder 1 Wort ---------- 
--%>
		<div>
			<fieldset>
				<legend>
					<input type="radio" name="Spielart" id="bilderWort"
						value="bilderWort"> <label for="bilderWort">4
						Bilder 1 Wort</label>
				</legend>
			</fieldset>
		</div>
<br>
<%-- 
---------- Bilder-Ordnen ---------- 
--%>
		<div>
			<fieldset>
				<legend>
					<input type="radio" name="Spielart" id="bilderOrdnen"
						value="bilderOrdnen"> <label for="bilderOrdnen">Bilder
						ordnen</label>
				</legend>
			</fieldset>
		</div>
<br>
<%-- 
---------- Bilder-Memorie ---------- 
--%>
		<div>
			<fieldset>
				<legend>
					<input type="radio" name="Spielart" id="bilderMemorie"
						value="bilderMemorie" checked="checked"> <label for="bilderMemorie">Bildermemorie</label>
				</legend>
				<br>
				<div>
					<input type="radio" name="Schwierigkeit" id="leichtBildermemorie" value="leicht" checked="checked">
					<label for="leichtBildermemorie">Zu jung zum sterben</label>

					<input type="radio" name="Schwierigkeit" id="mittelBildermemorie" value="mittel">
					<label for="mittelBildermemorie">Albtraum</label>

					<input type="radio" name="Schwierigkeit" id="schwerBildermemorie" value="schwer">
					<label for="schwerBildermemorie">Todesmarsch</label>
				</div>
				
				<div>
					<input type="radio" name="Timer" id="timerAnBildermemorie" value="timerAn" required checked="checked">
					<label for="timerAnBildermemorie">Mit Zeit spielen</label>

					<input type="radio" name="Timer" id="timerAusBildermemorie" value="TimerAus" required>
					<label for="timerAusBildermemorie">Ohne Zeit spielen</label>
				</div>
				<div>
					<input type="radio" name="Gewertet" id="gewertetAnBildermemorie" value="gewertetAn" checked="checked">
					<label for="gewertetAnBildermemorie">Spiel ist geweret</label>

					<input type="radio" name="Gewertet" id="gewertetAusBildermemorie" value="gewertetAus">
					<label for="gewertetAusBildermemorie">Spiel ist nicht gewertet</label>
				</div>
			</fieldset>
		</div>
<br>
<%-- 
---------- Zufall ---------- 
--%>
		<div>
			<fieldset>
				<legend>
					<input type="radio" name="Spielart" id="zufall" value="zufall">
					<label for="zufall">Zufall</label>
				</legend>
			</fieldset>
		</div>

		<br> <br> <br> <br>

		<button name="spielen" type="submit">Spielen!</button>

	</form>

</body>
</html>