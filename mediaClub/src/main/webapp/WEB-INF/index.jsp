<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<title>Login and Registration</title>
</head>
<body>
	<header>
		<div class="navbar navbar-dark bg-success box-shadow ">
			<div class="container d-flex justify-content-center">
				<h1></h1>				
			</div>
			<div class="container d-flex justify-content-center">
				<p> </p>			
			</div>
		</div>
	</header>
	
	<div class="container mt-4">
		<div class="row">
			<form:form  class="col bg-success m2 p-2 round" action="/register" method="POST" modelAttribute = "newUser">
				<h2 class="text-white">Register</h2>
				<div>
					<form:errors path="*" class="text-danger"/>
				</div>
					<div class="form-group">
						<form:label path="name" class="text-white">Name:</form:label>
						<form:input path="name" class="form-control mb-3"/>
					</div>
					<div class="form-group">
						<form:label path="email" class="text-white">Email:</form:label>
						<form:input path="email" class="form-control mb-3"/>
					</div>
					<div class="form-group">
						<form:label path="password" class="text-white">Password:</form:label>
						<form:input path="password" type= "password" class="form-control mb-3"/>
					</div>
					<div class="form-group">
						<form:label path="confirm" class="text-white">Confirm Password:</form:label>
						<form:input path="confirm" type="password" class="form-control mb-3"/>
					</div>
					<button>Create</button>
			</form:form>

			<form:form  class="col bg-success m-2 p-2 round" action="/login" method="Post" modelAttribute="newLogin">
					<h2 class="text-white">Login</h2>
					<div>
						<form:errors path="*" class="text-danger"/>
					</div><br/>
					<div class="form-group">
						<form:label path="email" class="text-white"> Email:</form:label>
						<form:input path="email"  class="form-control mb-3"/>
					</div><br/>
					<div class="form-group">
						<form:label path="password" class="text-white"> Password:</form:label>
						<form:input path="password" type="password"  class="form-control mb-3"/>
					</div><br/>
					<button>Login</button>
				</form:form>
		</div>
	</div>

</body>
</html>