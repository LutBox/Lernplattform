<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="de">
<head>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/verwaltungsseiten/bildBearbeiten.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css"/>
    <script src="${pageContext.request.contextPath}/js/standard.js" defer></script>

    <title>Kategorie löschen</title>
</head>
<body>
<%@include file="../jspf/aktuellerNutzer.jspf"%>
<header>
	<h1>Kategorie löschen</h1>
	<%@include file="../jspf/navigation.jspf"%>
</header>

<!-- Begin der FLEXBOX = Flex-Container -->
<div id="flexarea">
    
        <!-- Flex-Item 2 -->
    <article>
    	<div id="temp" hidden></div>
    	<h2 hidden>Bild hochladen</h2>

		<fieldset><legend>Kategorie löschen</legend>
				<form id="form1" method="post" action="${pageContext.request.contextPath}/KategorieEntfernenServlet">
						
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
				  <button id="absenden" name="submit" type="submit">Absenden</button>
				</div>
				
				<br>
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