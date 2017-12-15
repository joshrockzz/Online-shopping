<%@include file="./shared/navigation.jsp"%>
<br />
<div class="container">
	<c:choose>
		<c:when test="${not empty usercartlist}">

			<div class="row">
				<div class="col-sm-12 col-md-10 col-md-offset-1">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Product</th>
								<th>Quantity</th>
								<th class="text-center">Price</th>
								<th class="text-center">Total</th>
								<th></th>
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
														<span>Status: </span><span class="text-success"><strong>In
																Stock</strong></span>
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

											<td class="col-sm-1 col-md-1"><a
												href="<c:url value="cartremove${list.cartItemId}"/>"
												class="btn btn-danger"> <i class="fa fa-trash"
													aria-hidden="true"></i> Remove
											</a></td>
										</tr>
									</c:if>
								</c:forEach>
							</c:forEach>

							<tr>
								<td></td>
								<td></td>
								<td>TOTAL</td>
								<td><strong><i class="fa fa-inr"
										aria-hidden="true"></i> ${total}</strong></td>

							</tr>


							<tr>
								<td><a class="btn btn-primary" href="allproduct"> <i
										class="fa fa-shopping-cart" aria-hidden="true"></i> Continue
										Shopping
								</a></td>

								<td>

									<form action="checkout" method="post">
										<input type="hidden" value="${total}" name="total" />

										<button type="submit" class="btn btn-success">
											Checkout <span class="glyphicon glyphicon-play"></span>
										</button>
									</form>


								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="jumbotron">

				<h3 class="text-center">Your Cart is Empty!</h3>

			</div>

			<a class="btn btn-primary" href="allproduct"> <i
				class="fa fa-shopping-cart" aria-hidden="true"></i> Continue
				Shopping
			</a>


		</c:otherwise>
	</c:choose>
</div>
<br />
<%@include file="./shared/footer.jsp"%>