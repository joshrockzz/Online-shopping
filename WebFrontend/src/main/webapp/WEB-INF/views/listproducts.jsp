<%@include file="./shared/navigation.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid">


	<div class="row">
		<div class="col-lg-12">
			<c:if test="${ userClickAllProducts==true}">
				<ul class="breadcrumb">

					<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
					<li class="breadcrumb-item active">All Products</li>
				</ul>


			</c:if>



			<c:if test="${ userClickCategoryProducts==true}">
				<ul class="breadcrumb">

					<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
					<li class="breadcrumb-item active">Category</li>
					<li class="breadcrumb-item active">${category.name}</li>



				</ul>
			</c:if>

			<div class="container-fluid">

				<table class="table table-sm table-bordered">
					<thead class="thead-inverse">
						<tr>
							<td>Image</td>
							<td>Brand</td>
							<td>Name</td>
							<td>Price</td>
							<td>Stock</td>
							<td>Quantity</td>
							<td></td>
						</tr>
					</thead>
					<c:forEach var="list" items="${productList}">
						<tbody>
							<tr>
								<td><img src="${images}/products/${list.id}.jpg"
									class="img-thumbnail" height="150" width="150"></td>
								<td>${list.brand }</td>
								<td>${list.name}</td>
								<td><i class="fa fa-inr" aria-hidden="true"></i>
									${list.price}</td>

								<c:choose>
									<c:when test="${list.stock<1}">
										<td><h6>
												<span style="color: red">Out of Stock!</span>
											</h6></td>
									</c:when>
									<c:otherwise>
										<td>${list.stock}</td>
									</c:otherwise>
								</c:choose>

								<security:authorize access="hasAuthority('USER')">
									<td>
										<form action="cartadd${list.id}">
											<input type="number" name=quant value="1" size="2"
												style="width: 40px;" />
									</td>

									<td><button type="submit" class="btn btn-primary">Add
											Cart</button>
										</form> <a href="${contextRoot}/singleproduct${list.id}"><button
												type="button" class="btn btn-primary">View</button></a></td>
							</tr>
							</security:authorize>
							
							
							<security:authorize access="isAnonymous()">
									<td>
										<form action="cartadd${list.id}">
											<input type="number" name=quant value="1" size="2"
												style="width: 40px;" />
									</td>

									<td><button type="submit" class="btn btn-primary">Add
											Cart</button>
										</form> <a href="${contextRoot}/singleproduct${list.id}"><button
												type="button" class="btn btn-primary">View</button></a></td>
							</tr>
							</security:authorize>
							
							<security:authorize access="hasAuthority('ADMIN')">
									
									<td><a  class="btn btn-primary" href='<c:url value="updateproduct${list.id}"/>'>Edit
											</a>
										 <a href='<c:url value="deleteproduct${list.id}"/>'><button
												type="button" class="btn btn-primary">Delete</button></a></td>
							</tr>
							</security:authorize>
							

						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>

<%@include file="./shared/footer.jsp"%>