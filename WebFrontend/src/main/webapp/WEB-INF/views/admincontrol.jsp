
<%@include file="./shared/navigation.jsp"%>

<div class="container-fluid">

	<ul id="admincontrol" class="nav nav-tabs" role="tablist">

		<li class="nav-item"><a class="nav-link active" href="#category"
			id="category-tab" role="tab" data-toggle="tab"
			aria-controls="category" aria-expanded="true">Category</a></li>

		<li class="nav-item"><a class="nav-link" href="#supplier"
			role="tab" id="supplier-tab" data-toggle="tab"
			aria-controls="supplier">Supplier</a></li>

		<li class="nav-item"><a class="nav-link" href="#product"
			role="tab" id="product-tab" data-toggle="tab" aria-controls="product">Product</a>
		</li>


	</ul>

	<!-- Content Panel -->
	<div id="admincontrol-nav-content" class="tab-content">

		<!-- Category Controller -->

		<div role="tabpanel" class="tab-pane fade show active" id="category"
			aria-labelledby="category-tab">

			<div class="container">
			
					<h3>Add Category</h3>

					<form:form modelAttribute="category">

						<form:input type="hidden" class="form-control" id="id" path="id" />


						<div class="form-group row">
							<label for="name" class="col-xs-3 col-form-label mr-2">Category
								Name</label>
							<div class="col-xs-9">
								<form:input type="text" class="form-control" id="name"
									path="name" required="true" />
							</div>
						</div>
						<div class="form-group row">
							<label for="description" class="col-xs-3 col-form-label mr-5">Description</label>
							<div class="col-xs-9">
								<form:textarea type="text" class="form-control" id="description"
									rows="3" cols="30" path="description" />
							</div>
						</div>


						<c:if test="${empty category.name}">

							<div class="form-group row">
								<div class="offset-xs-3 col-xs-9">
									<button type="submit" class="btn btn-default"
										formaction="addcategory">Add Category</button>
								</div>
							</div>
						</c:if>


						<c:if test="${!empty category.name}">
							<div class="form-group row">
								<div class="offset-xs-3 col-xs-9">
									<button type="submit" class="btn btn-default"
										formaction="updateCategoryData">Update Category</button>
								</div>
							</div>
						</c:if>
					</form:form>
			</div>

			<div class="container">
				<h3>List of Category</h3>

				<table class="table table-sm table-bordered table-striped">
					<thead>
						<tr>
							<td>ID</td>
							<td>Category Name</td>
							<td>Description</td>
							<td>Action</td>
						</tr>
					</thead>

					<c:forEach var="list" items="${categoryList}">
						<tr>
							<td>${list.id}</td>
							<td>${list.name}</td>
							<td>${list.description}</td>
							<td><a href="<c:url value="updateCategory${list.id}"/>"
								class="btn btn-primary">EDIT</a> <a
								href="<c:url value="deleteCategory${list.id}"/>"
								class="btn btn-danger">DELETE</a></td>
						</tr>
					</c:forEach>

				</table>

			</div>

		</div>

		<!-- Supplier Controller -->

		<div role="tabpanel" class="tab-pane fade" id="supplier"
			aria-labelledby="supplier-tab">

			<div class="container">

				<h3>Add Supplier</h3>
				<form:form modelAttribute="supplier">

					<form:input type="hidden" class="form-control" id="id" path="id" />

					<div class="form-group row">
						<label for="name" class="col-xs-3 col-form-label mr-2">Supplier
							Name</label>
						<div class="col-xs-9">
							<form:input type="text" class="form-control" id="name"
								path="name" required="true" />
						</div>
					</div>
					<div class="form-group row">
						<label for="address" class="col-xs-3 col-form-label mr-2">Address</label>
						<div class="col-xs-9">
							<form:textarea type="text" class="form-control" id="address"
								rows="3" path="address" cols="30" />
						</div>
					</div>
					<div class="form-group row">
						<label for="contact_no" class="col-xs-3 col-form-label mr-2">Contact
							no.</label>
						<div class="col-xs-9">
							<form:input type="text" class="form-control" id="contact_no"
								path="contact_no" maxlength="10" required="true" />
						</div>
					</div>
					<div class="form-group row">
						<label for="email" class="col-xs-3 col-form-label mr-2">Email</label>
						<div class="col-xs-9">
							<form:input type="email" class="form-control" id="email"
								path="email" required="true" />
						</div>
					</div>
					<c:if test="${empty supplier.name}">
						<div class="form-group row">
							<div class="offset-xs-3 col-xs-9">
								<button type="submit" class="btn btn-default"
									formaction="addsupplier">Add Supplier</button>
							</div>
						</div>
					</c:if>
					<c:if test="${!empty supplier.name}">
						<div class="form-group row">
							<div class="offset-xs-3 col-xs-9">
								<button type="submit" class="btn btn-default"
									formaction="updatesupplierdata">Update Supplier</button>
							</div>
						</div>
					</c:if>
				</form:form>
			</div>

			<div class="container">
				<h3>List of Suppliers</h3>
				<table class="table table-sm table-bordered table-striped">
					<thead>
						<tr>
							<td>ID</td>
							<td>Supplier Name</td>
							<td>Address</td>
							<td>Contactno</td>
							<td>Email</td>
							<td>Action</td>
						</tr>
					</thead>

					<c:forEach var="list" items="${supplierList}">
						<tr>
							<td>${list.id}</td>
							<td>${list.name}</td>
							<td>${list.address}</td>
							<td>${list.contact_no}</td>
							<td>${list.email}</td>
							<td><a href="<c:url value="updatesupplier${list.id}"/>"
								class="btn btn-primary">EDIT</a> <a
								href="<c:url value="deletesupplier${list.id}"/>"
								class="btn btn-danger">DELETE</a></td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>


		<!-- Product Controller -->

		<div role="tabpanel" class="tab-pane fade" id="product"
			aria-labelledby="product-tab">
			<div class="container">

				<h3>Add Product</h3>
				<form:form modelAttribute="product" enctype="multipart/form-data">

					<form:input type="hidden" class="form-control" id="id" path="id" />

					<div class="form-group row">
						<label for="brand" class="col-xs-3 col-form-label mr-4">Brand</label>
						<div class="col-xs-9">
							<form:input type="text" class="form-control" id="brand"
								path="brand" required="true" />
						</div>
					</div>
					<div class="form-group row">
						<label for="name" class="col-xs-3 col-form-label mr-2">Product
							Name</label>
						<div class="col-xs-9">
							<form:input type="text" class="form-control" id="name"
								path="name" required="true" />
						</div>
					</div>
					<div class="form-group row">
						<label for="description" class="col-xs-3 col-form-label mr-2">Description</label>
						<div class="col-xs-9">
							<form:textarea type="text" class="form-control" id="description"
								rows="3" path="description" cols="50" required="true" />
						</div>
					</div>
					<div class="form-group row">
						<label for="price" class="col-xs-3 col-form-label mr-2">Price</label>
						<div class="col-xs-9">
							<form:input type="text" class="form-control" id="price"
								path="price" required="true" />
						</div>
					</div>
					<div class="form-group row">
						<label for="stock" class="col-xs-3 col-form-label mr-2">Stock</label>
						<div class="col-xs-9">
							<form:input type="text" class="form-control" id="stock"
								path="stock" required="true" />
						</div>
					</div>

					<div class="form-group row">
						<label for="stock" class="col-xs-3 col-form-label mr-2">Select
							Category</label>
						<div class="col-xs-9">
							<form:select class="custom-select" path="categoryId">
								<option selected>Select Category</option>
								<c:forEach var="list" items="${categoryList}">
									<form:option value="${list.id}">${list.name}</form:option>
								</c:forEach>
							</form:select>
						</div>
					</div>

					<div class="form-group row">
						<label for="stock" class="col-xs-3 col-form-label mr-2">Select
							Supplier</label>
						<div class="col-xs-9">
							<form:select class="custom-select" path="supplierId">
								<option selected>Select Supplier</option>
								<c:forEach var="list" items="${supplierList}">
									<form:option value="${list.id}">${list.name}</form:option>
								</c:forEach>
							</form:select>
						</div>
					</div>


					<div class="form-group row">
						<label for="mimage" class="col-xs-3 col-form-label mr-2">Select
							Image</label>
						<div class="col-xs-9">
							<form:input type="file" class="form-control" id="mimage"
								path="mimage" required="true" />
						</div>
					</div>

					<c:if test="${empty product.brand}">
						<div class="form-group row">
							<div class="offset-xs-3 col-xs-9">
								<button type="submit" class="btn btn-default"
									formaction="addproduct">Add Product</button>
							</div>
						</div>
					</c:if>
					<c:if test="${!empty product.brand}">
						<div class="form-group row">
							<div class="offset-xs-3 col-xs-9">
								<button type="submit" class="btn btn-default"
									formaction="updateproductdata">Update Product</button>
							</div>
						</div>
					</c:if>
				</form:form>
			</div>

			<div class="container">
				<h3>List of Products</h3>
				<table class="table table-sm table-bordered table-striped">
					<thead>
						<tr>
							<td>Image</td>
							<td>ID</td>
							<td>Brand</td>
							<td>Name</td>
							<td>Description</td>
							<td>Price</td>
							<td>Stock</td>
							<td>Action</td>
						</tr>
					</thead>

					<c:forEach var="list" items="${productList}">
						<td><img src="${images}/products/${list.id}.jpg" class="img-thumbnail"
							height="100" width="100"></td>
						<td>${list.id}</td>
						<td>${list.brand}</td>
						<td>${list.name}</td>
						<td>${list.description}</td>
						<td>${list.price}</td>
						<td>${list.stock}</td>
						<td><a href="<c:url value="updateproduct${list.id}"/>"
							class="btn btn-primary">EDIT</a> <a
							href="<c:url value="deleteproduct${list.id}"/>"
							class="btn btn-danger">DELETE</a></td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</div>
</div>

<%@include file="./shared/footer.jsp"%>