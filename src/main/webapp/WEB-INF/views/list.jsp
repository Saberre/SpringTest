<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:include page="_header.jsp">
	<jsp:param name="title" value="List" />
</jsp:include>
<h1>Board</h1>
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
		<tr>
			<td>2</td>
			<td>lollol</td>
			<td>troll</td>
			<td>2013-03-03 11:11:11</td>
		</tr>
		<tr>
			<td>1</td>
			<td>lol</td>
			<td>trollee</td>
			<td>2013-03-02 11:11:11</td>
		</tr>
	</tbody>
</table>
<a href="" class="btn btn-link">Write</a>
<%@ include file="_footer.jsp" %>