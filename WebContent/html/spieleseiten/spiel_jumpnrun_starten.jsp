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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spiel_jumpnrun.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/spiel_jumpnrun.js" defer></script>

    <title>Jump n Run</title>
</head>
<body>

<header>
    <h1>Jump n Run</h1>
    <%@include file="../jspf/navigation.jspf" %>
</header>

<!-- Daten aus Bean auslesen -->
<div id="temp" hidden></div>
<div id="nutzer" hidden>${nutzer.name}</div>
<div id="schwierigkeit" hidden>${spielStartenBean.schwierigkeit}</div>
<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
<div id="timerID" hidden>${spielStartenBean.timer}</div>

<!-- if else-Variablen definieren -->
<c:set var='time' value='${spielStartenBean.timer}'/>
<c:set var='gewertet' value='${spielStartenBean.gewertet}'/>

<!-- Begin der FLEXBOX = Flex-Container -->
<div id="flexarea">

    <!-- Flex-Item 2 -->
    <article>

        <br>

        <div id="infos">
            <c:choose>
                <c:when test="${gewertet == 'gewertetAn'}">
                    <span id="scoreLayout">Punkte: <b id="scoreSpan"></b></span>
                </c:when>
                <c:when test="${gewertet == 'gewertetAus'}">
                    <span id="scoreLayout" hidden>Punkte: <b id="scoreSpan"></b></span>
                </c:when>
            </c:choose>

            <span id="lebenLayout">Verbleibende Leben: <b id="leben"></b></span>

            <c:choose>
                <c:when test="${time == 'timerAn'}">
                    <span id="zeitLayout">Zeit: <b id="zeit"></b></span>
                </c:when>
                <c:when test="${time == 'timerAus'}">
                    <span id="zeitLayout" hidden>Zeit: <b id="zeit"></b></span>
                </c:when>
            </c:choose>
        </div>

        <br><br>

        <div class="game">
            <div id="spielVorbei" hidden>
            
                <br><br><br>Verloren!<br>
                
                <div id="buttonRestart">
                    <button onClick="window.location.reload();" id="restartButton">Restart</button>
                </div>
            </div>

            <img alt="figur" id="figur" src="bilder/jumpnrun/figur1.png"/>
            <img alt="vogel" id="vogel" src="bilder/jumpnrun/vogel1.png"/>
            <img alt="stein" id="stein" src="bilder/jumpnrun/stein1.png"/>
        </div>

        <div hidden>
            Zeit-Stein: <span id="timerStein"></span> <br>
            Zeit-Vogel: <span id="timerVogel"></span> <br>
            Stone left: <span id="steinLinks"></span> <br>
            Vogel left: <span id="vogelLinks"></span> <br>
        </div>

        <br>

        <div id="buttonStart">
            <button id="start">Start</button>
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