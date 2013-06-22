<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="_header.jsp">
	<jsp:param name="title" value="Write" />
</jsp:include>
<c:choose>
	<c:when test="${article.id > 0}"><c:set var="actionName" value="Edit" /></c:when>
	<c:otherwise><c:set var="actionName" value="Write" /></c:otherwise>
</c:choose>
<h1>${actionName}</h1>
<form:form modelAttribute="article" cssClass="form-horizontal">
	<div class="control-group">
		<label class="control-label">Name</label>
		<div class="controls">
			<c:choose>
				<c:when test="${article.id > 0}"><form:input path="author" readonly="true" /></c:when>
				<c:otherwise><form:input path="author" /></c:otherwise>
			</c:choose>
			<form:errors path="author" cssClass="help-inline" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">Subject</label>
		<div class="controls">
			<form:input path="subject" />
			<form:errors path="subject" cssClass="help-inline" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">Content</label>
		<div class="controls">
			<form:textarea path="content" rows="5" cols="80" />
			<form:errors path="content" cssClass="help-inline" />
		</div>
	</div>
	<div class="form-actions">
		<button type="submit" class="btn btn-primary">${actionName}</button>
	</div>
</form:form>
<%@ include file="_footer.jsp" %>