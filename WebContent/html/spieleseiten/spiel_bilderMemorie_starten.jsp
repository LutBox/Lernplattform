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

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>

	<br><br>

	  <section class="memory-game">
    <div class="memory-card" data-framework="aurelia">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild1ID}" alt="Aurelia" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>
    <div class="memory-card" data-framework="aurelia">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild1ID}" alt="Aurelia" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>

    <div class="memory-card" data-framework="vue">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild2ID}" alt="Vue" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>
    <div class="memory-card" data-framework="vue">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild2ID}" alt="Vue" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>

    <div class="memory-card" data-framework="angular">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild3ID}" alt="Angular" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>
    <div class="memory-card" data-framework="angular">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild3ID}" alt="Angular" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>

    <div class="memory-card" data-framework="ember">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild4ID}" alt="Ember" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>
    <div class="memory-card" data-framework="ember">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild4ID}" alt="Ember" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>

    <div class="memory-card" data-framework="backbone">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild5ID}" alt="Backbone" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>
    <div class="memory-card" data-framework="backbone">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild5ID}" alt="Backbone" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>

    <div class="memory-card" data-framework="react">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild6ID}" alt="React" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>
    <div class="memory-card" data-framework="react">
      <img class="front-face" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${spielBilderMemorieBean.bild6ID}" alt="React" />
      <img class="back-face" src="${pageContext.request.contextPath}/css/spieleseiten/logo.png" alt="JS Badge" />
    </div>
  </section>

  <script src="scripts.js"></script>

</body>
</html>