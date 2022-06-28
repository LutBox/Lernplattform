<%--

Erstellt von Zohal Mohammadi
--%>

<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4 Bilder ein Wort</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/standard.js" defer></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/spieleseiten/spiel_bildWort.css" />
<script src="js/spiel_vierBilderEinWort.js">
	
</script>
</head>
<body>


	<header>
		<h1>4 Bilder Ein Wort</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>


<%@include file="../jspf/aktuellerNutzer.jspf"%>

	<div id="temp" hidden></div>
	<div id="nutzer" hidden>${nutzer.name}</div>
	<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
	<div id="timerID" hidden>${spielStartenBean.timer}</div>
	
	<div id="bilderText">
    
    <p class="punkte" > <b>Erreichte Punkte:</b> <span id="erreichte_Punkte">${vierBilderEinWort.richtigeErgebnis}</span></p>
	<p class= "versuche"> <b>Anzahl der Versuche:</b> <span id= "insgesamt_Punkte">${vierBilderEinWort.versuche}</span></p>
	<div class="bild">
	<img
		src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild1}"
		alt="bild1">
	</div>
		<div class="bild">
	<img
		src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild2}"
		alt="bild2">
		</div>
	<div class="bild">
	<img
		src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild3}"
		alt="bild3">
	</div>
	<div class="bild">
	<img
		src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild4}"
		alt="bild4">
	</div>

	<form action="VierBilderEinWortServlet" method="post">
		<input type="text" name="userEingabe"
			placeholder="Bitte das Wort erraten" required="required" max="30"
			autofocus> <input type="submit" value="weiter"> <input
			type="hidden" name="loesung"
			value="${requestScope.spielVierBilderEinWortBean.wort}">
        <p><b>Zeit</b></p>
        <p class="timer" id=t1 data-endzeit="${vierBilderEinWort.zeit}"></p>
		
	</form>
</div>
	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>

