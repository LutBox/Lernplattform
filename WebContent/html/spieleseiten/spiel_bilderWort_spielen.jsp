<%--

Erstellt von Zohal Mohammadi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4 Bilder ein Wort</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spiel_bildWort.css" />
<script src="js/spiel_vierBilderEinWort.js">
	
</script>
</head>
<body>


	<h1>4 Bilder ein Wort</h1>	
		


<div id="temp" hidden></div>
<div id="nutzer" hidden>${nutzer.name}</div>
<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
<div id="timerID" hidden>${spielStartenBean.timer}</div>



<div id ="erreichte_Punkte">${vierBilderEinWort.richtigeErgebnis}</div>
/
<div id="insgesamt_Punkte">${vierBilderEinWort.versuche}</div>
			<img
				src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild1}"
				alt="bild1"> <img
				src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild2}"
				alt="bild2"> <img
				src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild3}"
				alt="bild3"> <img
				src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild4}"
				alt="bild4">

			<form action="VierBilderEinWortServlet" method="post">
				<input type="text" name="userEingabe"
					placeholder="Bitte das Wort erraten" required="required" max="30" autofocus>
				<input type="submit" value="weiter" > <input type="hidden"
					name="loesung"
					value="${requestScope.spielVierBilderEinWortBean.wort}">

				<p class="timer" id=t1 data-endzeit="${vierBilderEinWort.zeit}"></p>
			</form>		
</body>
</html>

