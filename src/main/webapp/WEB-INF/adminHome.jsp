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
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/style.css">
<title>Admin</title>
<style>


</style>
</head>
<body class=" bg-light">
 	<%-- include other jsp file to include the admin navbar --%>
 <jsp:include page="adminNavbar.jsp" /> 								
<div class="container w-75">
		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>
		
		<div class="d-flex align-items-center justify-content-between">
			<div class="mt-4">
				<h1 >Welcome, <c:out value="${user.fName}"/></h1>
				
				<br>
			</div>
		</div>
		<div class="border border-3 p-4 bg-white border-dark "> 
		<h3>List Products</h3>
		<table class="table mt-4 table-responsive">
			<thead>
				<tr>
					<th scope="col">Product Name</th>
					<th scope="col">Price</th>
					<th scope="col" >In Stock</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${products}" var="product">
					<tr>	
						<td ><u class="font-weight-bold"><a style="color:hsl(296, 13%, 48%)"  href='<c:url value="/products/${product.id}/1"/>' ><c:out value="${product.name}"/></a></u></td>
						<td ><c:out value="${product.price}"/></td>
						<td ><c:out value="${product.countInStock }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
					<div class="d-flex flex-column align-items-end">
				<a class="btn btn-dark" href = "/product/new">Add a Product</a>
				<br>
				
			</div>
					<h3>List Orders</h3>
<table class="table mt-4  table-responsive">
			<thead>
				<tr> 
					<th scope="col">Customer Name</th>
					<th scope="col">Total</th>
					<th scope="col" >Order Status</th>
					<th scope="col" >Update Order Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orders}" var="order">
					<tr>	
						<td ><a style="color:hsl(296, 13%, 48%);  font-weight: bold;"  href='<c:url value="/summary/${order.id}"/>' ><c:out value="${order.customer.fName}"/></a></td>
						<td ><c:out value="${order.totalPrice}"/></td>
						<td ><c:out value="${order.orderStatus }"/></td>
						<td>
						   <%-- If the order status not equals to shipped will be hidden --%>
                        <c:if test="${!order.orderStatus.equals('shipped')}">
						<%-- Update order status form --%>
						<form:form  action="/order/status/${order.id}" method="put" modelAttribute="order">
						<div class="d-flex justify-content-among m-2">
						<div class="mb-3"> 
							<form:select path="orderStatus" cssClass="form-control" cssErrorClass="form-control is-invalid">
									<form:option value="processed"> Processed</form:option>
									<form:option value="shipped"> Shipped</form:option>
									<form:option value="deliverd"> Deliverd</form:option>
							</form:select>
					    </div>
						<div>
						<input type="submit" id="submit" value="Update" class="btn btn-dark">
						</div>
						</div>
 						</form:form>
						</c:if>
						<%-- Update order status form --%>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
					
				
			</div>
	 </div>
 	 
</body>
</html>
