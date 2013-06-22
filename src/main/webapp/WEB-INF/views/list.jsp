<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:include page="_header.jsp">
	<jsp:param name="title" value="List" />
</jsp:include>
<h1>Board</h1>
<form>
	<select name="count">
		<option value="30"<c:if test="${count == 30}"> selected</c:if>>30개</option>
		<option value="50"<c:if test="${count == 50}"> selected</c:if>>50개</option>
		<option value="100"<c:if test="${count == 100}"> selected</c:if>>100개</option>
	</select>
	<button type="submit" class="btn">Go</button>
</form>
<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			<th>Subject</th>
			<th>Author</th>
			<th>Date</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${articles}" var="article">
		<tr>
			<td>${article.id}</td>
			<td><a href="<c:url value="/${article.id}"></c:url>">${article.subject}</a></td>
			<td>${article.author}</td>
			<td><fmt:formatDate value="${article.created}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<div class="pagination" style="text-align:center;">
	<ul>
		<c:choose>
		<c:when test="${!pagination.hasPrevious}"><li class="disabled"><a>&laquo;</a></li></c:when>
		<c:otherwise><li><a href="?page=${pagination.previous}&amp;count=${count}">&laquo;</a></li></c:otherwise>
		</c:choose>
		<c:forEach begin="${pagination.begin}" end="${pagination.end}" var="i">
		<c:choose>
		<c:when test="${i == pagination.cur}"><li class="active"><a>${i}</a></li></c:when>
		<c:otherwise><li><a href="?page=${i}&amp;count=${count}">${i}</a></li></c:otherwise>
		</c:choose>
		</c:forEach>
		<c:choose>
		<c:when test="${!pagination.hasNext}"><li class="disabled"><a>&raquo;</a></li></c:when>
		<c:otherwise><li><a href="?page=${pagination.next}&amp;count=${count}">&raquo;</a></li></c:otherwise>
		</c:choose>
	</ul>
</div>
<a href="/write" class="btn btn-link">Write</a>
<%@ include file="_footer.jsp" %>