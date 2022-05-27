<%-- @author Merlin --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!DOCTYPE html>
   <html>

   <head>
    <meta charset="utf-8">
    <title>Nutzer aktualisieren</title>
   </head>

   <body>
    <header>
     <%@include file="../jspf/navigation.jspf" %>
    </header>
    <main>
     <h1>Nutzer aktualisieren</h1>

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
   </body>

   </html>