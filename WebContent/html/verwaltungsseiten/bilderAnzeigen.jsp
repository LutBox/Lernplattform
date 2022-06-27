<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="de">
<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css"/>
    <script src="${pageContext.request.contextPath}/js/standard.js" defer></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/verwaltungsseiten/bilderAnzeigen.css"/>
    <script src="${pageContext.request.contextPath}/js/verwaltungsskripte/bilderAnzeigen.js" defer></script>

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
    <div class="asideLinks">
        <h3>Bild hinzufügen</h3>
        Hinweis: <br>
        Ein Bild muss 128 * 128 Pixel groß sein.
        <form  method="post" action="${pageContext.request.contextPath}/html/verwaltungsseiten/bildHochladenFertig.jsp" enctype="multipart/form-data">
			<button id="neuesBild" name="submit" type="submit">Neues Bild hinzufügen</button>
		</form>	
		<br>
		<h3>Kategorie hinzufügen</h3>
		Hinweis: <br>
		Jede Kategorie muss mindestens 4 Bilder enthalten, damit alle Spiel voll funktionstauglich sind.
        <form  method="post" action="${pageContext.request.contextPath}/html/verwaltungsseiten/kategorieNeu.jsp" enctype="multipart/form-data">
			<button id="neueKategorie" name="submit" type="submit">Neue Kategorie hinzufügen</button>
		</form>
		<br>
		<h3>Kategorie löschen</h3>
		Hinweis: <br>
		Es müssen mindestens 16 Kategorien vorhanden sein.
        <form  method="post" action="${pageContext.request.contextPath}/html/verwaltungsseiten/kategorieEntfernen.jsp" enctype="multipart/form-data">
			<button id="kategorieEntfernen" name="submit" type="submit">Bestehende Kategorie löschen</button>
		</form>
	</div>	
    </aside>
    
        <!-- Flex-Item 2 -->
    <article>
    	<h2 hidden>Bild bearbeiten</h2>
    	

    	<button id="aktualisieren">Aktualisieren</button>
    	<br>
	
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
        
        <div>
        	<button id="alle">Alle auswählen</button>
        	<button id="keine">Alle abwählen</button>
        </div>
        <br>
        <div>
        <c:forEach var="kategorieListe" items="${kategorieListe}">        
        		<input class="kategorie" type="checkbox" name="${kategorieListe.bildKategorie}" id="${kategorieListe.bildKategorie}" value="${kategorieListe.bildKategorie}" checked="checked">
        		<label for="${kategorieListe.bildKategorie}">${kategorieListe.bildKategorie}</label>
        		<br>		
		</c:forEach>
		</div>
    </aside>
    
 </div>   
<!-- Ende der FLEXBOX -->

<br> <br> <br> <br>

<footer>
    <%@include file="../jspf/footer.jspf" %>
</footer>

</body>

</html>