<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
crossorigin="anonymous">
<title>Checkout</title>
</head>
<body>
		<div class="container w-75">

		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>
		<form:form id="form" class="p-4 mb-0" method="post" enctype="multipart/form-data" modelAttribute="order" action="/order">
			<div class="container border">
					<div class="d-flex justify-content-between m-3">
						<h5>Delivery Address</h5>
						<a class="btn btn-link  p-1 pr-2 pl-2" href="/user/address/new" >Add a new address</a>
					</div>
					
					<p class="m-3">Name: <c:out value="${user.fName}"/> <c:out value="${user.lName}"/></p>
					<p class="m-3">Phone Number: <c:out value="${user.phoneNo}"/></p>
					<div class="m-3">
						<c:choose>
							<c:when test="${empty user.addresses}">
								Please Add Your Address.
							</c:when>
							<c:otherwise>
									<c:forEach items="${user.addresses}" var="address" varStatus="loop">
									
									<div >
										<c:choose>
											<c:when test="${loop.index== '0'}">
												<form:radiobutton checked="true" path="address" class="" selected="selected" value="${address.id}"/>
											</c:when>
											<c:otherwise>
												<form:radiobutton path="address" class="" value="${address.id}"/> 
											</c:otherwise>
										</c:choose>
											Address: <c:out value="${address.country}"/>, <c:out value="${address.state}"/>,
													<c:out value="${address.city}"/>,
													<c:out value="${address.district}"/>,<c:out value="${address.street}"/>,
													<c:out value="${address.postalCode}"/>
													<a class="btn btn-light  p-1 pr-2 pl-2" href="/user/address/${address.id}/edit">Edit</a>
									</div>
									</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
			</div>
				
				
			<div class="container border">
					<h5 class="m-3">Payment method</h5>
					<div class="form-check form-check-inline m-3">
					  <form:radiobutton class="form-check-input" path="paymentMethod" id="inlineCheckbox1" value="Paypal"/>
					  <label class="form-check-label" for="inlineCheckbox1">Paypal</label>
					</div>
					<div class="form-check form-check-inline m-3">
					  <form:radiobutton class="form-check-input"  path="paymentMethod" id="inlineCheckbox2" value="COD"/>
					  <label class="form-check-label" for="inlineCheckbox2">Cash on delivery</label>
					</div>
			</div>
			
		</form:form>
		
		
			<form class="p-4 mt-0 mb-0" method="post" action="/applyDiscount">
				<div class="container border">
					<div class="m-3">
						<h5>Discount/promo code</h5>
						<div class="d-flex w-50 justify-content-around">
							<input type="text" name="discount" class="form-control mr-4">
							<input type="submit" value="Apply Code" class="btn btn-light ml-3">
						</div>
					</div>
				</div>
			</form>
			<div class="p-4">
				<div class="container border p-4" >
					<p>Total Price: <c:out value="${totalPrice}"/> SAR</p>
					<c:if test="${not empty discount }"><p>Discount : -<c:out value="${discount}"/> SAR</p></c:if>
					<c:set var = "shpping"  value = "17"/>
					<c:if test="${totalPrice > 200}"><c:set var = "shpping"  value = "0"/></c:if>
					<p>Shipping Fees : +<c:out value="${shpping}"/> SAR</p>
					<h4>Total Price: <c:out value="${totalPrice+shpping-discount}"/> SAR</h4>
				</div>
			</div>
			<input type="submit" form="form" class="btn btn-dark" value="Place Order">
	</div>
	
</body>
</html>