<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>VierBilderEinWort</title>
</head>
<body>
${vierBilderEinWort.richtigeErgebnis}/${vierBilderEinWort.versuche}
<img src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild1}" alt="bild1"> 
<img src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild2}" alt="bild2"> 
<img src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild3}" alt="bild3"> 
<img src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielVierBilderEinWortBean.bild4}" alt="bild4"> 

<form action="VierBilderEinWortServlet" method="post">
<input type ="text" name="userEingabe" placeholder="Bitte das Wort erraten" required="required" max="30"> 
<input type="submit" value="weiter">

<input type ="hidden"  name ="loesung" value="${requestScope.spielVierBilderEinWortBean.wort}">

mit der Methode soll doch dieser Servlet gar nicht aufgerufen werden
</form>
</body>
</html>

/* 4 runden Spielen * /
// Ein Servlet was schaut ob die L�sung gestimmt hat und punkte addieren 
// id speichern
// Pr�fen ist L�sung geleich userEingabe 
// Zwei Variable
// F�r das neue Spiel die Variable zur�cksetzen 
// Ein Sevlet oder JSP: Um den User zu zeigen, dass er gewonnen hat
// Problem: Begriff Ids in session speichern
//Idee: Java Script die Zeit aus dem Session �bergeben