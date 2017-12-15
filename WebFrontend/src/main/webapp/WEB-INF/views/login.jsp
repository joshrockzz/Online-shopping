<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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


	<!-- Login Form -->
	<br />

	<center>
		<div class="container">
			<c:if test="${not empty message }">
				<div class="col-md-offset-3 col-md-6">
					<div class="alert alert-warning alert-dismissible fade show"
						role="alert" id="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>${message}</strong>
					</div>
				</div>
			</c:if>

			<c:if test="${not empty success }">
				<div class="col-md-offset-3 col-md-6">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert" id="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>${success}</strong>
					</div>
				</div>
			</c:if>

			<div class="card w-25">
				<h3 class="card-header">Login here</h3>
				<div class="card-body">
					<form action="${contextRoot}/login" method="post">
						<div class="form-group row">
							<label for="username" class="col-xs-3 col-form-label mr-5">
								Username</label>
							<div class="col-xs-9">
								<input type="text" class="form-control" id="username"
									name="username" placeholder="Enter your username"
									required="true" size="35" />
							</div>
						</div>

						<div class="form-group row">
							<label for="confirmPassword" class="col-xs-3 col-form-label mr-5">
								Password</label>
							<div class="col-xs-9">
								<input type="password" class="form-control"
									placeholder="Enter your password" id="password" name="password"
									required="true" size="35" />
							</div>
						</div>

						<div class="form-group row ">
							<div class="offset-xs-3 col-xs-9">
								<button type="submit" class="btn btn-primary">Login</button>

							</div>
						</div>

						<h5>New User?</h5>
						<a href="signup">Register here</a>


					</form>

				</div>

			</div>

		</div>
	</center>

	<br />

	<script type="text/javascript">
		setTimeout(function() {
			$('#alert').hide('fade');

		}, 3000);
	</script>

	<%@include file="./shared/footer.jsp"%>