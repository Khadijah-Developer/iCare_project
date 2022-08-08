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
<title>Home</title>
</head>
<body>
 	
<div class="container w-75">
		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>
		
 
  <form class="form-inline w-50 " action="/search" method="post">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" name="searchKey"/>
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  </form>
  
 

		<div class="d-flex align-items-center justify-content-between">
			<div class="mt-4">
				<h1 style="color:#0d6efd">Welcome </h1>
				<br>
				
			</div>
			<div class="d-flex flex-column align-items-end">
			<a class="btn btn-outline-primary"  href = "/logout">Logout</a>
				<br>
				
			</div>
			
		</div>
		<p>List Products</p>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Product Name</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${products}" var="product">
					<tr>	
						<td ><u><a style="color:#0d6efd"  href='<c:url value="/products/${product.id}"/>' ><c:out value="${product.name}"/></a></u></td>
						<td ><c:out value="${product.price}"/></td>
						<td><a class="btn btn-outline-primary" style="color:#0d6efd" href = "/product/new">Add to Cart</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
					<div class="d-flex flex-column align-items-end">
			<!-- 	<a class="btn btn-outline-primary" style="color:#0d6efd" href = "/product/new">Add a Product</a>-->
				<br>
				
			</div>
					<div class="d-flex flex-column align-items-end">
			<!-- 	<a class="btn btn-outline-primary" style="color:#0d6efd" href = "/order/new">Add a Order</a> -->
				<br>
				
			</div>
	</div>
 	
</body>
</html>