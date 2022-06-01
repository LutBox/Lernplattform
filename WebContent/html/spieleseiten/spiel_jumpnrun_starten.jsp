<%--
Erstellt von Lukas Theinert
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spiel_jumpnrun.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spiel_jumpnrun.js" defer></script>


<title>Jump n Run</title>
</head>
<body>


	<header>
		<h1>Jump n Run</h1>	
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	
<div id="temp" hidden></div>
<div id="nutzer" hidden>${nutzer.name}</div>
<div id="schwierigkeit" hidden>${spielStartenBean.schwierigkeit}</div>
<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
<div id="timerID" hidden>${spielStartenBean.timer}</div>

	<!-- Begin der FLEXBOX = Flex-Container -->
	<div id="flexarea">
	
		<!-- Flex-Item 2 -->
		<article>
		
    <div class="game">
        <img id="figur"></img>
        <img id="vogel"></img>
        <img id="stein"></img>
        
    </div>
    
	Punkte: <span id="scoreSpan"></span> <br>
	Verbleibende Leben: <span id="leben"></span> <br>
	Zeit: <span id="zeit"></span> <br>
	<div >
	Zeit-Stein: <span id="timerStein"></span> <br>
	Zeit-Vogel: <span id="timerVogel"></span> <br>
	Stone left: <span id="steinLinks"></span> <br>
    Vogel left: <span id="vogelLinks"></span> <br>
	</div>
	<button type="button" id="start">Start</button>
  
 
  			<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
  
  </article>

	</div>
	<!-- Ende der FLEXBOX -->
	
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>

</body>
</html>