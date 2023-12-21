<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/dashStyle.css">
<title>Dashboard</title>
</head>
<body>
		<div id="header"> 
			<h4 id="welcome">Hello, ${user.name}. Welcome to..</h4>
			<img src="media.png" alt="mediaClub" id="title"/>
			
			<div id="nav-but"> 
				<a href="/logout" id="nav-logout">Logout</a>
				<a href="/shows/new" id="nav-link">Add to My Shows</a>
			</div>
		</div>
	<div id="container">
			<table>
				<thead >
					<tr >
						<th>Show Name</th>
						<th>Rating</th>
						<th>User Name</th>
						<th>Episode count</th>
						<th>Description</th>
						<th>Publisher Buttons</th>
					</tr>
				</thead>
				<tbody>
			    	<c:forEach var="media" items="${medias}">
				        <tr>
				            <td><a href="/shows/${media.id}" id="show"><c:out value="${media.title}" /></a></td>
				            <td class="star"><c:out value="${media.rating}" /></td>
				            <td><c:out value="${media.user.name}" /></td>
				            <td><c:out value="${media.count}" /></td>
				            <td><c:out value="${media.description}" /></td>
				            <td>
				                <c:if test="${media.user == user}">
				                    <a href="/shows/${media.id}/edit" id="edit">Edit</a>
				                    <a href="/shows/${media.id}/delete" id="delete">Delete</a>
				                </c:if>
				            </td>
				        </tr>
				    </c:forEach>
				</tbody>

			</table>
		</div>
</body>
 </html>