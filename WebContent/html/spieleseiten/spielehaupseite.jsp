<%--
Erstellt von Lukas Theinert
--%>

<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spielehauptseite.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spielehauptseite.js" defer></script>

<base href="${pageContext.request.requestURI}" />
<meta charset="UTF-8">
<title>Games</title>
</head>
<body>

	<h1>Übersichtsseite: Spiele</h1>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>
	
	<form id="Bestenliste" action="${pageContext.request.contextPath}/BestenlisteBilderMemorieAjax" method="post" accept-charset="UTF-8">
		<button name="spielen" type="submit">Bestenliste</button>
	</form>

	<form id="Spielstarten"
		action="${pageContext.request.contextPath}/SpielStartenServlet"
		method="post" accept-charset="UTF-8">

		<p>Spieleauswahl:</p>

<div class="spielart">
		
<table style="width:100%">
<%-- 
---------- Mathe ---------- 
--%>
<tr><td>
		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/mathe.png" alt="mathe" style="width:256px;height:256px;">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leicht" value="leicht" required>
					<label for="leicht">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittel" value="mittel">
					<label for="mittel">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwer" value="schwer">
					<label for="schwer">Todesmarsch</label>
					
					<br>
					
						<button name="Spielart" id="mathe" value="mathe" type="submit">Starten!</button>

				</div>
				
		</div>	
</div>
	</td>
<%-- 
---------- 4 Bilder 1 Wort ---------- 
--%>
<td>
		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/bilderWort.png" alt="bilderWort" style="width:256px;height:256px;">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leicht" value="leicht" required>
					<label for="leicht">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittel" value="mittel">
					<label for="mittel">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwer" value="schwer">
					<label for="schwer">Todesmarsch</label>
					
					<br>
					
						<button name="Spielart" id="bilderWort" value="bilderWort" type="submit">Starten!</button>

				</div>
				
		</div>	
</div>
</td></tr>
<%-- 
---------- Bilder-Ordnen ---------- 
--%>
<tr><td>
		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/bilderOrdnen.png" alt="bilderOrdnen" style="width:256px;height:256px;">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leicht" value="leicht" required>
					<label for="leicht">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittel" value="mittel">
					<label for="mittel">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwer" value="schwer">
					<label for="schwer">Todesmarsch</label>
					
					<br>
					
						<button name="Spielart" id="bilderOrdnen" value="bilderOrdnen" type="submit">Starten!</button>
						
				</div>
				
		</div>	
</div>
</td>
<%-- 
---------- Bilder-Memorie ---------- 
--%>
<td>
		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/bildermemorie.png" alt="mathe" style="width:256px;height:256px;">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leicht" value="leicht" required>
					<label for="leicht">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittel" value="mittel">
					<label for="mittel">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwer" value="schwer">
					<label for="schwer">Todesmarsch</label>
					
					<br>
					<br>
					
					<div>
					<input type="radio" name="Timer" id="timerAnBildermemorie" value="timerAn" required checked="checked">
					<label for="timerAnBildermemorie">Mit Zeit spielen</label>
					
					<br>
					
					<input type="radio" name="Timer" id="timerAusBildermemorie" value="TimerAus" required>
					<label for="timerAusBildermemorie">Ohne Zeit spielen</label>
				</div>
				
				<br>
				
				<div>
					<input type="radio" name="Gewertet" id="gewertetAnBildermemorie" value="gewertetAn" checked="checked">
					<label for="gewertetAnBildermemorie">Spiel ist geweret</label>
					
					<br>
					
					<input type="radio" name="Gewertet" id="gewertetAusBildermemorie" value="gewertetAus">
					<label for="gewertetAusBildermemorie">Spiel ist nicht gewertet</label>
				</div>
				
					<br>

						<button name="Spielart" id="bilderMemorie" value="bilderMemorie" type="submit">Starten!</button>
						
				</div>
				
		</div>	
</div>
			
</td></tr>
<%-- 
---------- Zufall ---------- 
--%>
<tr><td>
		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/zufall.png" alt="zufall" style="width:256px;height:256px;">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leicht" value="leicht" required>
					<label for="leicht">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittel" value="mittel">
					<label for="mittel">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwer" value="schwer">
					<label for="schwer">Todesmarsch</label>
					
					<br>
					
						<button name="Spielart" id="zufall" value="zufall" type="submit">Starten!</button>
						
				</div>
				
		</div>	
</div>

</div>
		<br> <br> <br> <br>

</td></tr>
</table>
	</form>

</body>
</html>