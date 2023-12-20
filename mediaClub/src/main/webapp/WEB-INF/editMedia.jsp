<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>${media.user.name}</title>
</head>
<body>
	<div class="container-fluid">
		<div class="container mx-auto mt-4">
			<a href="/shows" class="nav-link mb-3">Back to the Homepage!</a>
			<main class="col-8 px-4 py-3 border border-1 border-pirmary rounded bg-light">
				<div class="text-end">
					<c:if test="${media.user == user}"><a href="/shows/${media.id}/edit" class="nav-link">Edit</a></c:if>
				</div>
				<div>
					<h1 class="display-5 mb-4"><c:out value="${media.title}" /></h1>
					<h4 class="mb-3"><span class="text-danger"><c:out value="${media.user.getName()}" /></span> added <span class="text-primary"></span><c:out value="${media.title}" />.</h4>
					<hr />
					<div>
						<form:form action="/shows/${media.id}/edit" modelAttribute="media" method="POST" class="col-5 mt-4 p-3">
						<div>
						<form:errors path="*" class="text-danger"/>
							</div>
							<div class="mb-3">
								<form:label path="title" >Shows Name:</form:label>
								<form:input type="text" path="title" class="form-control" />
							</div>
							<div class="mb-3">
								<form:label path="description" >Description Of the Show:</form:label>
								<form:input type="textarea" path="description" class="form-control" />
							</div>
							<div class="mb-3">
								<form:label path="rating" >Rating:</form:label>
								<form:input type="number" min="1" max="5" path="rating" class="form-control" />
							</div>
							<div class="mb-3">
								<form:label path="count">Number of Episodes:</form:label>
								<form:input type = "number" min="1" path = "count" class ="form-control"/>
							</div>
							<div class="form-row">
								<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
							</div>
							<button>Submit</button>
						</form:form>
						</div>
				</div>
				<div class= "text-end">
					<c:if test="${media.user == user }"><a href="/shows/${media.id}/delete" class="nav-link">Delete</a></c:if>
				</div>
			</main>
		</div>
	</div>
</body>
</html>