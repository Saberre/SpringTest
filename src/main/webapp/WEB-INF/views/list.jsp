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
<a href="/write" class="btn btn-link">Write</a>
<%@ include file="_footer.jsp" %>