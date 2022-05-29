<%--
Erstellt von Lukas Theinert
--%>

<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/spiel_mathe.js" defer></script>

<base href="${pageContext.request.requestURI}" />
<meta charset="UTF-8">
<title>Mathespiel</title>
</head>
<body>

	<header>
		<h1>Mathespiel</h1>	
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	
	<!-- Flex-Item 1 -->
	<div id="flexarea">
	
	<!-- Flex-Item 2 -->
	<article>

		<div id="container">
		<div id="score">
			score: <span id="scorevalue" style="font-weight: 900">0</span>
		</div>
		<div id="correct">
			Correct!
		</div>
		<div id="wrong">
			Try again!
		</div>
		<div id="question">
			
		</div>
		<div id="instruction">
			Click on the correct answer.
		</div>
		<div id="choices">
			
			<div id="box1" class="box"> </div>
			<div id="box2" class="box">	</div>
			<div id="box3" class="box">	</div>
			<div id="box4" class="box">	</div>	
		</div>
		<div id="startreset">
			Start Game
		</div>
		<div id="timeremaining">
			Time remaining:   <span id="timeremainingvalue" style="font-family: sans seriff; font-weight: bold; font-size 32px; color: black;">  60</span>
		</div>
		<div id="gameOver">
			
		</div>
	</div>
	

				<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
	
	</article>

	</div>
	<!-- Ende der FLEXBOX -->
	<br> <br> <br> <br>
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>

</body>
</html>