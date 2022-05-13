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
<title>Upload</title>
</head>
<body>

		<h1>Bild erfolgreich hochgeladen</h1>

<br><p>Datenbankeintrag:
<br><em>Tabelle Bild - ID:</em>${datenDB.bild1ID}
<br><em>Tabelle Bild - Kategorie:</em>${datenDB.bild1Kategorie}
<br><em>Tabelle Bild - Stream:</em>${datenDB.bild1Stream}
<br><em>Tabelle Bild - Bild:</em><img src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${datenDB.bild1ID}"></p>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>  

</body>
</html>