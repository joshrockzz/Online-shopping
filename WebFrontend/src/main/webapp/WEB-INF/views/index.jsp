<%@include file="./shared/navigation.jsp"%>





<c:if test="${userClickHome == true }">
	<%@include file="home.jsp"%>
</c:if>

<c:if
	test="${userClickAllProducts == true} ">
	<%@include file="listproducts.jsp"%>
</c:if>

<c:if
	test="${userClickCategoryProducts == true} ">
	<%@include file="listproducts.jsp"%>
</c:if>


<c:if test="${userClickSingleProduct == true }">
	<%@include file="singleproduct.jsp"%>
</c:if>

<c:if test="${userClickInvoice == true }">
	<%@include file="invoice.jsp"%>
</c:if>

<c:if test="${userClickCheckout == true }">
	<%@include file="checkout.jsp"%>
</c:if>

<c:if test="${userClickCart == true }">
	<%@include file="cart.jsp"%>
</c:if>


<%@include file="./shared/footer.jsp"%>