
<%--
Erstellt von Zohal Mohammadi
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.requestURI}" />
<meta charset="UTF-8">
<title>Kontaktformular</title>
</head>
<body>
	<header>
			<%@include file="../jspf/navigation.jspf"%>
	</header>
	<h1> Kontaktformular</h1>
    <form action="Kontaktformular" method="post">
    	<p>Vorname:<br> <input type="text" name="vorname" size ="35" maxlength="40" placeholder="Ihr Vorname"></p>
        <p> Nachname: <br><input type ="text" name="nachname" size "35" maxlength="40" placeholder="Ihr Nachname" ></p>
        <p>E-Mail:<br><input type="text" name="E-mail" size="30" maxlength="35" placeholder="Ihre E-Mail"></p>
        <p> Ihre Anligen an uns: </br>
        <textarea  name ="Use_angabe" rows ="10" cols="50"> </textarea>
        </p>
        <button type ="submit" name="sendebutton" value="submit" >absenden</button>
	</form>
</body>
</html>