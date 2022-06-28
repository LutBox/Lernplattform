<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="de">
<head>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css"/>
    <script src="${pageContext.request.contextPath}/js/standard.js" defer></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hauptseiten/bestenliste.css"/>
    <script src="${pageContext.request.contextPath}/js/bestenliste.js" defer></script>

    <base href="${pageContext.request.requestURI}"/>
    <title>Bestenliste</title>
</head>
<body>

<header>
    <h1>Bestenliste</h1>
    <%@include file="../jspf/navigation.jspf" %>
</header>

<%@include file="../jspf/aktuellerNutzer.jspf"%>

<!-- Flex-Item 1 -->
<div id="flexarea">

    <!-- Flex-Item 1 -->
    <aside>
            <h2>Top-News</h2>
            <c:forEach items="${neuigkeiten}" var="neuigkeit">
				<div class="neuigkeit">
					<p>
						<c:out value="${neuigkeit.nachricht}"></c:out>
					</p>
					<p class="zeitstempel">
						<c:out value="${neuigkeit.zeitstempel}"></c:out>
					</p>
					<br />
					<hr class="neuigkeitentrenner" />
					<br />
				</div>
			</c:forEach>
        </aside>

    <!-- Flex-Item 2 -->
    <article>

        <div id="bilderMemorieTabelle">
        	<h3>Bildermemorie</h3>
        
            <table>
                <thead>
                <tr>
                    <th>Platz</th>
                    <th>Name</th>
                    <th>Punkte</th>
                    <th>Gespielte Spiele</th>
                    <th>Durchschnittliche Zeit: Leicht</th>
                    <th>Durchschnittliche Zeit: Mittel</th>
                    <th>Durchschnittliche Zeit: Schwer</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="b" items="${bestenlisteBilderMemorieAjax}"
                           varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${b.nutzer}</td>
                        <td>${b.punkteBilderMemorie}</td>
                        <td>${b.spieleInsgesamt}</td>
                        <td>${b.durchschnittZeitLeicht}sek</td>
                        <td>${b.durchschnittZeitMittel}sek</td>
                        <td>${b.durchschnittZeitSchwer}sek</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        
        <br>
        <br>
        </div>

        <div id="bilderOrdnenTabelle">
        	<h3>Bilder ordnen</h3>
        
            <table>
                <thead>
                <tr>
                    <th>Platz</th>
                    <th>Name</th>
                    <th>Punkte</th>
                    <th>Gespielte Spiele</th>
                    <th>Durchschnittliche Zeit: Leicht</th>
                    <th>Durchschnittliche Zeit: Mittel</th>
                    <th>Durchschnittliche Zeit: Schwer</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="c" items="${bestenlisteBilderOrdnenAjax}"
                           varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${c.nutzer}</td>
                        <td>${c.punkteBilderOrdnen}</td>
                        <td>${c.spieleInsgesamt}</td>
                        <td>${c.durchschnittZeitLeicht}sek</td>
                        <td>${c.durchschnittZeitMittel}sek</td>
                        <td>${c.durchschnittZeitSchwer}sek</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        
        <br>
        <br>
        </div>

        <div id="bilderWortTabelle">
        	<h3>4 Bilder 1 Wort</h3>
 
            <table>
                <thead>
                <tr>
                    <th>Platz</th>
                    <th>Name</th>
                    <th>Punkte</th>
                    <th>Gespielte Spiele</th>
                    <th>Durchschnittliche Punkte: Leicht</th>
                    <th>Durchschnittliche Punkte: Mittel</th>
                    <th>Durchschnittliche Punkte: Schwer</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="c" items="${bestenlisteBilderWortAjax}"
                           varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${c.nutzer}</td>
                        <td>${c.punkteBilderBilderWort}</td>
                        <td>${c.spieleInsgesamt}</td>
                        <td>${c.durchschnittZeitLeicht}</td>
                        <td>${c.durchschnittZeitMittel}</td>
                        <td>${c.durchschnittZeitSchwer}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        
        <br>
        <br>
        </div>

            <div id="matheTabelle">
            	<h3>Mathe</h3>
        
            <table>
                <thead>
                <tr>
                    <th>Platz</th>
                    <th>Name</th>
                    <th>Punkte</th>
                    <th>Gespielte Spiele</th>
                    <th>Durchschnittliche Punkte: Leicht</th>
                    <th>Durchschnittliche Punkte: Mittel</th>
                    <th>Durchschnittliche Punkte: Schwer</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="c" items="${bestenlisteMatheAjax}"
                           varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${c.nutzer}</td>
                        <td>${c.punkteMathe}</td>
                        <td>${c.spieleInsgesamt}</td>
                        <td>${c.durchschnittZeitLeicht}</td>
                        <td>${c.durchschnittZeitMittel}</td>
                        <td>${c.durchschnittZeitSchwer}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        
        <br>
        <br>
        </div>

		<div id="jumpnrunTabelle">
        	<h3>Jumpnrun</h3>
        
            <table>
                <thead>
                <tr>
                    <th>Platz</th>
                    <th>Name</th>
                    <th>Punkte</th>
                    <th>Gespielte Spiele</th>
                    <th>Durchschnittliche Zeit: Leicht</th>
                    <th>Durchschnittliche Zeit: Mittel</th>
                    <th>Durchschnittliche Zeit: Schwer</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="c" items="${bestenlisteJumpnrunAjax}"
                           varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${c.nutzer}</td>
                        <td>${c.punkteJumpnrun}</td>
                        <td>${c.spieleInsgesamt}</td>
                        <td>${c.durchschnittZeitLeicht}sek</td>
                        <td>${c.durchschnittZeitMittel}sek</td>
                        <td>${c.durchschnittZeitSchwer}sek</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

        <button type="button" class="goToTopButton" id="goToTopButton">Seitenanfang</button>

    </article>
    <!-- Flex-Item 3 -->
    <aside>
        <h2>Bestenlisten:</h2>
        
        <br><br>
        
        Wähle Spiele aus:
        <br>
        <input type="checkbox" name="bestenlisten" id="bilderMemorie" value="bilderMemorie" checked="checked">
        <label for="bilderMemorie">Bildermemorie</label>
        <br>
        <input type="checkbox" name="bestenlisten" id="bilderOrdnen" value="bilderOrdnen" checked="checked">
        <label for="bilderOrdnen">Bilder ordnen</label>
        <br>
        <input type="checkbox" name="bestenlisten" id="bilderWort" value="bilderWort" checked="checked">
        <label for="bilderWort">4 Bilder 1 Wort</label>
        <br>
        <input type="checkbox" name="bestenlisten" id="mathe" value="mathe" checked="checked">
        <label for="mathe">Mathe</label>
        <br>
        <input type="checkbox" name="bestenlisten" id="jumpnrun" value="jumpnrun" checked="checked">
        <label for="jumpnrun">Jump n run</label>
    </aside>

</div>
<!-- Ende der FLEXBOX -->
<br>
<br>
<br>
<br>
<footer>
    <%@include file="../jspf/footer.jspf" %>
</footer>

</body>
</html>