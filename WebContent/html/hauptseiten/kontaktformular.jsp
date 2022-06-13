
<%--
Erstellt von Zohal Mohammadi
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hauptseiten/kontaktformular.css" />

<base href="${pageContext.request.requestURI}" />
<meta charset="UTF-8">
<title>Kontaktformular</title>
</head>
<body>
	<header>

		<h1>Kontaktformular</h1>	
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	
	<!-- Flex-Item 1 -->
	<div id="flexarea">
		
		
		<!-- Flex-Item 2 -->
		<article>
		
		


    <form method="post" action="../../KontaktanfrageServlet">
    <div class="formular">
    <h1> Kontaktformular</h1>
    
    
    	<p>Vorname:<br> <input type="text" name="vorname" size ="35" maxlength="40" placeholder="Ihr Vorname" autofocus></p>
        <p> Nachname: <br><input type ="text" name="nachname" size="35" maxlength="40" placeholder="Ihr Nachname" autofocus ></p>
        <p>E-Mail:<br><input type="text" name="E-mail" size="30" maxlength="35" placeholder="Ihre E-Mail" autofocus></p>
        <p> Ihre Anligen an uns: </br>
        <textarea  name ="Use_angabe" rows ="10" cols="50" autofocus maxlength="500"> </textarea>
        </p>
        
        
        
        <button type ="submit" name="sendebutton" value="submit" autofocus >absenden</button>
        
        
        </div>
	</form>
	
	<button type="button" class="goToTopButton" id="goToTopButton" >Seitenanfang</button>
	
	</article>
	
		
		
	</div>
	<!-- Ende der FLEXBOX -->
	<br> <br> <br> <br>
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>