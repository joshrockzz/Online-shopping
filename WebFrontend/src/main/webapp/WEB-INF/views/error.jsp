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
	<br />
	<div class="container">

		<div class="row">



			<div class="jumbotron">

				<h1 class="text-center">${errorTitle}</h1>
				<hr />

				<blockquote>${errorDescription}</blockquote>

			</div>


		</div>


	</div>