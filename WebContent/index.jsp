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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js" defer></script>

<base href="${pageContext.request.requestURI}" />

<meta charset="UTF-8">
<title>Lernplattform</title>
</head>

<body>

	<header>
		<h1>Lernplattform</h1>	
		<%@include file="html/jspf/navigation.jspf"%>
	</header>
	
	
	<!-- Begin der FLEXBOX = Flex-Container -->
	<div id="flexarea">
	
		<!-- Flex-Item 1 -->
		<aside>
			<h2>Top-News</h2>
			<p>Bildermemorie jetzt verfügbar!</p>
		</aside>
		
		<!-- Flex-Item 2 -->
		<article>
			<h2>Willkommen auf der Lernplattform!</h2>
			<p>Tabelle mit aktueller Bestenliste</p>
			<p>Tabelle mit meist gespieltesten Spielen</p>
			
			<h3>Sticky Navigation Bar Example</h3>
			<p>The navbar will <strong>stick</strong> to the top when you reach its scroll position.</p>
			<p><strong>Note:</strong> Internet Explorer do not support sticky positioning and Safari requires a -webkit- prefix.</p>
			<p>Some text to enable scrolling. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
			<p>Some text to enable scrolling. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
			<p>Some text to enable scrolling. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
			<p>Some text to enable scrolling. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
			<p>Some text to enable scrolling. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
			<p>Some text to enable scrolling. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
			<p>Some text to enable scrolling. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>

			<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>


		</article>
		
		<!-- Flex-Item 3 -->
		<aside>
		
			<h3>Top 3 Spieler</h3>
			<p id="besteSpieler">Listeneinträge</p>
			
			<h3>Beliebteste Spiele</h3>
			<p id="beliebtesteSpiele">Listeneinträge</p>

		</aside>
		
	</div>
	<!-- Ende der FLEXBOX -->
	
	<footer>
			<%@include file="html/jspf/footer.jspf"%>
	</footer>
	
</body>
</html>