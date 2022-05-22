<%--
Erstellt von Lukas Theinert
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<table>
		<thead>
			<tr>
				<th>Platz</th>
				<th>Name</th>
				<th>Punkte</th>
			</tr>
		</thead>

		<tbody>

			<c:forEach var="b" items="${bestenlisteBilderMemorieAjax}"
				varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${b.nutzer}</td>
					<td>${b.punkte}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</div>

<br>
