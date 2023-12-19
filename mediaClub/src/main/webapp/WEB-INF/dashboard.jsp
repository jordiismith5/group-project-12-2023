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
<title>Dashboard</title>
</head>
<body>

	<div class="container-fluid">
		<div class="container mx-auto mt-4">
			<header class="row justify-content-between align-items-center">
				<div class="col-5 text-start">
					<h4>Hello, ${user.name}. Welcome to..</h4>
					<h1>MediaClub</h1>
				</div>
				<div class="col-5 text-end">
					<a href="/logout" class="nav-link">Logout</a>
					<a href="/shows/new" class="nav-link">+Add to My Shows</a>
				</div>
			</header>
		</div>
		<div class="row mx-auto mt-3">
			<table class="table table-striped table-bordered caption-top">
				<thead class="table-info">
					<tr class="align-middle">
						<th>ID</th>
						<th> Show Name</th>
						<th>Rating</th>
						<th>User Name</th>
						<th>Episode count</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="show" items="${shows}">
						<tr>
							<td><c:out value="${show.id}"/></td>
							<td><a href="/shows/${show.id}" class="nav-link"><c:out value="${show.showName}" /></a></td>
							<td><c:out value="${show.rating}" /></td>
							<td><c:out value="${show.user.getName()}" /></td>
							<td><c:out value ="${show.episodecount}"/></td>
							<td><c:out value ="${show.description}"/></td>
							<td class="text-space-between">
								<c:if test="${show.user == user}"><a href="/shows/${show.id}/edit" class="nav-link">Edit</a></c:if>
								<c:if test="${show.user == user }"><a href="/shows/${show.id}/delete" class="nav-link">Delete</a></c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
	

</body>
 </html>