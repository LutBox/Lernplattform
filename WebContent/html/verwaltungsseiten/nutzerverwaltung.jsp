<%-- @author Merlin --%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../../css/verwaltungsseiten/nutzerverwaltungStil.css" />
	<script type="text/javascript" src="../../js/verwaltungsskripte/nutzerverwaltung.js"></script>
	<script type="text/javascript" src="../../js/standard.js" defer></script>
	<%@include file="../jspf/noSkript.jspf"%>
	<meta charset="UTF-8">
	<title>Nutzerverwaltung</title>
</head>
<body>
	<header>
		<h1>Nutzerverwaltung</h1>
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	<main class="fade-in">
		<div class="row">
			<div class="grid12">
				<form id="nutzersucheform" method="post"
					action="../../NutzerSucheServlet" enctype="application/x-www-form-urlencoded" accept-charset="UTF-8">
					<fieldset>
						<legend>Nutzersuche</legend>
						<div>
							<label id="fragmentlabel" for="fragment">Name</label> <input
								id="fragment" name="fragment" type="text" required="required"
								pattern="[^ &lt;&gt;&#34;']+"
								title="Fragment eines Nutzernamens (Nutzernamen können keine Leerzeilen haben)."
								value="${fragment}" />
							<button id="suchenbutton" class="noStandardButton" type="button">
								<!-- IMG-SRC: https://www.google.com/search?tbm=isch&ved=2ahUKEwjcxd-Vpqv4AhXpi_0HHY6JBG8Q2-cCegQIABAA&oq=search+icon+white+filetype:png&gs_lcp=CgNpbWcQAzoECAAQQzoFCAAQgAQ6BggAEB4QBzoECAAQHjoGCAAQHhAFUI0OWLxFYIRGaABwAHgBgAG-AogB2xOSAQgxLjE2LjEuMZgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=M6KnYpzgBOmX9u8PjpOS-AY&bih=937&biw=1920&rlz=1C1CHBF_deDE916DE916&q=search+icon+white&tbs=ift:png#imgrc=SnwzyiNf1tuNMM -->
								<img class="buttonImg" src="../../bilder/verwaltung/suchen.png" />
							</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="grid12" id="suchergebnisse"></div>
		</div>
		<button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>
	</main>
	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
</body>
</html>