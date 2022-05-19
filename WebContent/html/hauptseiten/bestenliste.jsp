<%--
Erstellt von Lukas Theinert
--%>

<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hauptseiten/bestenliste.css" />
<%--
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bestenliste.js" defer></script>
--%>
<base href="${pageContext.request.requestURI}" />
<meta charset="ISO-8859-1">
<title>Bestenliste</title>
</head>
<body>

	<h1>Bestenliste</h1>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>

            <button name="aktualisieren" id="aktualisieren" type="button">Bestenliste aktualisieren!</button>
            <br><br><br>


        <h3>Bestenliste: Bildermemorie</h3>

        <div>
            <table>
                <thead>
                <tr>
                    <th>Platz</th>
                    <th>Name</th>
                    <th>Punkte</th>
                    <th>Gespielte Spiele</th>
                    <th>Durchschnittliche Zeit: Leicht</th>
                    <th>Durchschnittliche Zeit: Mittel</th>
                    <th>Durchschnittliche Zeit: Schwer</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="b" items="${bestenlisteBilderMemorieAjax}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${b.nutzer}</td>
                        <td>${b.punkte}</td>
                        <td>${b.spieleInsgesamt}</td>
                        <td>${b.durchschnittZeitLeicht}sek</td>
                        <td>${b.durchschnittZeitMittel}sek</td>
                        <td>${b.durchschnittZeitSchwer}sek</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

</body>
</html>