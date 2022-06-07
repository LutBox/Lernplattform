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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spiel_mathe.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/spiel_mathe.js" defer></script>

    <title>Spiel Starten</title>
</head>
<body>

<header>
    <h1>Mathespiel starten</h1>
    <%@include file="../jspf/navigation.jspf" %>
</header>

<!-- Daten aus Bean auslesen -->
<div id="temp" hidden></div>
<div id="nutzer" hidden>${nutzer.name}</div>
<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
<div id="timerID" hidden>${spielStartenBean.timer}</div>
<div id="schwierigkeit" hidden>${spielStartenBean.schwierigkeit}</div>

<!-- if else-Variablen definieren -->
<c:set var='time' value='${spielStartenBean.timer}'/>
<c:set var='gewertet' value='${spielStartenBean.gewertet}'/>
<c:set var='val' value='${spielStartenBean.schwierigkeit}'/>

<!-- Begin der FLEXBOX = Flex-Container -->
<div id="flexarea">

    <!-- Flex-Item 2 -->
    <article>

        <div id="spiel">

            <c:choose>
                <c:when test="${gewertet == 'gewertetAn'}">
                    <div id="punktezahl">
                        Punkte: <span id="punkte">0</span>
                    </div>
                </c:when>
            </c:choose>

            <div id="richtig">
                Richtig!
            </div>

            <div id="falsch">
                Probier es nochmal!
            </div>

            <br><br><br><br>

            <div id="aufgabe">
                <!-- Rechenaufgabe -->
            </div>

            <br><br><br>

            <div id="ergebnisse">
                <div id="box1" class="box"></div>
                <div id="box2" class="box"></div>
                <div id="box3" class="box"></div>
                <div id="box4" class="box"></div>
            </div>

            <br>

            <button id="start-restart">
                Start
            </button>

            <c:choose>
                <c:when test="${gewertet == 'gewertetAn'}">
                    <div id="verbleibendeZeit">
                        Zeit: <span id="verbleibendeZeitWert">  60</span>
                    </div>
                </c:when>
            </c:choose>

            <div id="spielVorbei">
                <!-- Pop-Up mit Punkten -->
            </div>

        </div>
        
        <button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>

    </article>

</div>
<!-- Ende der FLEXBOX -->

<br> <br> <br> <br>

<footer>
    <%@include file="../jspf/footer.jspf" %>
</footer>

</body>
</html>