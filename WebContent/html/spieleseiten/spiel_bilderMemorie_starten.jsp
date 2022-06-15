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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spiel_bilderMemorie.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/spiel_bilderMemorie.js" defer></script>

    <title>Bildermemorie</title>
</head>
<body>

<!-- if else-Variablen definieren -->
<c:set var='time' value='${spielStartenBean.timer}'/>
<c:set var='gewertet' value='${spielStartenBean.gewertet}'/>
<c:set var='val' value='${spielStartenBean.schwierigkeit}'/>

<header>
    <h1>Bildermemorie</h1>
    <%@include file="../jspf/navigation.jspf" %>
</header>

<br>

<div id="temp" hidden></div>
<div id="nutzer" hidden>${nutzer.name}</div>
<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
<div id="timerID" hidden>${spielStartenBean.timer}</div>

<!-- Begin der FLEXBOX = Flex-Container -->
<div id="flexarea">

    <!-- Flex-Item 2 -->
    <article>
    	<h2 hidden>Viel Erfolg!</h2>
        <br>
        <div class="game">
            <div class="informationen" id="informationen">
                <button id="start">Start</button>
                <br>
                <div class="stats">

                    <c:choose>
                        <c:when test="${gewertet == 'gewertetAn'}">
                            <div class="versuche">Versuche: 0</div>
                        </c:when>
                    </c:choose>

                    <c:choose>
                        <c:when test="${time == 'timerAn'}">
                            <div class="zeit">Zeit: 0 Sekunden</div>
                        </c:when>
                    </c:choose>

                </div>
            </div>

            <div class="spielbrett-container" id="spielbrett-container">
                <button id="restartButton">Restart</button>
                <br>
                <div class="win"></div>
            </div>
        </div>

        <br><br><br>

        <c:choose>
        <c:when test="${val == 'leicht'}">
        <section class="spiel_bilderMemorieLeicht">
        <h2 hidden>Schwierigekeit: Leicht!</h2>
            </c:when>
            <c:when test="${val == 'mittel'}">
            <section class="spiel_bilderMemorieMittel">
            <h2 hidden>Schwierigekeit: Mittel!</h2>
                </c:when>
                <c:when test="${val == 'schwer'}">
                <section class="spiel_bilderMemorieSchwer">
                <h2 hidden>Schwierigekeit: Schwer!</h2>
                    </c:when>
                    </c:choose>


                    <div class="memorieKarte" data-bild="bild1">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild1ID}"
                             alt="bild1"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>
                    <div class="memorieKarte" data-bild="bild1">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild1ID}"
                             alt="bild1"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>

                    <div class="memorieKarte" data-bild="bild2">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild2ID}"
                             alt="bild2"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogoe"/>
                    </div>
                    <div class="memorieKarte" data-bild="bild2">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild2ID}"
                             alt="bild2"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>

                    <div class="memorieKarte" data-bild="bild3">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild3ID}"
                             alt="bild3"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>
                    <div class="memorieKarte" data-bild="bild3">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild3ID}"
                             alt="bild3"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>

                    <div class="memorieKarte" data-bild="bild4">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild4ID}"
                             alt="bild4"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>
                    <div class="memorieKarte" data-bild="bild4">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild4ID}"
                             alt="bild4"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>

                    <div class="memorieKarte" data-bild="bild5">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild5ID}"
                             alt="bild5"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>
                    <div class="memorieKarte" data-bild="bild5">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild5ID}"
                             alt="bild5"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>

                    <div class="memorieKarte" data-bild="bild6">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild6ID}"
                             alt="bild6"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>
                    <div class="memorieKarte" data-bild="bild6">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild6ID}"
                             alt="bild6"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>

                    <div class="memorieKarte" data-bild="bild7">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild7ID}"
                             alt="bild7"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>
                    <div class="memorieKarte" data-bild="bild7">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild7ID}"
                             alt="bild7"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>

                    <div class="memorieKarte" data-bild="bild8">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild8ID}"
                             alt="bild8"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>
                    <div class="memorieKarte" data-bild="bild8">
                        <img class="vorne"
                             src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild8ID}"
                             alt="bild8"/>
                        <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png" alt="bildLogo"/>
                    </div>


                    <c:choose>
                        <c:when test="${val == 'mittel' || val == 'schwer'}">

                            <div class="memorieKarte test" data-bild="bild9">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild9ID}"
                                     alt="bild9"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>
                            <div class="memorieKarte test" data-bild="bild9">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild9ID}"
                                     alt="bild9"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>

                            <div class="memorieKarte test" data-bild="bild10">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild10ID}"
                                     alt="bild10"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogoe"/>
                            </div>
                            <div class="memorieKarte test" data-bild="bild10">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild10ID}"
                                     alt="bild10"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>
                            <div class="memorieKarte" data-bild="bild11">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild11ID}"
                                     alt="bild11"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>
                            <div class="memorieKarte" data-bild="bild11">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild11ID}"
                                     alt="bild11"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>

                            <div class="memorieKarte" data-bild="bild12">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild12ID}"
                                     alt="bild12"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>
                            <div class="memorieKarte" data-bild="bild12">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild12ID}"
                                     alt="bild12"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>

                        </c:when>
                    </c:choose>


                    <c:choose>
                        <c:when test="${val == 'schwer'}">

                            <div class="memorieKarte" data-bild="bild13">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild13ID}"
                                     alt="bild13"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>
                            <div class="memorieKarte" data-bild="bild13">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild13ID}"
                                     alt="bild13"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>

                            <div class="memorieKarte" data-bild="bild14">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild14ID}"
                                     alt="bild14"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>
                            <div class="memorieKarte" data-bild="bild14">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild14ID}"
                                     alt="bild14"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>

                            <div class="memorieKarte" data-bild="bild15">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild15ID}"
                                     alt="bild15"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>
                            <div class="memorieKarte" data-bild="bild15">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild15ID}"
                                     alt="bild15"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>

                            <div class="memorieKarte" data-bild="bild16">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild16ID}"
                                     alt="bild16"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>
                            <div class="memorieKarte" data-bild="bild16">
                                <img class="vorne"
                                     src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild16ID}"
                                     alt="bild16"/>
                                <img class="hinten" src="${pageContext.request.contextPath}/bilder/logo.png"
                                     alt="bildLogo"/>
                            </div>

                        </c:when>
                    </c:choose>

                </section>
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