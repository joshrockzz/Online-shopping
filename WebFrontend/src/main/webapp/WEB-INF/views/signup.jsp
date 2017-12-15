<%@include file="./shared/navigation.jsp" %>


	<!-- Regitration Form -->
	<br />
	<div class="container">
	<center>
	<c:if test="${match.equals('noperfectmatch')}">
	<div class="col-md-offset-3 col-md-6">
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
	 <span aria-hidden="true">&times;</span>
  </button>
	<strong>Password and Confirm password does not match</strong>
	</div>
	</div>
</c:if>
	
	
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
	</div>
	</br>


	<%@include file="./shared/footer.jsp"%>