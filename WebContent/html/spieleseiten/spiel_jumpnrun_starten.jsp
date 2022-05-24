<%--
Erstellt von Lukas Theinert
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html onclick="jump()">
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
		
<body>
    <div class="game">
        <div id="character"></div>
        <div id="block"></div>
    </div>
    <p>Score: <span id="scoreSpan"></span></p>
</body>    
  
  </section>
  			<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
  
  </article>

	</div>
	<!-- Ende der FLEXBOX -->
	
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>

</body>
</html>