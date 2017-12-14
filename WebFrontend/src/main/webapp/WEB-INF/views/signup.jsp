<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Bootstrap core CSS 
    <link href="${css}/bootstrap.min.css" rel="stylesheet">-->

<link href="${css}/custom-bootstrap.css" rel="stylesheet">
<link href="${css}/bootstrap-theme.css" rel="stylesheet">

<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<!-- Font-awesome CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DMART -${title}</title>
</head>
<body>

	<div class="container-fluid">

		<nav class="navbar navbar-expand-sm navbar-dark"
			style="background: coral;">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#nav-content" aria-controls="nav-content"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Brand --> <a class="navbar-brand" href="${contextRoot}/home">Home</a>
		</nav>
	</div>

	<!-- Regitration Form -->
	<br />
	<center>
		<div class="card w-50">
			<h3 class="card-header">Sign Up here</h3>
			<div class="card-body">
				<form:form modelAttribute="registrationForm" method="post">
					<div class="form-group row">
						<label for="name" class="col-xs-3 col-form-label mr-5">
							Name</label>
						<div class="col-xs-9">
							<form:input type="text" class="form-control" id="name"
								path="name" placeholder="Full name" required="true" size="35" />
						</div>
					</div>
					<div class="form-group row">
						<label for="email" class="col-xs-3 col-form-label mr-5">Email</label>
						<div class="col-xs-9">
							<form:input type="email" class="form-control" id="email"
								placeholder="eg: you@gmail.com" path="email" required="true"
								size="35" />
						</div>
					</div>
					<div class="form-group row">
						<label for="address" class="col-xs-3 col-form-label mr-5">Address</label>
						<div class="col-xs-9">
							<form:textarea type="text" row="7" class="form-control" cols="50"
								placeholder="Complete Address" id="address" path="address"
								required="true" />
						</div>
					</div>
					<div class="form-group row">
						<label for="country" class="col-xs-3 col-form-label mr-5">Country</label>
						<div class="col-xs-9">
							<form:input type="text" class="form-control" id="country"
								placeholder="eg:India,US,UK" path="country" required="true" />
						</div>
					</div>
					<div class="form-group row">
						<label for="contact" class="col-xs-3 col-form-label mr-5">Contact</label>
						<div class="col-xs-9">
							<form:input type="text" class="form-control" id="contact"
								placeholder="Contact no." path="contact" required="true"
								maxlength="10" />
						</div>
					</div>
					<div class="form-group row">
						<label for="password" class="col-xs-3 col-form-label mr-5">Password</label>
						<div class="col-xs-9">
							<form:input type="password" class="form-control" id="password"
								placeholder="Password" path="password" required="true" size="35" />
						</div>
					</div>
					<div class="form-group row">
						<label for="confirmPassword" class="col-xs-3 col-form-label mr-4">Confirm
							Password</label>
						<div class="col-xs-9">
							<form:input type="password" class="form-control"
								placeholder="Confirm password" id="confirmPassword"
								path="confirmPassword" required="true" size="35" />
						</div>
					</div>
					
					<div class="form-group row ">
						<div class="offset-xs-3 col-xs-9">
							<button type="submit" class="btn btn-primary " formaction="register">Register</button>
								
						</div>
					</div>
					
			<h5>Already a user?</h5>	<a href="login">Click here</a>
					
					
				</form:form>

			</div>

		</div>

		</div>
	</center>
	</br>


	<%@include file="./shared/footer.jsp"%>