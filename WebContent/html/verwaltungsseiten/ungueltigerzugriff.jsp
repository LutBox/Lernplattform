<%-- @author Merlin --%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spielehauptseite.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spielehauptseite.js" defer></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>
<title>Ungültiger Zugriff</title>
</head>
<body>
	<h1>Fehler</h1>
	<p>Bitte melden sie sich für diese Aktion mit dem Entsprechenden Konto an.</p>
	<ul>
		<li><a href="../../index.jsp">Startseite</a></li>
		<li><a href="../nutzerseiten/anmeldung.jsp">Anmelden</a></li>
		<li><a href="../nutzerseiten/registrierung.jsp">Registrieren</a></li>
	</ul>
	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>