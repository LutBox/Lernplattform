<%--
Erstellt von Lukas Theinert
--%>

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="de">
<head>

	<%--
	defer -> Skript wird parallel gedownloaded und erst ausgeführt, wenn Seite seite ferti geparsed ist
	async -> Skript wird parallel gedownloaded und ausgeführt, sobald verfügbar (während dem Parsen)
	nichts -> Skript wird sofort ausgeführt, wodurch Analyse blockiert wird 
	--%>
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css"/>
    <script src="${pageContext.request.contextPath}/js/standard.js" defer></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hauptseiten/bestenliste.css"/>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>

    <base href="${pageContext.request.requestURI}"/>

    <title>Lernplattform</title>
</head>

<body>

<noscript>Sie haben JavaScript deaktiviert!</noscript>

<header>
    <h1>Lernplattform</h1>
    <%@include file="html/jspf/navigation.jspf" %>
</header>

<%@include file="html/jspf/aktuellerNutzer.jspf"%>

<div id="content">
    <!-- Begin der FLEXBOX = Flex-Container -->
    <div id="flexarea">

        <!-- Flex-Item 1 -->
        <aside>
            <h2>Top-News</h2>
            <c:forEach items="${neuigkeiten}" var="neuigkeit">
				<div class="neuigkeit">
					<p>
						<c:out value="${neuigkeit.nachricht}"></c:out>
					</p>
					<p class="zeitstempel">
						<c:out value="${neuigkeit.zeitstempel}"></c:out>
					</p>
					<br />
					<hr class="neuigkeitentrenner" />
					<br />
				</div>
			</c:forEach>
        </aside>

        <!-- Flex-Item 2 -->
        <article>
            <h2>Willkommen auf der Lernplattform!</h2>
            <p>Hier kannst du die neusten und coolsten Spiele spielen!</p>
            <p>Melde dich an, um eine Auswahl aller einzelnen Spiele zu erhalten!</p>
            <p>Beweise dich, sammle so viele Punkte wie möglich und werde Erster!</p>
            <p>Unter dem Begriff Lernplattform bzw. Learning Management System versteht man ein Softwaresystem, das unter einer zentralen Oberfläche mehrere aufgabenspezifische Teilprogramme integriert, mit denen verschiedene Lernszenarien unterstützt werden. Ausgehend vom ursprünglichen E-Learning-Ansatz hat sich der Konsens entwickelt, dass das sogenannte Blended Learning die Lernaktivitäten der meisten Anwender am besten unterstützt, weswegen aktuell die meisten LMS diesen Ansatz verfolgen. Gemeinsam ist all diesen Lernumgebungen, dass sie Werkzeuge zur Erstellung, Kommunikation und Verwaltung von Lerninhalten, sowie zur Koordination von web-basierten Lernangeboten und zur Beurteilung der Lernenden enthalten.</p>

            <button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>

        </article>

        <!-- Flex-Item 3 -->
        <aside>

            <h3>Top 3 Spieler</h3>
            <p id="besteSpieler">Listeneinträge</p>

            <h3>Beliebteste Spiele</h3>
            <p id="beliebtesteSpiele">Listeneinträge</p>

        </aside>

    </div>
    <!-- Ende der FLEXBOX -->
    
    <br> <br> <br> <br>
    
    <footer>
        <%@include file="html/jspf/footer.jspf" %>
    </footer>
    
</div>

</body>
</html>