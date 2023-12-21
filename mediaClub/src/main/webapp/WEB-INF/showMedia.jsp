<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/addStyle.css">
<title>${media.user.name}</title>
</head>
<body>
	<div id="container">
		<div class="container mx-auto mt-4">
			<a href="/shows" id="home">Back to the Homepage!</a>
				<div id="words">
					<h1 id="addShow"><c:out value="${media.title}" /></h1>
					<h4 class="mb-3"><span class="text-danger"><c:out value="${media.user.getName()}" /></span> added: <span class="text-primary"></span><c:out value="${media.title}" />.</h4>
					<p>Episode Count: <c:out value="${media.count}" /></p>
					<p>Description: <c:out value="${media.description}" /></p>
					<p>Rating: <c:out value="${media.rating}" /></p>
				</div>
				<br> 
					<c:if test="${media.user == user }"><a href="/shows/${media.id}/delete" id="delete">Delete</a></c:if>
					<c:if test="${media.user == user}"><a href="/shows/${media.id}/edit" id="edit">Edit</a></c:if>
				</div>
			</div>
</body>
</html>