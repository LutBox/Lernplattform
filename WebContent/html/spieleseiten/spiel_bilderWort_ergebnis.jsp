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

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spiel_bilderWort_ergebnis.css" />
</head>
<div id="temp" hidden></div>
<div id="nutzer" hidden>${nutzer.name}</div>
<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
<div id="timerID" hidden>${spielStartenBean.timer}</div>
<body>

<%@include file="../jspf/aktuellerNutzer.jspf"%>

	<header>
		<h1>4 Bilder Ein Wort Ergebnis</h1>	
		<%@include file="../jspf/navigation.jspf"%>
	</header>

	<div class="ergebnis">
	<h2><b>Ende der Runde</b></h2>
	<p class="punkte" > <b>Erreichte Punkte:</b> <span id="erreichte_Punkte">${vierBilderEinWort.richtigeErgebnis}</span></p>
	<p class= "versuche"> <b>Anzahl der Versuche:</b> <span id= "insgesamt_Punkte">${vierBilderEinWort.versuche}</span></p>
    <a href="../../SpielStartenServlet?Spielart=bilderWort&Schwierigkeit=${vierBilderEinWort.schwierigkeit }&Gewertet=${vierBilderEinWort.gewertet }" > Erneut spielen</a>
	</div>

	<br> <br> <br> <br>
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>

</body>



</html>