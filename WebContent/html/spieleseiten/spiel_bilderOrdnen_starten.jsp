<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spiel_bilderOrdnen.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spiel_bilderOrdnen.js" defer></script>

<title>Bilder Ordnen</title>
</head>
<body>

	<header>
		<h1>Bilder ordnen</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>

<div id="temp" hidden></div>
<div id="nutzer" hidden>${nutzer.name}</div>
<div id="gewertet" hidden>${spielStartenBean.gewertet}</div>
<div id="timerID" hidden>${spielStartenBean.timer}</div>

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
            <div class="controls" id = "controls">
                <div id="buttonStart"><button id="start">Start</button></div>
                <div id="buttonRestart" hidden><button onClick="window.location.reload();" id="restartButton">Restart</button></div>
                
                <div class="win"></div>  
                <div class="stats">
                
                <c:choose> 
  					<c:when test="${gewertet == 'gewertetAn'}">
                <div class="moves" id="moves">Versuche: 0</div>
                      </c:when>
					</c:choose>

                      <c:choose> 
  					<c:when test="${time == 'timerAn'}">
                    <div class="timer" id="timer">Zeit: 0 Sekunden</div>
                      </c:when>
					</c:choose>
					
                </div>
            </div>
            <%--
            <div class="board-container" id="board-container">
            	<button onClick="window.location.reload();" id="restartButton">Restart</button><br>
            <div class="win"></div> 
             --%>
            </div>
        <br><br>
		
  <section class="draggable-elements">
       
  <img class="bild1 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild1ID}" id="${spielBilderOrdnen.bild1Kategorie}" />
  <img class="bild2 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild2ID}" id="${spielBilderOrdnen.bild2Kategorie}" />
  <img class="bild3 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild3ID}" id="${spielBilderOrdnen.bild3Kategorie}" />
  <img class="bild4 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild4ID}" id="${spielBilderOrdnen.bild4Kategorie}" />
  <img class="bild5 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild5ID}" id="${spielBilderOrdnen.bild5Kategorie}" />
  <img class="bild6 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild6ID}" id="${spielBilderOrdnen.bild6Kategorie}" />
  <img class="bild7 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild7ID}" id="${spielBilderOrdnen.bild7Kategorie}" />
  <img class="bild8 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild8ID}" id="${spielBilderOrdnen.bild8Kategorie}" />  
  
  </section>
  
  <section class="draggable-elements">
  <c:choose> 
  <c:when test="${val == 'mittel' || val == 'schwer'}">
    
  <img class="bild9 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild9ID}" id="${spielBilderOrdnen.bild9Kategorie}" />
  <img class="bild10 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild10ID}" id="${spielBilderOrdnen.bild10Kategorie}" />
  <img class="bild11 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild11ID}" id="${spielBilderOrdnen.bild11Kategorie}" />
  <img class="bild12 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild12ID}" id="${spielBilderOrdnen.bild12Kategorie}" />
 
  </c:when>
  </c:choose>
  
  <c:choose> 
  <c:when test="${val == 'schwer'}">
  
  <img class="bild13 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild13ID}" id="${spielBilderOrdnen.bild13Kategorie}" />
  <img class="bild14 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild14ID}" id="${spielBilderOrdnen.bild14Kategorie}" />
  <img class="bild15 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild15ID}" id="${spielBilderOrdnen.bild15Kategorie}" />
  <img class="bild16 draggable" draggable="true" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderOrdnen.bild16ID}" id="${spielBilderOrdnen.bild16Kategorie}" />     
  
  </c:when>
  </c:choose>
  </section> 
  
  <section class="droppable-elements">
  
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild1Kategorie}"><span>${spielBilderOrdnen.bild1Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild2Kategorie}"><span>${spielBilderOrdnen.bild2Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild3Kategorie}"><span>${spielBilderOrdnen.bild3Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild4Kategorie}"><span>${spielBilderOrdnen.bild4Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild5Kategorie}"><span>${spielBilderOrdnen.bild5Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild6Kategorie}"><span>${spielBilderOrdnen.bild6Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild7Kategorie}"><span>${spielBilderOrdnen.bild7Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild8Kategorie}"><span>${spielBilderOrdnen.bild8Kategorie}</span></div>       

</section>

<section class="droppable-elements"> 
  <c:choose> 
  <c:when test="${val == 'mittel' || val == 'schwer'}">
    
    <br><br> 
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild9Kategorie}"><span>${spielBilderOrdnen.bild9Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild10Kategorie}"><span>${spielBilderOrdnen.bild10Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild11Kategorie}"><span>${spielBilderOrdnen.bild11Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild12Kategorie}"><span>${spielBilderOrdnen.bild12Kategorie}</span></div>  

  </c:when>
  </c:choose>
  
  <c:choose> 
  <c:when test="${val == 'schwer'}">

    <br><br>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild13Kategorie}"><span>${spielBilderOrdnen.bild13Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild14Kategorie}"><span>${spielBilderOrdnen.bild14Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild15Kategorie}"><span>${spielBilderOrdnen.bild15Kategorie}</span></div>
    <div class="droppable" data-draggable-id="${spielBilderOrdnen.bild16Kategorie}"><span>${spielBilderOrdnen.bild16Kategorie}</span></div>  
    
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
		<%@include file="../jspf/footer.jspf"%>
	</footer>

</body>
</html>