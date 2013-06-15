<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:include page="_header.jsp">
	<jsp:param name="title" value="${article.subject}" />
</jsp:include>
<h1>${article.subject}</h1>
<dl class="dl-horizontal">
	<dt>Name</dt>
	<dd>${article.author}</dd>
	<dt>Created</dt>
	<dd><fmt:formatDate value="${article.created}" pattern="yyyy-MM-dd HH:mm:ss" /></dd>
	<dt>Content</dt>
	<dd>${article.content}</dd>
</dl>
<div>
	<a href="/${article.id}/edit" class="btn">Edit</a>
	<a href="/${article.id}/delete" class="btn btn-danger">Delete</a>
</div>
<%@ include file="_footer.jsp" %>