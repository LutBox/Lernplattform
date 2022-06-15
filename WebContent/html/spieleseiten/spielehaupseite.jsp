<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="de">
<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spielehauptseite.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/spielehauptseite.js" defer></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

    <base href="${pageContext.request.requestURI}"/>

    <title>Games</title>
</head>
<body>

<header>
    <h1>Spieleübersicht</h1>
    <%@include file="../jspf/navigation.jspf" %>
</header>

<!-- Daten aus Bean auslesen -->
<div id="temp" hidden></div>
<div id="nutzer" hidden>${nutzer.name}</div>
<div id="schwierigkeit" hidden>${spielStartenBean.schwierigkeit}</div>
<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
<div id="timerID" hidden>${spielStartenBean.timer}</div>

<!-- Begin der FLEXBOX = Flex-Container -->
<div id="flexarea">

    <!-- Flex-Item 1 -->
    <aside>
        <h2>Top-News</h2>
        <p>Forum-Threads</p>
    </aside>

    <!-- Flex-Item 2 -->
    <article>
    	<h2 hidden>Spiel auswählen</h2>

        <form id="Spielstarten"
              action="${pageContext.request.contextPath}/SpielStartenServlet"
              method="post" accept-charset="UTF-8">

            <div class="spielart">

                    <%-- 
                    ---------- Mathe ---------- 
                    --%>

                    <div class="flip-card" id="MatheAuswahl">
                        <div class="flip-card-inner">
                        
                            <div class="flip-card-front">
                                <img src="../../bilder/mathe.png" alt="mathe" style="width:256px;height:256px;" id="KarteMathe">
                            </div>
                            
                            <div class="flip-card-back">
                                Schwierigkeit:<br>
                                <input type="radio" name="Schwierigkeit" id="leichtMathe" value="leicht" required>
                                <label for="leichtMathe">Leicht</label>

                                <input type="radio" name="Schwierigkeit" id="mittelMathe" value="mittel">
                                <label for="mittelMathe">Mittel</label>

                                <input type="radio" name="Schwierigkeit" id="schwerMathe" value="schwer">
                                <label for="schwerMathe">Schwer</label>

                                <br><br>

                                <div>
                                    Timer:<br>
                                    <input type="radio" name="Timer" id="timerAnMathe" value="timerAn" required checked="checked">
                                    <label for="timerAnMathe">An</label>

                                    <input type="radio" name="Timer" id="timerAusMathe" value="TimerAus" required>
                                    <label for="timerAusMathe">Aus</label>
                                </div>

                                <br>
                                <div>
                                    Gewertet:<br>
                                    <input type="radio" name="Gewertet" id="gewertetAnMathe" value="gewertetAn" checked="checked">
                                    <label for="gewertetAnMathe">An</label>

                                    <input type="radio" name="Gewertet" id="gewertetAusMathe" value="gewertetAus">
                                    <label for="gewertetAusMathe">Aus</label>
                                </div>

                                <br>

                                <button class="button" name="Spielart" id="mathe" value="mathe" type="submit">
                                	Starten!
                                </button>

                            </div>

                        </div>
                    </div>

                    <%-- 
                    ---------- 4 Bilder 1 Wort ---------- 
                    --%>

                    <div class="flip-card" id="BilderWortAuswahl">
                        <div class="flip-card-inner">
                        
                            <div class="flip-card-front">
                                <img src="../../bilder/bilderWort.png" alt="bilderWort" style="width:256px;height:256px;" id="KarteBilderWort">
                            </div>

                            <div class="flip-card-back">
                                Schwierigkeit:<br>
                                <input type="radio" name="Schwierigkeit" id="leichtBilderWort" value="leicht" required>
                                <label for="leichtBilderWort">Leicht</label>

                                <input type="radio" name="Schwierigkeit" id="mittelBilderWort" value="mittel">
                                <label for="mittelBilderWort">Mittel</label>

                                <input type="radio" name="Schwierigkeit" id="schwerBilderWort" value="schwer">
                                <label for="schwerBilderWort">Schwer</label>

                                <br><br>

                                <div>
                                    Timer:<br>
                                    <input type="radio" name="Timer" id="timerAnBilderWort" value="timerAn" required checked="checked">
                                    <label for="timerAnBilderWort">An</label>

                                    <input type="radio" name="Timer" id="timerAusBilderWort" value="TimerAus" required>
                                    <label for="timerAusBilderWort">Aus</label>
                                </div>

                                <br>
                                <div>
                                    Gewertet:<br>
                                    <input type="radio" name="Gewertet" id="gewertetAnBilderWort" value="gewertetAn" checked="checked">
                                    <label for="gewertetAnBilderWort">An</label>

                                    <input type="radio" name="Gewertet" id="gewertetAusBilderWort" value="gewertetAus">
                                    <label for="gewertetAusBilderWort">Aus</label>
                                </div>
                                <br>

                                <button class="button" name="Spielart" id="bilderWort" value="bilderWort" type="submit">
                                    Starten!
                                </button>

                            </div>

                        </div>
                    </div>

                    <%-- 
                    ---------- Bilder-Ordnen ---------- 
                    --%>

                    <div class="flip-card" id="BilderOrdnenAuswahl">
                        <div class="flip-card-inner">
                        
                            <div class="flip-card-front">
                                <img src="../../bilder/bilderOrdnen.png" alt="bilderOrdnen" style="width:256px;height:256px;" id="KarteBilderOrdnen">
                            </div>
                            <div class="flip-card-back">
                                Schwierigkeit:<br>
                                <input type="radio" name="Schwierigkeit" id="leichtBilderOrdnen" value="leicht" required>
                                <label for="leichtBilderOrdnen">Leicht</label>

                                <input type="radio" name="Schwierigkeit" id="mittelBilderOrdnen" value="mittel">
                                <label for="mittelBilderOrdnen">Mittel</label>

                                <input type="radio" name="Schwierigkeit" id="schwerBilderOrdnen" value="schwer">
                                <label for="schwerBilderOrdnen">Schwer</label>

                                <br><br>

                                <div>
                                    Timer:<br>
                                    <input type="radio" name="Timer" id="timerAnBilderOrdnen" value="timerAn" required checked="checked">
                                    <label for="timerAnBilderOrdnen">An</label>

                                    <input type="radio" name="Timer" id="timerAusBilderOrdnen" value="TimerAus" required>
                                    <label for="timerAusBilderOrdnen">Aus</label>
                                </div>

                                <br>
                                <div>
                                    Gewertet:<br>
                                    <input type="radio" name="Gewertet" id="gewertetAnBilderOrdnen" value="gewertetAn" checked="checked">
                                    <label for="gewertetAnBilderOrdnen">An</label>

                                    <input type="radio" name="Gewertet" id="gewertetAusBilderOrdnen" value="gewertetAus">
                                    <label for="gewertetAusBilderOrdnen">Aus</label>
                                </div>
                                <br>

                                <button class="button" name="Spielart" id="bilderOrdnen" value="bilderOrdnen" type="submit">
                                	Starten!
                                </button>

                            </div>

                        </div>
                    </div>

                    <%-- 
                    ---------- Bilder-Memorie ---------- 
                    --%>

                    <div class="flip-card" id="BilderMemorieAuswahl">
                        <div class="flip-card-inner">
                        
                            <div class="flip-card-front">
                                <img src="../../bilder/bildermemorie.png" alt="mathe" style="width:256px;height:256px;" id="KarteBilderMemorie">
                            </div>
                            
                            <div class="flip-card-back">
                                Schwierigkeit:<br>
                                <input type="radio" name="Schwierigkeit" id="leichtBilderMemorie" value="leicht" checked="checked" required>
                                <label for="leichtBilderMemorie">Leicht</label>

                                <input type="radio" name="Schwierigkeit" id="mittelBilderMemorie" value="mittel">
                                <label for="mittelBilderMemorie">Mittel</label>

                                <input type="radio" name="Schwierigkeit" id="schwerBilderMemorie" value="schwer">
                                <label for="schwerBilderMemorie">Schwer</label>

                                <br><br>

                                <div>
                                    Timer:<br>
                                    <input type="radio" name="Timer" id="timerAnBilderMemorie" value="timerAn" required checked="checked">
                                    <label for="timerAnBilderMemorie">An</label>

                                    <input type="radio" name="Timer" id="timerAusBilderMemorie" value="TimerAus" required>
                                    <label for="timerAusBilderMemorie">Aus</label>
                                </div>

                                <br>
                                <div>
                                    Gewertet:<br>
                                    <input type="radio" name="Gewertet" id="gewertetAnBilderMemorie" value="gewertetAn" checked="checked">
                                    <label for="gewertetAnBilderMemorie">An</label>

                                    <input type="radio" name="Gewertet" id="gewertetAusBilderMemorie"
                                           value="gewertetAus">
                                    <label for="gewertetAusBilderMemorie">Aus</label>
                                </div>

                                <br>

                                <button class="button" name="Spielart" id="bilderMemorie" value="bilderMemorie" type="submit">
                                	Starten!
                                </button>

                            </div>

                        </div>
                    </div>

                    <%-- 
                    ---------- Jump n Run ---------- 
                    --%>

                    <div class="flip-card" id="JumpnrunAuswahl">
                        <div class="flip-card-inner">
                        
                            <div class="flip-card-front">
                                <img src="../../bilder/jumpnrun.png" alt="jumpnrun" style="width:256px;height:256px;" id="KarteJumpnrun">
                            </div>
                            
                            <div class="flip-card-back">
                                Schwierigkeit:<br>
                                <input type="radio" name="Schwierigkeit" id="leichtJumpnrun" value="leicht" checked="checked" required>
                                <label for="leichtJumpnrun">Leicht</label>

                                <input type="radio" name="Schwierigkeit" id="mittelJumpnrun" value="mittel">
                                <label for="mittelJumpnrun">Mittel</label>

                                <input type="radio" name="Schwierigkeit" id="schwerJumpnrun" value="schwer">
                                <label for="schwerJumpnrun">Schwer</label>

                                <br><br>

                                <div>
                                    Timer:<br>
                                    <input type="radio" name="Timer" id="timerAnJumpnrun" value="timerAn" required>
                                    <label for="timerAnJumpnrun">An</label>

                                    <input type="radio" name="Timer" id="timerAusJumpnrun" value="TimerAus">
                                    <label for="timerAusJumpnrun">Aus</label>
                                </div>

                                <br>
                                <div>
                                    Gewertet:<br>
                                    <input type="radio" name="Gewertet" id="gewertetAnJumpnrun" value="gewertetAn" checked="checked">
                                    <label for="gewertetAnJumpnrun">An</label>

                                    <input type="radio" name="Gewertet" id="gewertetAusJumpnrun" value="gewertetAus">
                                    <label for="gewertetAusJumpnrun">Aus</label>
                                </div>

                                <br>

                                <button class="button" name="Spielart" id="Jumpnrun" value="jumpnrun" type="submit">
                                    Starten!
                                </button>

                            </div>

                        </div>
                    </div>

                    <%-- 
                    ---------- Zufall ---------- 
                    --%>

                    <div class="flip-card" id="ZufallAuswahl">
                        <div class="flip-card-inner">
                        
                            <div class="flip-card-front">
                                <img src="../../bilder/zufall.png" alt="zufall" style="width:256px;height:256px;" id="KarteZufall">
                            </div>
                            
                            <div class="flip-card-back">
                                Schwierigkeit:<br>
                                <input type="radio" name="Schwierigkeit" id="leichtZufall" value="leicht" checked="checked" required>
                                <label for="leichtZufall">Leicht</label>

                                <input type="radio" name="Schwierigkeit" id="mittelZufall" value="mittel">
                                <label for="mittelZufall">Mittel</label>

                                <input type="radio" name="Schwierigkeit" id="schwerZufall" value="schwer">
                                <label for="schwerZufall">Schwer</label>

                                <br><br>
								
                                <div id="ZufallTimer">
                                    Timer:<br>
                                    <input type="radio" name="Timer" id="timerAnZufall" value="timerAn" required>
                                    <label for="timerAnZufall">An</label>

                                    <input type="radio" name="Timer" id="timerAusZufall" value="TimerAus">
                                    <label for="timerAusZufall">Aus</label>
                                </div>

                                <br>
                                <div id="ZufallGewertet">
                                    Gewertet:<br>
                                    <input type="radio" name="Gewertet" id="gewertetAnZufall" value="gewertetAn" checked="checked">
                                    <label for="gewertetAnZufall">An</label>

                                    <input type="radio" name="Gewertet" id="gewertetAusZufall" value="gewertetAus">
                                    <label for="gewertetAusZufall">Aus</label>
                                </div>

                                <br>

                                <button class="button" name="Spielart" id="zufall" value="zufall" type="submit">
                                    Starten!
                                </button>

                            </div>

                        </div>
                    </div>

            </div>

        </form>
        
        <button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>

    </article>
    <!-- Flex-Item 3 -->
    <aside>
        <h3>Beschreibung</h3>
        <br>
        <div id="spieleBeschreibung"></div>
    </aside>

</div>
<!-- Ende der FLEXBOX -->

<br> <br> <br> <br>

<footer>
    <%@include file="../jspf/footer.jspf" %>
</footer>

</body>

</html>