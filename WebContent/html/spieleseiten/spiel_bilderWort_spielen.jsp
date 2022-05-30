<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>VierBilderEinWort</title>
<script src="js/spiel_vierBilderEinWort.js">
	
</script>
</head>
<body>


<div id ="erreichte_Punkte">
${vierBilderEinWort.richtigeErgebnis}
</div>
	/
	<div id="insgesamt_Punkte">

	${vierBilderEinWort.versuche} 
	</div>
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
					placeholder="Bitte das Wort erraten" required="required" max="30">
				<input type="submit" value="weiter"> <input type="hidden"
					name="loesung"
					value="${requestScope.spielVierBilderEinWortBean.wort}">

				<p class="timer" id=t1 data-endzeit="${vierBilderEinWort.zeit}"></p>
			</form>


			

		
</body>
</html>

