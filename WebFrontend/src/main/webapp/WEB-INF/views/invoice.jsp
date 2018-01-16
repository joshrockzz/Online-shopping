
<br />
<div class="container">
	<div class="row">

		<h1>Your order has been placed!</h1>
		<br>
		<h1>Order Details</h1>
	</div>
	<div class="row">
		<div class='form-row'>
			&emsp;<label class='control-label'>Date: </label>&nbsp;
			<p id=demo></p>

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
				<div class="col-sm-12 col-md-10 col-md-offset-1">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Product</th>
								<th>Quantity</th>
								<th class="text-center">Price</th>
								<th class="text-center">Total</th>
								
							</tr>
						</thead>
						<tbody>

							<c:forEach var="list" items="${usercartlist}">
								<c:forEach var="productlist" items="${productList}">
									<c:if test="${list.productId==productlist.id}">
										<tr>
											<td class="col-sm-8 col-md-6">
												<div class="media">
													<a class="thumbnail pull-left" href="#"> <img
														src="<c:url value="/resources/images/products/${list.productId}.jpg"/>"
														height="150" width="150" class="img img-responsive" />
													</a>
													<div class="media-body">
														<h4 class="media-heading">${productlist.name}</h4>
													</div>
												</div>
											</td>

											<td class="col-sm-1 col-md-1" style="text-align: center">
												${list.quantity}</td>

											<td class="col-sm-1 col-md-1 text-center"><i
												class="fa fa-inr" aria-hidden="true"></i>
												${productlist.price}</td>

											<td class="col-sm-1 col-md-1 text-center"><strong><i
													class="fa fa-inr" aria-hidden="true"></i>
													${list.quantity*productlist.price}</strong> <c:set var="total"
													value="${total+list.quantity*productlist.price}">
												</c:set></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:forEach>


						</tbody>
					</table>
				</div>
			</div>
	
	
	
	<div class="row">
		<h2>Thank you for shopping with us!</h2>
	</div>
	<div class="row">
		<br> <a class="btn btn-success  btn-md" href="allproducts">
			Continue Shopping</a> &nbsp;&nbsp; <a class="btn btn-primary  btn-md"
			href="home">Home</a>

	</div>
</div>
<br />

<script>
	document.getElementById("demo").innerHTML = Date();
</script>
