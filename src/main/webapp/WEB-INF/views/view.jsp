<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:include page="_header.jsp">
	<jsp:param name="title" value="${article.subject}" />
</jsp:include>
<h1>${article.subject}</h1>
<small class="muted pull-left">${article.author}</small>
<small class="muted pull-right"><fmt:formatDate value="${article.created}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
<hr>
<div>
<pre>${article.content}</pre>
</div>
<hr>
<div>
	<h4>Actions for Article</h4>
	<a href="/${article.id}/edit" class="btn">Edit</a>
	<a href="/${article.id}/delete" class="btn btn-danger">Delete</a>
</div>
<hr>
<div id="commentList">
<h4>Comments</h4>
<c:forEach items="${article.comments}" var="comment">
<div>
Commented by ${comment.author} at
<fmt:formatDate value="${comment.created}" pattern="yyyy-MM-dd HH:mm:ss" />
<a href="/${article.id}/comment/${comment.id}/delete" class="btn btn-mini btn-danger"><i class="icon-trash icon-white"></i></a>
<blockquote>${comment.content}</blockquote>
</div>
</c:forEach>
</div>
<hr>
<div>
<h4>Write Comment</h4>
<form:form modelAttribute="comment" action="/${article.id}/comment" id="commentForm">
<div>Name<br>
<form:input path="author" />
</div>
<div>Content<br>
<form:textarea path="content" />
</div>
<div class="clearfix"></div>
<button type="submit" class="btn btn-primary">Write</button>
</form:form>
<span id="commentError"></span>
</div>
<hr>
<script>
var articleId = ${article.id};
$(function () {
	$('#commentForm').submit(function () {
		var $form = $(this);
		$('#commentError').text('');
		$.post(this.action, $form.serialize(), function (data) {
			console.log(data);

			$('#commentList').append('<div>Commented by ' + data.author + ' at ' + data.created
					+ ' <a href="/' + articleId + '/comment/' + data.id + '/delete" class="btn btn-mini btn-danger">'
					+ '<i class="icon-trash icon-white"></i></a><blockquote>' + data.content + '</blockquote></div>');

			$('#author').val('');
			$('#content').val('');
		}).fail(function (data) {
			result = data.responseJSON[0];
			$('#commentError').text(result.fieldName + ' ' + result.message);
			$('#' + result.fieldName).focus();
		});
		
		return false;
	});
});
</script>
<%@ include file="_footer.jsp" %>