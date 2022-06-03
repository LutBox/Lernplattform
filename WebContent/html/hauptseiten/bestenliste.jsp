<%--
Erstellt von Lukas Theinert
--%>

<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/standard/standardLayout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/standard.js" defer></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/hauptseiten/bestenliste.css" />

<base href="${pageContext.request.requestURI}" />
<meta charset="UTF-8">
<title>Bestenliste</title>
</head>
<body>

	<header>
		<h1>Bestenliste</h1>	
		<%@include file="../jspf/navigation.jspf"%>
	</header>
	
	<!-- Flex-Item 1 -->
	<div id="flexarea">
	
	<!-- Flex-Item 1 -->
		<aside>
			<h2>Top-News</h2>
			<p>Forum-Threads</p>
		</aside>
		
		<!-- Flex-Item 2 -->
		<article>



        <center><h3>Bildermemorie</h3></center>

        <div>
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

                <c:forEach var="b" items="${bestenlisteBilderMemorieAjax}" varStatus="status">
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
        </div>
        
        <br><br>
        
        <center><h3>Bilder ordnen</h3></center>

        <div>
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

                <c:forEach var="c" items="${bestenlisteBilderOrdnenAjax}" varStatus="status">
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
        </div>
        
        <br><br>
        
        <center><h3>4 Bilder 1 Wort</h3></center>

        <div>
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

                <c:forEach var="c" items="${bestenlisteBilderWortAjax}" varStatus="status">
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
        </div>
                <br><br>
        
        <center><h3>Mathe</h3></center>

        <div>
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

                <c:forEach var="c" items="${bestenlisteMatheAjax}" varStatus="status">
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
        </div>
        
                <br><br>
        
        <center><h3>Jumpnrun</h3></center>

        <div>
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

                <c:forEach var="c" items="${bestenlisteJumpnrunAjax}" varStatus="status">
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
			<h2>Beschreibungen</h2>
		</aside>
		
	</div>
	<!-- Ende der FLEXBOX -->
	<br> <br> <br> <br>
	<footer>
			<%@include file="../jspf/footer.jspf"%>
	</footer>
	
</body>
</html>