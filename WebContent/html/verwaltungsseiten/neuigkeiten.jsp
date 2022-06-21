<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${suchergebnisse == null || empty suchergebnisse}">
		<div class="row">
			<div class="grid12">
				<p id="keineTreffer">Keine Neuigkeiten!</p>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<c:forEach items="${neuigkeiten}" var="neuigkeit">
			<div class="neuigkeit">
				<p>
					<c:out value="${neuigkeit.nachricht}"></c:out>
				</p>
				<p>
					<c:out value="${neuigkeit.zeitstempel}"></c:out>
				</p>
				<form action="../../NeuigkeitEditierenServlet">
					<input type="hidden" name="zennr" value="${neuigkeit.nnr}" />
					<button class="editierenButton" type="button">Edit</button>
				</form>
				<form class="loeschenform" action="../../NeuigkeitLoeschenServlet">
					<input class="zlnnr" type="hidden" name="zennr"
						value="${neuigkeit.nnr}" />
					<button class="neuigkeitLoeschenButton" type="button">Löschen</button>
				</form>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>