<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
 
	$(document).ready(function(){
        $(	'a[data-toggle="tab"]').on('show.bs.tab', function(e) {
            localStorage.setItem('activeTab', $(e.target).attr('href'));
        });
        var activeTab = localStorage.getItem('activeTab');
        if(activeTab){
            $('#admincontrol a[href="' + activeTab + '"]').tab('show');
        }
    });   
    </script>

</head>
<body>



<%@include file="./shared/navigation.jsp"%>

<br />
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

				<form:form id="categoryForm" modelAttribute="category">

					<form:input type="hidden" class="form-control" id="id" path="id" />



					<div class="form-group row">
						<label for="name" class="col-lg-3 col-form-label">Category
							Name</label>
						<div class="col-lg-9">
							<form:input type="text" class="form-control" id="name"
								path="name" />
							<sf:errors path="name" cssClass="help-block" element="em" />

						</div>
					</div>
					<div class="form-group row">
						<label for="description" class="col-lg-3 col-form-label">Description</label>
						<div class="col-lg-9">
							<form:textarea type="text" class="form-control" id="description"
								rows="3" cols="30" path="description" />

						</div>
					</div>


					<c:if test="${empty category.name}">

						<div class="form-group row">
							<div class="offset-lg-3 col-lg-9">
								<button type="submit" class="btn btn-default"
									formaction="addcategory">Add Category</button>
							</div>
						</div>
					</c:if>


					<c:if test="${!empty category.name}">
						<div class="form-group row">
							<div class="offset-lg-3 col-lg-9">
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

				<form:form modelAttribute="supplier" class="form-horizontal">

					<form:input type="hidden" class="form-control" id="id" path="id" />

					<div class="form-group row">

						<label for="name" class="col-lg-3 col-form-label">Supplier
							Name</label>
						<div class="col-lg-9">
							<form:input type="text" class="form-control" id="name"
								path="name" required="true" />

						</div>
					</div>
					<div class="form-group row">

						<label for="address" class="col-lg-3 col-form-label">Address</label>
						<div class="col-lg-9">
							<form:textarea type="text" class="form-control" id="address"
								rows="3" path="address" cols="30" />

						</div>
					</div>
					<div class="form-group row">

						<label for="contact_no" class="col-lg-3 col-form-label">Contact
							no.</label>
						<div class="col-lg-9">
							<form:input type="text" class="form-control" id="contact_no"
								path="contact_no" minlength="10" maxlength="10" required="true" pattern="^\d{10}$"
								title="Enter valid contact no" />

						</div>
					</div>
					<div class="form-group row">

						<label for="email" class="col-lg-3 col-form-label">Email</label>
						<div class="col-lg-9">
							<form:input type="email" class="form-control" id="email"
								path="email" required="true" />

						</div>
					</div>

					<c:if test="${empty supplier.name}">
						<div class="form-group row">
							<div class="offset-lg-3 col-lg-9">
								<button type="submit" class="btn btn-default"
									formaction="addsupplier">Add Supplier</button>
							</div>
						</div>
					</c:if>
					<c:if test="${!empty supplier.name}">
						<div class="form-group row">
							<div class="offset-lg-3 col-lg-9">
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
						<label for="brand" class="col-lg-3 col-form-label">Brand</label>

						<div class="col-lg-9">
							<form:input type="text" class="form-control" id="brand"
								path="brand" required="true" />
						</div>
					</div>


					<div class="form-group row">
						<label for="name" class="col-lg-3 col-form-label">Product
							Name</label>
						<div class="col-lg-9">
							<form:input type="text" class="form-control" id="name"
								path="name" required="true" />
						</div>
					</div>


					<div class="form-group row">
						<label for="description" class="col-lg-3 col-form-label">Description</label>

						<div class="col-lg-9">
							<form:textarea type="text" class="form-control" id="description"
								rows="3" path="description" cols="50" required="true" />
						</div>

					</div>

					<div class="form-group row">
						<label for="price" class="col-lg-3 col-form-label">Price</label>

						<div class="col-lg-9">
							<form:input type="text" class="form-control" id="price"
								path="price" required="true" />
						</div>

					</div>

					<div class="form-group row">
						<label for="stock" class="col-lg-3 col-form-label">Stock</label>

						<div class="col-lg-9">
							<form:input type="text" class="form-control" id="stock"
								path="stock" required="true"/>
						</div>

					</div>



					<div class="form-group row">
						<label for="stock" class="col-lg-3 col-form-label">Select
							Category</label>

						<div class="col-lg-9">
							<form:select class="custom-select" path="categoryId">
								<option selected>Select Category</option>
								<c:forEach var="list" items="${categoryList}">
									<form:option value="${list.id}">${list.name}</form:option>
								</c:forEach>
							</form:select>
						</div>

					</div>
					<div class="form-group row">
						<label for="stock" class="col-lg-3 col-form-label">Select
							Supplier</label>

						<div class="col-lg-9">
							<form:select class="custom-select" path="supplierId">
								<option selected>Select Supplier</option>
								<c:forEach var="list" items="${supplierList}">
									<form:option value="${list.id}">${list.name}</form:option>
								</c:forEach>
							</form:select>
						</div>

					</div>

					<div class="form-group row">
						<label for="mimage" class="col-lg-3 col-form-label">Select
							Image</label>
						<div class="col-lg-9">
							<form:input type="file" class="form-control" id="mimage"
								path="mimage" required="true" />
						</div>
					</div>


					<c:if test="${empty product.brand}">
						<div class="form-group row">
							<div class="offset-lg-3 col-lg-9">
								<button type="submit" class="btn btn-default"
									formaction="addproduct">Add Product</button>
							</div>
						</div>
					</c:if>
					<c:if test="${!empty product.brand}">
						<div class="form-group row">
							<div class="offset-lg-3 col-lg-9">
								<button type="submit" class="btn btn-default"
									formaction="updateproductdata">Update Product</button>
							</div>
						</div>
					</c:if>
				</form:form>

			</div>

			<div class="container-fluid">
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
					<tr>	<td><img src="${images}/products/${list.id}.jpg"
							class="img-thumbnail" height="100" width="100"></td>
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
</body>
</html>