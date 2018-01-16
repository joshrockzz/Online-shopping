<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Bootstrap core CSS 
    <link href="${css}/bootstrap.min.css" rel="stylesheet">-->

<link href="${css}/custom-bootstrap.css" rel="stylesheet">
<link href="${css}/bootstrap-theme.css" rel="stylesheet">

<style type="text/css">
table, th, td {
    border-spacing:15px;
    padding: 5px;
</style>

<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">


<!-- Font-awesome CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="icon" href="${images}/logo.png" type="image/jpg">
<title>DMART -${title}</title>
<script>
	window.menu = '${title}';
</script>
<style>
body {
	padding-top: 1em;
}
</style>
</head>
<body>


	<!-- Navigation -->
	<div class="container-fluid">

		<nav class="navbar navbar-expand-sm navbar-dark"
			style="background: coral;">

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#nav-content" aria-controls="nav-content"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Brand --> <a class="navbar-brand" href="${contextRoot}/home"><img src="${images}/logo1.png" width="50" height="30" class="d-inline-block align-top" alt=""> DMART</a>

		<!-- Links -->
		<div class="collapse navbar-collapse" id="nav-content">
			<ul class="navbar-nav">
				<li class="nav-item" id="listproducts"><a class="nav-link"
					href="${contextRoot}/allproduct">View Products</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown"
					id="Preview" href="#" role="button" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="Preview">
						<c:forEach items="${categoryList}" var="category">
							<a class="dropdown-item"
								href="${contextRoot}/categoryproduct${category.id}"
								id="a_${category.name}">${category.name}</a>
						</c:forEach>
					</div></li>
				<security:authorize access="hasAuthority('ADMIN')">
					<li class="nav-item" id="admincontrol"><a class="nav-link"
						href="${contextRoot}/admincontrol">Admin Control</a></li>
				</security:authorize>
			 
			</ul>
			<form class="form-inline my-2 my-lg-0" action="search">
      <input class="form-control mr-sm-2" type="text" placeholder="Search products" name="name">
      <button class="btn btn-primary my-2 my-sm-0" type="submit" formaction="search">Search</button>
    </form> 
		</div>

		<ul class=" nav navbar-nav navbar-right">
			<security:authorize access="isAnonymous()">
				<li class="nav-item" id="signin"><a class="nav-link"
					href="${contextRoot}/login">SignIn</a></li>
				<li class="nav-item" id="register"><a class="nav-link"
					href="${contextRoot}/signup">SignUp</a></li>
			</security:authorize>

			<security:authorize access="isAuthenticated()">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" id="User"
					href="#" role="button" aria-haspopup="true" aria-expanded="false">
						${usermodel.name} <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" aria-labelledby="user">
						<security:authorize access="hasAuthority('USER')">
							<li><a class=dropdown-item href="${contextRoot}/cartpage">
									<span class="glyphicon glyphicon-shopping-cart">Cart</span> <i
									class="fa fa-shopping-cart" aria-hidden="true"></i>
							</a></li>

							<div class="dropdown-item divider"></div>
						</security:authorize>

						<li><a class=dropdown-item href="${contextRoot}/logout">Logout</a>
						</li>
					</ul></li>
			</security:authorize>
		</ul>

		</nav>

	</div>