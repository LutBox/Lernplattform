<%-- @author Merlin --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!DOCTYPE html>
   <html>

   <head>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/spieleseiten/spielehauptseite.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/spielehauptseite.js" defer></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>
    <title>Nutzer aktualisieren</title>
    <link rel="stylesheet" href="../../css/adminstilvorlage.css"/>
   </head>

   <body>
    <header>
    	<h1>Nutzer aktualisieren</h1>
    	<%@include file="../jspf/navigation.jspf" %>
    </header>
    <main>
     <form method="post" action="../../NutzerAktualisierenServlet" enctype="multipart/form-data">
      <fieldset>
       <div class="eingabefeld">
        <label for="neuerName">Neuer Nutzername: </label>
        <br />
        <input name="neuerName" id="neuerName" type="text" placeholder="Neuer Nutzername" maxlength="64"  value="${zuverwaltendernutzer.name}"/>
        <br />
        <label for="neueEmail">Neue E-Mail:</label> <br />
        <input name="neueEmail" id="neueEmail" type="email" value="${zuverwaltendernutzer.email}" placeholder="e-mail" maxlength="64" />
        <br />
        <label for="neuesPasswort">Neues Passwort:</label>
        <br />
        <input name="neuesPasswort" id="neuesPasswort" type="text" maxlength="128" value="${zuverwaltendernutzer.passwort}" />
        <br />
        <label for="passwort2">Neues Passwort wiederholen:</label>
        <br>
        <input name="passwort2" id="passwort2" type="text" maxlength="128" value="${zuverwaltendernutzer.passwort}" />
        <br />
        <label for="regnutzer">Nutzer</label>
        <input type="radio" name="nutzerart" id="regnutzer" value="0" />
        <br />
        <label for="administrator">Admin</label>
        <input type="radio" name="nutzerart" value="1" id="administrator" />
        <br />
        <label for="neusProfilbild">Profilbild hochladen:</label>
        <br />
        <input type="file" name="neuesProfilbild" id="neuesProfilbild" accept="image/*" />
       </div>
       <div class="formularknopf">
        <button type="submit">Absenden</button>
        <br />
        <button type="reset">Zurücksetzen</button>
        <br />
       </div>
      </fieldset>
     </form>
     <p>
      <a href="./suchergebnisse.jsp">zur&uuml;ck zu den Suchergebnissen</a>
      <a href="./adminkonsole.jsp">zur&uuml;ck zur Adminkonsole</a>
     </p>
    </main>
    	<footer>
		<%@include file="../jspf/footer.jspf"%>
	</footer>
   </body>

   </html>