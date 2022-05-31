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
	


	<!-- Begin der FLEXBOX = Flex-Container -->
	<div id="flexarea">
	
		<!-- Flex-Item 2 -->
		<article>
		
    <div class="game">
        <img id="figur"></img>
        <img id="vogel"></img>
        <img id="stein"></img>
        
    </div>
    
	<p>Score: <span id="scoreSpan"></span></p>
	<p>Zeit-Stein: <span id="timerStein"></span></p>
	<p>Zeit-Vogel: <span id="timerVogel"></span></p>
	<p>Stone left: <span id="steinLinks"></span></p>
    <p>Vogel left: <span id="vogelLinks"></span></p>
	
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