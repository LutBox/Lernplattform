<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spiel_bilderOrdnen.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spiel_bilderOrdnen.js" defer></script>

<title>Bilder Ordnen</title>
</head>
<body>

	<header>
		<h1>Bilder ordnen</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>

<div id="bild1Kategorie" hidden value=>${spielBilderOrdnen.bild1Kategorie}</div>
<div id="bild2Kategorie" hidden value=>${spielBilderOrdnen.bild2Kategorie}</div>
<div id="bild3Kategorie" hidden value=>${spielBilderOrdnen.bild3Kategorie}</div>
<div id="bild4Kategorie" hidden value=>${spielBilderOrdnen.bild4Kategorie}</div>

	<!-- Begin der FLEXBOX = Flex-Container -->
	<div id="flexarea">

		<%-- Flex-Item 1: Spalte Links 
		<aside>
			<p>Text</p>
		</aside>
		--%>

		<!-- Flex-Item 2: Spalte Mitte -->
		<article>			
			
	<div class="app">
	
		<header>
			<h1>DRAG n DROP</h1>
		</header>
		
		<div class="lists">
			<div class="list">
			
				<div class="list-item" draggable="true">
					<img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild1ID}" alt="bild1" />
				</div>
				
				<div class="list-item" draggable="true">
					<img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild2ID}" alt="bild2" />
				</div>
				
				<div class="list-item" draggable="true">
					<img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild3ID}" alt="bild3" />
				</div>
				
			</div>
			
			<div class="list"></div>
			<div class="list"></div>
		</div>
	</div>

			<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
		</article>

		<%-- Flex-Item 3: Spalte Rechts 
		<aside>
			<p>Text</p>
		</aside>
		--%>

	</div>
	<!-- Ende der FLEXBOX -->

	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>

</body>
</html>