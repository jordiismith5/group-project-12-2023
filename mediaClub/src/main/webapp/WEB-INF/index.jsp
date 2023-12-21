<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/style.css">
<title>Login and Registration</title>
</head>
<body>
		
	<div id="container">
	<img src="media.png" alt="mediaClub" id="title"/>
	<div id="loginReg">
		<div id="row">
			<form:form  class="col bg-success m2 p-2 round" action="/register" method="POST" modelAttribute = "newUser">
				<h2 class="text-color">Register</h2>
			
					<div class="form-group">
						<form:input path="name" placeHolder="User Name" class="form-box"/>
					</div>
					<div class="form-group">
						<form:input path="email" placeHolder="Email" class="form-box"/>
					</div>
					<div class="form-group">
						<form:input path="password" type= "password" placeHolder="Password" class="form-box"/>
					</div>
					<div class="form-group">
						<form:input path="confirm" type="password" placeHolder="Confirm Passsword" class="form-box"/>
					</div>
					<div class="spacer">
						<form:errors path="*" class="text-danger"/>
					 </div>
					<button class="buttons">Register</button>
			</form:form>
		</div>
		<div id="row2">
			<form:form  class="col bg-success m-2 p-2 round" action="/login" method="Post" modelAttribute="newLogin">
					<h2 class="text-color">Login</h2>
									
					<div class="form-group">
						<form:input path="email" placeHolder="Email" class="form-box"/>
					</div>
					<div class="form-group">
						<form:input path="password" type="password"  placeHolder="Password" class="form-box"/>
					</div>
					<div class="spacer"> 
						<form:errors path="*" class="text-danger"/>
					</div>
					<button class="buttons">Login</button>
				</form:form>
			</div>
		</div>
		<h2 id="caption">Members only beyond this point ;)</h2>
	</div>
			
</body>
</html>