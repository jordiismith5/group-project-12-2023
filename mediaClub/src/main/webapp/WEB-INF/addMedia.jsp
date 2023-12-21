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
<title>MediaClub</title>
</head>
<body>
		<div id="container">
			<div class="text-end">
				<a href="/shows" id="home">Back to the homepage!</a>
			</div>
			<h1 id="addShow">Add a Show</h1>
			<form:form action="/shows/create" modelAttribute="media" method="POST" class="col-5 mt-4 p-3">
				<div id="spacer">
					<form:errors path="*" class="text-danger"/>
				</div>
				<div class="mb-3">
					<form:input type="text" path="title" placeHolder="Show Name"  class="form-box" />
				</div>
				<div class="mb-3">
					<form:input type="textarea" path="description" placeHolder="Description"  class="form-box" />
				</div>
				<div class="mb-3">
					<form:input type = "number" min="1" path = "count" placeHolder="Number Of Episodes"  class="form-box"/>
				</div>
				<div class="mb-3">
				<form:input type="number" min="1" max="5" placeHolder="Rating" path="rating"  id="form-rate" />
				</div>
				<div class="form-row">
					<form:input type="hidden" path="user" value="${user.id}"  class="form-box"/>
				</div>
				<br> 
				<button id="buttons">Submit</button>
			</form:form>
		</div>
	
</body>
</html>