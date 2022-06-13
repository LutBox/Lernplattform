<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="de">
<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spiel_bilderOrdnen.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/spiel_bilderOrdnen.js" defer></script>

    <title>Bilder Ordnen</title>
</head>
<body>

<header>
    <h1>Bilder ordnen</h1>
    <%@include file="../jspf/navigation.jspf" %>
</header>

<!-- Daten aus Bean auslesen -->
<div id="temp" hidden></div>
<div id="nutzer" hidden>${nutzer.name}</div>
<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
<div id="timerID" hidden>${spielStartenBean.timer}</div>

<!-- if else-Variablen definieren -->
<c:set var='time' value='${spielStartenBean.timer}'/>
<c:set var='gewertet' value='${spielStartenBean.gewertet}'/>
<c:set var='val' value='${spielStartenBean.schwierigkeit}'/>

<!-- Begin der FLEXBOX = Flex-Container -->
<div id="flexarea">

    <%-- Flex-Item 1: Spalte Links
    <aside>
        <p>Text</p>
    </aside>
    --%>

    <!-- Flex-Item 2: Spalte Mitte -->
    <article>

        <br><br>
        <div class="controls" id="controls">
            <div id="buttonStart">
                <button id="start">Start</button>
            </div>
            <div id="buttonRestart" hidden>
                <button id="restartButton">Restart</button>
            </div>

            <div class="win"></div>
            <div class="stats">

                <c:choose>
                    <c:when test="${gewertet == 'gewertetAn'}">
                        <div class="versuche" id="versuche">Versuche: 0</div>
                    </c:when>
                </c:choose>

                <c:choose>
                    <c:when test="${time == 'timerAn'}">
                        <div class="zeit" id="zeit">Zeit: 0 Sekunden</div>
                    </c:when>
                </c:choose>

            </div>
        </div>

<br><br>

<section class="draggable-elements">

    <img class="draggable" draggable="true"
         src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild1ID}"
         alt="bild1" id="${spielBilderOrdnen.bild1Kategorie}"/>
    <img class="draggable" draggable="true"
         src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild2ID}"
         alt="bild2" id="${spielBilderOrdnen.bild2Kategorie}"/>
    <img class="draggable" draggable="true"
         src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild3ID}"
         alt="bild3" id="${spielBilderOrdnen.bild3Kategorie}"/>
    <img class="draggable" draggable="true"
         src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild4ID}"
         alt="bild4" id="${spielBilderOrdnen.bild4Kategorie}"/>
    <img class="draggable" draggable="true"
         src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild5ID}"
         alt="bild5" id="${spielBilderOrdnen.bild5Kategorie}"/>
    <img class="draggable" draggable="true"
         src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild6ID}"
         alt="bild6" id="${spielBilderOrdnen.bild6Kategorie}"/>
    <img class="draggable" draggable="true"
         src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild7ID}"
         alt="bild7" id="${spielBilderOrdnen.bild7Kategorie}"/>
    <img class="draggable" draggable="true"
         src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild8ID}"
         alt="bild8" id="${spielBilderOrdnen.bild8Kategorie}"/>

</section>

<section class="draggable-elements">
    <c:choose>
        <c:when test="${val == 'mittel' || val == 'schwer'}">

            <img class="draggable" draggable="true"
                 src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild9ID}"
                 alt="bild9" id="${spielBilderOrdnen.bild9Kategorie}"/>
            <img class="draggable" draggable="true"
                 src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild10ID}"
                 alt="bild10" id="${spielBilderOrdnen.bild10Kategorie}"/>
            <img class="draggable" draggable="true"
                 src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild11ID}"
                 alt="bild11" id="${spielBilderOrdnen.bild11Kategorie}"/>
            <img class="draggable" draggable="true"
                 src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild12ID}"
                 alt="bild12" id="${spielBilderOrdnen.bild12Kategorie}"/>

        </c:when>
    </c:choose>

    <c:choose>
        <c:when test="${val == 'schwer'}">

            <img class="draggable" draggable="true"
                 src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild13ID}"
                 alt="bild13" id="${spielBilderOrdnen.bild13Kategorie}"/>
            <img class="draggable" draggable="true"
                 src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild14ID}"
                 alt="bild14" id="${spielBilderOrdnen.bild14Kategorie}"/>
            <img class="draggable" draggable="true"
                 src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild15ID}"
                 alt="bild15" id="${spielBilderOrdnen.bild15Kategorie}"/>
            <img class="draggable" draggable="true"
                 src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild16ID}"
                 alt="bild16" id="${spielBilderOrdnen.bild16Kategorie}"/>

        </c:when>
    </c:choose>
</section>

<section class="droppable-elements">

    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild1Kategorie}">
        <span>${spielBilderOrdnen.bild1Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild2Kategorie}">
        <span>${spielBilderOrdnen.bild2Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild3Kategorie}">
        <span>${spielBilderOrdnen.bild3Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild4Kategorie}">
        <span>${spielBilderOrdnen.bild4Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild5Kategorie}">
        <span>${spielBilderOrdnen.bild5Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild6Kategorie}">
        <span>${spielBilderOrdnen.bild6Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild7Kategorie}">
        <span>${spielBilderOrdnen.bild7Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild8Kategorie}">
        <span>${spielBilderOrdnen.bild8Kategorie}</span></div>

</section>

<section class="droppable-elements">
    <c:choose>
        <c:when test="${val == 'mittel' || val == 'schwer'}">

            <br><br>
            <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild9Kategorie}">
                <span>${spielBilderOrdnen.bild9Kategorie}</span></div>
            <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild10Kategorie}">
                <span>${spielBilderOrdnen.bild10Kategorie}</span></div>
            <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild11Kategorie}">
                <span>${spielBilderOrdnen.bild11Kategorie}</span></div>
            <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild12Kategorie}">
                <span>${spielBilderOrdnen.bild12Kategorie}</span></div>

        </c:when>
    </c:choose>

    <c:choose>
        <c:when test="${val == 'schwer'}">

            <br><br>
            <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild13Kategorie}">
                <span>${spielBilderOrdnen.bild13Kategorie}</span></div>
            <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild14Kategorie}">
                <span>${spielBilderOrdnen.bild14Kategorie}</span></div>
            <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild15Kategorie}">
                <span>${spielBilderOrdnen.bild15Kategorie}</span></div>
            <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild16Kategorie}">
                <span>${spielBilderOrdnen.bild16Kategorie}</span></div>

        </c:when>
    </c:choose>
</section>


<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
</article>

<%-- Flex-Item 3: Spalte Rechts
<aside>
    <p>Text</p>
</aside>
--%>

</div>
<!-- Ende der FLEXBOX -->

<footer>
    <%@include file="../jspf/footer.jspf" %>
</footer>

</body>
</html>