<%@include file="./shared/navigation.jsp" %>

<div class="container">

	<!-- Breadcrumb -->
	<div class="row">
		
		<div class="col-xs-12">
		
			
			<ul class="breadcrumb">
			
				<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
				<li class="breadcrumb-item"><a href="${contextRoot}/allproduct">Products</a></li>
				<li class="breadcrumb-item active">${product.name}</li>
			
			</ul>
		
		
		</div>
	
	
	</div>
	
	
	<div class="row">
	
		<!-- Display the product image -->
		<div class="col-xs-12 col-sm-4">
		
			<div class="thumbnail">
							
				<img src="${images}/products/${product.id}.jpg" class="img-thumbnail"> 
						
			</div>
		
		</div>
	
		
		<!-- Display the product description -->	
		<div class="col-xs-12 col-sm-8">
		
			<h3>${product.name}</h3>
			<hr/>
			
			<p>${product.description}</p>
			<hr/>
			
			<h4>Price: <strong><i class="fa fa-inr" aria-hidden="true"></i> ${product.price} /-</strong></h4>
			<hr/>
			
			
			
						
					
					
					
				<!-- 	<c:choose>
					
					<c:when test="${product.stock < 1}">
					
					<h6>Qty. Available: <span style ="color:red">Out of Stock!</span></h6>
					
					</c:when>
					
					<c:otherwise>
					<a href="${contextRoot}/cartadd${product.id}" class="btn btn-success">
				<span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</a>
			
					
					</c:otherwise>
					
					
					
					</c:choose> -->
					
					
					
					<c:choose>
					
					<c:when test="${product.stock < 1}">
					
					<a href="javascript:void(0)" class="btn btn-success disabled">
				<span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</a>
			
					
					</c:when>
					
					<c:otherwise>
					
					<form action="cartadd${product.id}">
			<label><h4>Quantity</h4></label>
			<input type="number" name=quant value="1"style="width:50px;">
			<br/><br/>
			<button type="submit" class="btn btn-success"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Add to Cart</button>
			</form>
					
					</c:otherwise>
					
					
					</c:choose>
					
					<a href="${contextRoot}/allproduct" class="btn btn-primary">
				Back</a>
		</div>

	
	</div>

</div>

<%@include file="./shared/footer.jsp" %>