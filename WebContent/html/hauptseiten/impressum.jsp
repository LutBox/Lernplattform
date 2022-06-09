
<%--
Erstellt von Zohal Mohammadi
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/standard.js" defer></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hauptseiten/impressum.css" />


<base href="${pageContext.request.requestURI}" />
<meta charset="UTF-8">
<title>Impressum</title>
</head>
<body>

	<header>
		<h1>Impressum</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>

	<!-- Flex-Item 1 -->
	<div id="flexarea">



		<!-- Flex-Item 2 -->
		<article>


    <div>
			<p class="adresse">
				<strong>Adresse</strong>
			</p>
			<p class="name">Lernplattform Gmbh</p>
			<p class="strasse">Beispielsstraße 39</p>
			<p class="plz">85055 Ingolstadt
			</p>
			<p class="land">Deutschland</p>
			<p class="kontakt">
				<strong>Kontakt</strong>
			</p>
			<P class="zeit">Uns erreichen Sie montags bis freitags von 8:00 bis 12:00 Uhr</P>
			<p class="num">Tel.IT Support: +49 176-555-53</p>
			
			
			
      </div>
			<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>

		</article>
		<!-- Flex-Item 3 -->


	</div>
	<!-- Ende der FLEXBOX -->
	<br>
	<br>
	<br>
	<br>
	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>