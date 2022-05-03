<%--
Erstellt von Lukas Theinert
--%>

<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta charset="ISO-8859-1">
<title>Mathespiel</title>
</head>
<body>

	<h1>Viel Spaß!</h1>

	<br>Schwierigkeitsgrad aus Bean: ${spielStartenBean.schwierigkeit}
	</p>

	<br>
	<p>Aufgabe 1: ${spielMatheBean.zahl1} + ${spielMatheBean.zahl2}=</p>

	<form id="Spielstarten"
		action="${pageContext.request.contextPath}/SpielMatheErgebnisServlet"
		method="post" accept-charset="UTF-8">
		
		<div>
			<input name="NutzerErgebnis1" id="ne1" type="number" required>
		</div>

		<br>
		<button name="spielen" type="submit">Fertig!</button>

	</form>




</body>
</html>