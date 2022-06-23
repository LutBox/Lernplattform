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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

    <title>Kategorie hinzufügen</title>
</head>
<body>

<h1>Kategorie hinzufügen</h1>

	<nav>
		<%@include file="../jspf/navigation.jspf"%>
	</nav>

<!-- Begin der FLEXBOX = Flex-Container -->
<div id="flexarea">
    
        <!-- Flex-Item 2 -->
    <article>
    	<div id="temp" hidden></div>
    	<h2 hidden>Bild hochladen</h2>

		<fieldset><legend>Kategorie hinzufügen</legend>
				<form id="form1" method="post" action="${pageContext.request.contextPath}/KategorieNeuServlet">
				
				<br>
				<div>
					<label for="eingabeKategorie">Kategorie eingeben:</label>
	  				<input name="eingabeKategorie" type="text" id="eingabeKategorie"/><br><br>
				</div>
				<br>				
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