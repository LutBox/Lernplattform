<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="de">
<head>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/verwaltungsseiten/bildBearbeiten.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/verwaltungsskripte/bildBearbeiten.js" defer></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

    <title>Bilder bearbeiten</title>
</head>
<body>

<h1>Bild bearbeiten</h1>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>

<!-- Begin der FLEXBOX = Flex-Container -->
<div id="flexarea">
    
        <!-- Flex-Item 2 -->
    <article>
    	<div id="temp" hidden></div>
    	<h2 hidden>Bild bearbeiten</h2>
	
			<fieldset><legend id="bildBeschreibung">${bild.bildKategorie}</legend>

			<div class="dropdown">
  				<button class="dropbtn">Kategorie auswählen</button>
  				<br>
  				<div class="dropdown-content">  				
			  		<c:forEach var="kategorieListe" items="${kategorieListe}">  
			  			<input type="radio" name="Kategorien" class="kategorie" id="${kategorieListe.bildKategorie}" value="${kategorieListe.bildKategorie}">
                        <label for="${kategorieListe.bildKategorie}">${kategorieListe.bildKategorie}</label>
                        <br>      
        			</c:forEach>
        			
			  </div>
			</div>
			<br><br>	
			<img class="bild" alt="bild1" src="${pageContext.request.contextPath}/BildAnzeigenServlet?id=${bild.bildID}">
			<div id="bildID" hidden>${bild.bildID}</div>
			<br><br>	
			
			<form id="safe" method="post" action="${pageContext.request.contextPath}/AlleBilderAnzeigenServlet" enctype="multipart/form-data">
				  <button id="safe" name="submit" type="button">Speichern</button>
			</form>
			
			<form id="delete" method="post" action="${pageContext.request.contextPath}/AlleBilderAnzeigenServlet" enctype="multipart/form-data">
				  <button name="submit" type="submit">Bild löschen</button>
			</form>	
			
			<form id="abbruch" method="post" action="${pageContext.request.contextPath}/AlleBilderAnzeigenServlet" enctype="multipart/form-data">
				  <button name="submit" type="submit">Abbrechen</button>
			</form>	
			</fieldset>						
		
		
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