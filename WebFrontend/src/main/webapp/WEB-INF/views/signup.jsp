<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>






<%@include file="./shared/navigation.jsp"%>


<!-- Regitration Form -->
<br />
<div class="container">
	<center>
		<c:if test="${match.equals('noperfectmatch')}">
			<div class="col-md-offset-3 col-md-6">
				<div class="alert alert-warning alert-dismissible fade show"
					role="alert" id="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>Password and Confirm password does not match</strong>
				</div>
			</div>
		</c:if>


		<div class="card w-50">

			<h3 class="card-header">Sign Up here</h3>

			<div class="card-body">

			<form:form modelAttribute="registrationForm" method="post"
					id="registerForm" class="form-horizontal">

					<div class="form-group row">
						<label for="name" class="col-3 col-form-label"> Name</label>
						<div class="col-9">
							<form:input type="text" class="form-control" id="name"
								path="name" placeholder="Firstname lastname" required="true" size="35"
								pattern="^[A-za-z]+\s[A-Za-z]+$" title="Enter Valid Name" />
						</div>
					</div>
					<div class="form-group row">
						<label for="email" class="col-3 col-form-label">Email</label>
						<div class="col-9">
							<form:input type="email" class="form-control" id="email"
								placeholder="eg: you@gmail.com" path="email" required="true"
								size="35" />
						</div>
					</div>
					<div class="form-group row">
						<label for="address" class="col-3 col-form-label">Address</label>
						<div class="col-9">
							<form:textarea type="text" row="7" class="form-control" cols="50"
								placeholder="Complete Address" id="address" path="address"
								required="true" />
						</div>
					</div>
					<div class="form-group row">
						<label for="country" class="col-3 col-form-label">Country</label>
						<div class="col-9">
							<form:input type="text" class="form-control" id="country"
								placeholder="eg:India,US,UK" path="country" required="true" pattern="^[A-Za-z]+$" title="invalid country" />
						</div>
					</div>
					<div class="form-group row">
						<label for="contact" class="col-3 col-form-label">Contact</label>
						<div class="col-9">
							<form:input type="text" class="form-control" id="contact"
								placeholder="Contact no." path="contact" required="true"
								maxlength="10" minlength="10" pattern="^\d{10}$"
								title="Enter valid contact no" />
							<form:errors path="contact" cssClass="help-block" element="em" />
						</div>
					</div>
					<div class="form-group row">
						<label for="password" class="col-3 col-form-label">Password</label>
						<div class="col-9">
							<form:input type="password" class="form-control" id="password"
								placeholder="Password" path="password" required="true" size="35"
								pattern="[A-Za-z0-9!@#$%&*]{6,15}"
								title="minimum password length must be 6 and maximum 15" />
						</div>
					</div>
					<div class="form-group row">
						<label for="confirmPassword" class="col-3 col-form-label">Confirm
							Password</label>
						<div class="col-9">
							<form:input type="password" class="form-control"
								placeholder="Confirm password" id="confirmPassword"
								path="confirmPassword" required="true" size="35"
								pattern="[A-Za-z0-9!@#$%&*]{6,15}" />
						</div>
					</div>

					<div class="form-group row ">
						<div class="offset-col-3 col-9">
							<button type="submit" class="btn btn-primary "
								formaction="register">Register</button>

						</div>
					</div>
					<div class="offset-col-3 col-9">
						<h5>Already a user?</h5>
						<a href="login">Click here</a>
					</div>

				</form:form>


			</div>

		</div>
</div>
</center>
</div>
<br />

<script type="text/javascript">
	setTimeout(function() {
		$('#alert').hide('fade');

	}, 3000)
</script>


<%@include file="./shared/footer.jsp"%>
</body>
</html>