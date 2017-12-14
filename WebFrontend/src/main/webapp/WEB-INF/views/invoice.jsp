<%@include file="./shared/navigation.jsp"%>
<br />
<div class="container">
	<div class="row">

		<h1>Your order has been placed!</h1>
		<br>
		<h1>Order Details</h1>
	</div>
	<div class="row">
	<div class='form-row'>
	&emsp;<label class='control-label'>Date: </label>&nbsp;<p id=demo></p>
	
	</div>
	</div>
	<div class="row">
		<div class='form-row'>
			&emsp;<label class='control-label'>Customer Name: </label>&nbsp;${usermodel.name}
		</div>
	</div>
	<div class="row">
		<div class='form-row'>
			&emsp;<label class='control-label'>Customer Email: </label>&nbsp;${usermodel.email}
		</div>
	</div>
	<div class="row">
		<div class='form-row'>
			&emsp;<label class='control-label'>Customer Phone: </label>&nbsp;${usermodel.contact}
		</div>
	</div>
	<div class="row">
		<div class='form-row'>
			&emsp;<label class='control-label'>Shipping Address: </label>&nbsp;${usermodel.address}
		</div>
	</div>

	<div class="row">
		<div class='form-row'>
			&emsp;<label class='control-label'>Amount Payable: </label>&nbsp;Rs.
			${total}
		</div>
	</div>
	<div class="row">
		<div class='form-row'>
			&emsp;<label class='control-label'>Date of Delivery:
				Delivered within 7 working days</label>
		</div>
	</div>
	<br />
	<div class="row">
		<h2>Thank you for shopping with us!</h2>
	</div>
	<div class="row">
		<br> <a class="btn btn-success  btn-md" href="allproduct"><span
			class="glyphicon glyphicon-shopping-cart"></span>Continue Shopping</a>
		&nbsp;&nbsp; <a class="btn btn-primary  btn-md" href="home">Home</a>

	</div>
</div>
<br />

<script>
document.getElementById("demo").innerHTML = Date();
</script>
<%@include file="./shared/footer.jsp"%>