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
				
				<img src="../../bilder/mathe.png" alt="mathe" style="width:256px;height:256px;">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leicht" value="leichtMathe" required>
					<label for="leichtMathe">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittelMathe" value="mittel">
					<label for="mittelMathe">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwerMathe" value="schwer">
					<label for="schwerMathe">Todesmarsch</label>
					
					<br><br>
					
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
				
				<img src="../../bilder/bilderWort.png" alt="bilderWort" style="width:256px;height:256px;">

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
				
				<img src="../../bilder/bilderOrdnen.png" alt="bilderOrdnen" style="width:256px;height:256px;">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leichtBilderOrdnen" value="leicht" required>
					<label for="leichtBilderOrdnen">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittelBilderOrdnen" value="mittel">
					<label for="mittelBilderOrdnen">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwerBilderOrdnen" value="schwer">
					<label for="schwerBilderOrdnen">Todesmarsch</label>
					
					<br><br>
					
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
				
				<img src="../../bilder/bildermemorie.png" alt="mathe" style="width:256px;height:256px;">

		</div>
				<div class="flip-card-back">
					<input type="radio" name="Schwierigkeit" id="leichtBilderMemorie" value="leicht" checked="checked" required>
					<label for="leichtBilderMemorie">Zu jung zum sterben</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="mittelBilderMemorie" value="mittel">
					<label for="mittelBilderMemorie">Albtraum</label>
					
					<br>
					
					<input type="radio" name="Schwierigkeit" id="schwerBilderMemorie" value="schwer">
					<label for="schwerBilderMemorie">Todesmarsch</label>
					
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

						<button class="button" name="Spielart" id="bilderMemorie" value="bilderMemorie" type="submit">Starten!</button>
						
				</div>
				
		</div>	
</div>
			

<%-- 
---------- Zufall ---------- 
--%>

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
			<h2>Beschreibungen</h2>
		</aside>
		
	</div>
	<!-- Ende der FLEXBOX -->
	<br> <br> <br> <br>
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>

</body>
</html>