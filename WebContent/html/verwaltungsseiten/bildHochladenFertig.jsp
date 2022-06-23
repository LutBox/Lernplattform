<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="de">
<head>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/verwaltungsseiten/bildBearbeiten.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/verwaltungsskripte/bildHochladen.js" defer></script>
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

    <title>Bilder hochladen</title>
</head>
<body>

<h1>Bild hochladen</h1>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>

<!-- Begin der FLEXBOX = Flex-Container -->
<div id="flexarea">
    
        <!-- Flex-Item 2 -->
    <article>
    	<div id="temp" hidden></div>
    	<h2 hidden>Bild hochladen</h2>

			<fieldset><legend>Bild hochladen</legend>
				<form id="form1" method="post" action="${pageContext.request.contextPath}/BildHochladenServlet" enctype="multipart/form-data">
				
				<div>
				  <label for="kategorieWahl">Kategorien:</label>
				  <select name="kategorieWahl" id="kategorieWahl" size="1">
					<c:forEach var="kategorieListe" items="${kategorieListe}">  
                        <option class="kategorie" id="${kategorieListe.bildKategorie}" value="${kategorieListe.bildKategorie}">${kategorieListe.bildKategorie}</option>     
        			</c:forEach>
				  </select>
				</div>
				<br>
				
				<div>
				  <label for="image">Bild hochladen:</label>
				  <input type="file" name="image" id="image" accept="image/*" required>
				  <br><br>
				  <img id="output" alt="image" src="../../bilder/verwaltung/archivieren.png"/>
				</div>
				<br>
				
				<div>
				  <button id="absenden" name="submit" type="submit">Absenden</button>
				</div>
				<br>					
			</form>
				
		<form id="abbruch" method="post" action="${pageContext.request.contextPath}/html/verwaltungsseiten/spielekonfigurator.jsp" enctype="multipart/form-data">
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