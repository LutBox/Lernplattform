<%--
Erstellt von Zohal Mohammadi
--%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

<base href="${pageContext.request.requestURI}" />
<meta charset="UTF-8">
<title>4 Bilder Ein Wort Ergebnis</title>
</head>
<div id="temp" hidden></div>
<div id="nutzer" hidden>${nutzer.name}</div>
<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
<div id="timerID" hidden>${spielStartenBean.timer}</div>
<body>

	<header>
		<h1>4 Bild Ein Wort Ergebnis</h1>	
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	
	<!-- Flex-Item 1 -->
	<div id="flexarea">
	
	<!-- Flex-Item 2 -->
	<article>

		

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