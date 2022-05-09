<%--
Erstellt von Lukas Theinert
--%>


<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta charset="ISO-8859-1">
<title>Upload</title>
</head>
<body>

	<h1>Bild hochladen</h1>
	
		<nav>
		<%@include file="../jspf/navigation.jspf"%>
		</nav>   
          
	
	<form id="myForm" method="post" action="${pageContext.request.contextPath}/BildHochladenServlet" enctype="multipart/form-data">
			<fieldset><legend>Bild hochladen</legend>
				<div>
				  <label for="number">Kategorie angeben:</label>
				  <input type="text" name="kategorie" id="kategorie" placeholder="Kategorie eingeben" >
				</div>
				<div>
				  <label for="image">Bild hochladen:</label>
				  <input type="file" name="image" id="image" accept="image/*" >
				</div>

				<div>
				  <button name="submit" type="submit">Absenden</button>
				  <button name="reset" type="reset">Zurücksetzen</button>
				</div>
			</fieldset>
			
		</form>

</body>
</html>