<%@include file="./shared/navigation.jsp"%>
<div class="container">
		<div class='row'>

			<div class='col-md-4'></div>
			<div class='col-md-4'>
				<div align="center">
					<h1>Checkout</h1>
				</div>
				<div class="col-sm-12 jumbotronTransp" align="center">
					<div class="head">
						<h4>Customer Details</h4>
					</div>
				</div>
				<div class='form-row'>
					&nbsp;&nbsp;<label class='control-label'>Name: </label>&nbsp;
					&nbsp;&nbsp;&nbsp;${usermodel.name}
				</div>
				<div class='form-row'>
					&nbsp;&nbsp;<label class='control-label'>Email: </label>&nbsp;
					&nbsp;&nbsp;&nbsp;${usermodel.email}
				</div>
				<div class='form-row'>
					&nbsp;&nbsp;<label class='control-label'>Phone: </label>&nbsp;
					&nbsp;&nbsp;&nbsp;${usermodel.contact}
				</div>
				<div class='form-row'>
					&nbsp;&nbsp;<label class='control-label'>Address: </label>&nbsp;
					<br/>&nbsp;&nbsp;&nbsp;${usermodel.address}
				</div>
				<div class='form-row'>
					&nbsp;&nbsp;<label class='control-label'>Country: </label>&nbsp;
					&nbsp;&nbsp;&nbsp;${usermodel.country}
				</div>
				<div class="col-sm-12 jumbotronTransp" align="center">
					<div class="head">
						<h4>Payment Details</h4>
					</div>
				</div>
				<div class='form-row'>
					<div class='col-xs-12 form-group required'></div>
				</div>
				<div class='form-row'>
					<div class='col-xs-12 form-group required'>
						<label class='control-label'>Pay By</label> <select name="Payment">
							<option value="CD">Credit or Debit Card</option>
							<option value="COD">Cash on Delivery</option>
							<option value="NB">Net Banking</option>
						</select>
					</div>
				</div>

				<div class='form-row'>
					<div class='col-xs-12 form-group required'>
						<label class='control-label'>Name on Card</label> <input
							class='form-control' type='text'>
					</div>
				</div>
				<div class='form-row'>
					<div class='col-xs-12 form-group card required'>
						<label class='control-label'>Card Number</label> <input
							class='form-control card-number' type='text'>
					</div>
				</div>
				<div class='form-row'>
					<div class='col-xs-4 form-group cvc required'>
						<label class='control-label'>CVV</label> <input
							class='form-control card-cvc' placeholder='ex. 311' type='text'>
					</div>
					<div class='col-xs-4 form-group expiration required'>
						<label class='control-label'>Expiration</label> <input
							class='form-control card-expiry-month' placeholder='MM'
							type='text'>
					</div>
					<div class='col-xs-4 form-group expiration required'>
						<label class='control-label'> Year</label> <input
							class='form-control card-expiry-year' placeholder='YYYY'
							type='text'>
					</div>
				</div>


				<div class='form-row'>
					<div class='col-md-12 form-group'>
						<form action="invoice" method="post">
							<input type="hidden" value="${total}" name="total" />
							<tab4> <input
								class="form-control btn btn-primary "
								type="submit" value="Pay
							Rs. ${total}"></tab4>
						</form>
					</div>
				</div>
				<div class='form-row'>
					<div class='col-md-12 form-group'>
						<a class='form-control btn btn-primary'
							href="cartpage">Go to Cart</a>
					</div>
				</div>
			</div>
		</div>
</div>

<%@include file="./shared/footer.jsp"%>