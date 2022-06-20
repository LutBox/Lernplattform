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
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/verwaltungsseiten/bilderAnzeigen.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/verwaltungsskripte/bilderAnzeigen.js" defer></script>

    <base href="${pageContext.request.requestURI}"/>

    <title>Bilder anzeigen</title>
</head>
<body>

<h1>Bilder anzeigen</h1>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>

<!-- Begin der FLEXBOX = Flex-Container -->
<div id="flexarea">

    <!-- Flex-Item 1 -->
    <aside>
        <h2>Hinweis!</h2>
        <p>1. Es müssen mindestens 16 Kategorien vorhanden sein.</p>
        <p>2. Jede Kategorie muss mindestens 4 Bilder enthalten, damit alle Spiel voll funktionstauglich sind.</p>
        <p>3. Ein Bild muss 128 * 128 Pixel groß sein.</p>
    </aside>
    
        <!-- Flex-Item 2 -->
    <article>
    	<h2 hidden>Bild bearbeiten</h2>


	<div class="bilderKategorie">
	<c:forEach var="bilderListe" items="${bilderListe}">
		
		<div class="feld ${bilderListe.bildKategorie}">
			
			<form method="post" action="../../BildBearbeitenServlet">
				<input type="hidden" name="bildID" value="${bilderListe.bildID}" />
				<div class="bildBeschreibung">${bilderListe.bildKategorie}</div>
				
				<img class="bild" alt="bild1" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${bilderListe.bildID}">			
				<br>
			
				<button type="submit" class="bearbeitenButton" title="Bild bearbeiten">
					<img class="bearbeitenBild" src="../../bilder/verwaltung/bearbeiten.png" alt="bearbeitenBild"/>
				</button>
				
			</form>
			
			<br>
		</div>
		
	</c:forEach>
	</div>

<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>

    </article>
    <!-- Flex-Item 3 -->
    <aside>
        <h3>Kategorien</h3>
        <br>
        <c:forEach var="kategorieListe" items="${kategorieListe}">        
        		<input class="kategorie" type="checkbox" name="${kategorieListe.bildKategorie}" id="${kategorieListe.bildKategorie}" value="${kategorieListe.bildKategorie}" checked="checked">
        		<label for="${kategorieListe.bildKategorie}">${kategorieListe.bildKategorie}</label>
        		<br>		
		</c:forEach>
	
    </aside>

</div>
<!-- Ende der FLEXBOX -->

<br> <br> <br> <br>

<footer>
    <%@include file="../jspf/footer.jspf" %>
</footer>

</body>

</html>