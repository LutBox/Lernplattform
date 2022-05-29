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

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

<base href="${pageContext.request.requestURI}" />
<meta charset="UTF-8">
<title>Games</title>
</head>
<body>

	<header>
		<h1>Spieleübersicht</h1>	
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	
	<!-- Flex-Item 1 -->
	<div id="flexarea">
	
		<!-- Flex-Item 1 -->
		<aside>
			<h2>Top-News</h2>
			<p>Forum-Threads</p>
		</aside>
		
		<!-- Flex-Item 2 -->
		<article>

	<form id="Spielstarten"
		action="${pageContext.request.contextPath}/SpielStartenServlet"
		method="post" accept-charset="UTF-8">


<div class="spielart">
		
<table style="width:100%">
<%-- 
---------- Mathe ---------- 
--%>

		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/mathe.png" alt="mathe" style="width:256px;height:256px;" id="KarteMathe">

		</div>
				<div class="flip-card-back">
				Schwierigkeit:<br>
					<input type="radio" name="Schwierigkeit" id="leichtMathe" value="leicht" required>
					<label for="leichtMathe">Leicht</label>

					<input type="radio" name="Schwierigkeit" id="mittelMathe" value="mittel">
					<label for="mittelMathe">Mittel</label>

					<input type="radio" name="Schwierigkeit" id="schwerMathe" value="schwer">
					<label for="schwerMathe">Schwer</label>
					
					<br><br>
					
					<div>
					Timer:<br>
					<input type="radio" name="Timer" id="timerAnMathe" value="timerAn" required checked="checked">
					<label for="timerAnMathe">An</label>
					
					<input type="radio" name="Timer" id="timerAusMathe" value="TimerAus" required>
					<label for="timerAusMathe">Aus</label>
				</div>
				
<br>		
				<div>
				Gewertet:<br>
					<input type="radio" name="Gewertet" id="gewertetAnMathe" value="gewertetAn" checked="checked">
					<label for="gewertetAnMathe">An</label>					
					
					<input type="radio" name="Gewertet" id="gewertetAusMathe" value="gewertetAus">
					<label for="gewertetAusMathe">Aus</label>
				</div>
				
				<br>
					
						<button class="button" name="Spielart" id="mathe" value="mathe" type="submit">Starten!</button>

				</div>
				
		</div>	
</div>

<%-- 
---------- 4 Bilder 1 Wort ---------- 
--%>

		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/bilderWort.png" alt="bilderWort" style="width:256px;height:256px;" id="KarteBilderWort">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leichtBilderWort" value="leicht" required>
					<label for="leichtBilderWort">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittelBilderWort" value="mittel">
					<label for="mittelBilderWort">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwerBilderWort" value="schwer">
					<label for="schwerBilderWort">Todesmarsch</label>
					
					<br><br>
					
						<button class="button" name="Spielart" id="bilderWort" value="bilderWort" type="submit">Starten!</button>

				</div>
				
		</div>	
</div>

<%-- 
---------- Bilder-Ordnen ---------- 
--%>

		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/bilderOrdnen.png" alt="bilderOrdnen" style="width:256px;height:256px;" id="KarteBilderOrdnen">

		</div>
				<div class="flip-card-back">
				Schwierigkeit:<br>
					<input type="radio" name="Schwierigkeit" id="leichtBilderOrdnen" value="leicht" required>
					<label for="leichtBilderOrdnen">Leicht</label>

					<input type="radio" name="Schwierigkeit" id="mittelBilderOrdnen" value="mittel">
					<label for="mittelBilderOrdnen">Mittel</label>

					<input type="radio" name="Schwierigkeit" id="schwerBilderOrdnen" value="schwer">
					<label for="schwerBilderOrdnen">Schwer</label>
					
					<br><br>
					
					<div>
					Timer:<br>
					<input type="radio" name="Timer" id="timerAnBilderOrdnen" value="timerAn" required checked="checked">
					<label for="timerAnBilderOrdnen">An</label>
					
					<input type="radio" name="Timer" id="timerAusBilderOrdnen" value="TimerAus" required>
					<label for="timerAusBilderOrdnen">Aus</label>
				</div>
				
<br>		
				<div>
				Gewertet:<br>
					<input type="radio" name="Gewertet" id="gewertetAnBilderOrdnen" value="gewertetAn" checked="checked">
					<label for="gewertetAnBilderOrdnen">An</label>					
					
					<input type="radio" name="Gewertet" id="gewertetAusBilderOrdnen" value="gewertetAus">
					<label for="gewertetAusBilderOrdnen">Aus</label>
				</div>
				<br>
					
						<button class="button" name="Spielart" id="bilderOrdnen" value="bilderOrdnen" type="submit">Starten!</button>
						
				</div>
				
		</div>	
</div>

<%-- 
---------- Bilder-Memorie ---------- 
--%>

		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/bildermemorie.png" alt="mathe" style="width:256px;height:256px;" id="KarteBilderMemorie">

		</div>		
				<div class="flip-card-back">
				Schwierigkeit:<br>
					<input type="radio" name="Schwierigkeit" id="leichtBilderMemorie" value="leicht" checked="checked" required>
					<label for="leichtBilderMemorie">Leicht</label>
				
					<input type="radio" name="Schwierigkeit" id="mittelBilderMemorie" value="mittel">
					<label for="mittelBilderMemorie">Mittel</label>					
					
					<input type="radio" name="Schwierigkeit" id="schwerBilderMemorie" value="schwer">
					<label for="schwerBilderMemorie">Schwer</label>
					
					<br><br>					
					
					<div>
					Timer:<br>
					<input type="radio" name="Timer" id="timerAnBilderMemorie" value="timerAn" required checked="checked">
					<label for="timerAnBilderMemorie">An</label>
					
					<input type="radio" name="Timer" id="timerAusBilderMemorie" value="TimerAus" required>
					<label for="timerAusBilderMemorie">Aus</label>
				</div>
				
<br>		
				<div>
				Gewertet:<br>
					<input type="radio" name="Gewertet" id="gewertetAnBilderMemorie" value="gewertetAn" checked="checked">
					<label for="gewertetAnBilderMemorie">An</label>					
					
					<input type="radio" name="Gewertet" id="gewertetAusBilderMemorie" value="gewertetAus">
					<label for="gewertetAusBilderMemorie">Aus</label>
				</div>
				
					<br>

						<button class="button" name="Spielart" id="bilderMemorie" value="bilderMemorie" type="submit">Starten!</button>
						
				</div>
				
		</div>	
</div>

<%-- 
---------- Jump n Run ---------- 
--%>

		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/jumpnrun.png" alt="jumpnrun" style="width:256px;height:256px;" id="KarteJumpnrun">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leichtJumpnrun" value="leicht" required>
					<label for="leichtJumpnrun">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittelJumpnrun" value="mittel">
					<label for="mittelJumpnrun">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwerJumpnrun" value="schwer">
					<label for="schwerJumpnrun">Todesmarsch</label>
					
					<br><br>
					
						<button class="button" name="Spielart" id="Jumpnrun" value="jumpnrun" type="submit">Starten!</button>
						
				</div>
				
		</div>	
</div>
			

<%-- 
---------- Zufall ---------- 
--%>

		<div class="flip-card">
			<div class="flip-card-inner">
				<div class="flip-card-front">
				
				<img src="../../bilder/zufall.png" alt="zufall" style="width:256px;height:256px;" id="KarteZufall">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leichtZufall" value="leicht" required>
					<label for="leichtZufall">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittelZufall" value="mittel">
					<label for="mittelZufall">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwerZufall" value="schwer">
					<label for="schwerZufall">Todesmarsch</label>
					
					<br><br>
					
						<button class="button" name="Spielart" id="zufall" value="zufall" type="submit">Starten!</button>
						
				</div>
				
		</div>	
</div>

</div>
		<br> <br> <br> <br>


</table>
	</form>
				<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
	
	</article>
		<!-- Flex-Item 3 -->
		<aside>
			<h2>Beschreibung:</h2>
			<br>
			<div id="spieleBeschreibung"></div>
		</aside>
		
	</div>
	<!-- Ende der FLEXBOX -->
	<br> <br> <br> <br>
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>

</body>
</html>