<%--
Erstellt von Lukas Theinert
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spiel_bilderMemorie.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spiel_bilderMemorie.js" defer></script>


<title>Bildermemorie</title>
</head>
<body>

	<h1>Bildermemorie</h1>
	
	<br>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>

	<br>
	
	<div class="game">
            <div class="controls">
                <button>Start</button><br>
                <div class="stats">
                    <div class="moves">0 moves</div>
                    <div class="timer">time: 0 sec</div>
                </div>
            </div>
            <div class="board-container">
                <div class="win"></div>
            </div>
        </div>
	
	<br><br><br><br><br><br>

	  <section class="spiel_bilderMemorie">
    <div class="memorieKarte" data-framework="bild1">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild1ID}" alt="bild1" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>
    <div class="memorieKarte" data-framework="bild1">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild1ID}" alt="bild1" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>

    <div class="memorieKarte" data-framework="bild2">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild2ID}" alt="bild2" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogoe" />
    </div>
    <div class="memorieKarte" data-framework="bild2">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild2ID}" alt="bild2" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>

    <div class="memorieKarte" data-framework="bild3">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild3ID}" alt="bild3" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>
    <div class="memorieKarte" data-framework="bild3">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild3ID}" alt="bild3" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>

    <div class="memorieKarte" data-framework="bild4">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild4ID}" alt="bild4" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>
    <div class="memorieKarte" data-framework="bild4">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild4ID}" alt="bild4" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>

    <div class="memorieKarte" data-framework="bild5">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild5ID}" alt="bild5" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>
    <div class="memorieKarte" data-framework="bild5">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild5ID}" alt="bild5" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>

    <div class="memorieKarte" data-framework="bild6">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild6ID}" alt="bild6" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>
    <div class="memorieKarte" data-framework="bild6">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild6ID}" alt="bild6" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>
    
    <div class="memorieKarte" data-framework="bild7">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild7ID}" alt="bild7" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>
    <div class="memorieKarte" data-framework="bild7">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild7ID}" alt="bild7" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>

    <div class="memorieKarte" data-framework="bild8">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild8ID}" alt="bild8" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>
    <div class="memorieKarte" data-framework="bild8">
      <img class="vorne" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild8ID}" alt="bild8" />
      <img class="hinten" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="bildLogo" />
    </div>    
  </section>



</body>
</html>