<%--
Erstellt von Lukas Theinert
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<table>
		<thead>
			<tr>
				<th>Kategorie</th>
				<th>Spiele Insgesamt</th>
			</tr>
		</thead>
		<tbody>

				<tr>
					<td>Bildermemorie</td>
					<td>${beliebtesteSpieleAjax.punkteBilderMemorie}</td>
				</tr>
				<tr>
					<td>Bilder ordnen</td>
					<td>${beliebtesteSpieleAjax.punkteBilderOrdnen}</td>
				</tr>
				<tr>
					<td>4 Bilder 1 Wort</td>
					<td>${beliebtesteSpieleAjax.punkteBilderBilderWort}</td>
				</tr>
				<tr>
					<td>Mathe</td>
					<td>${beliebtesteSpieleAjax.punkteMathe}</td>
				</tr>
				<tr>
					<td>Jump n Run</td>
					<td>${beliebtesteSpieleAjax.punkteJumpnrun}</td>
				</tr>


		</tbody>
	</table>
</div>

<br>
