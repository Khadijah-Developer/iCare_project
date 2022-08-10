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
</head>
<body>
 	
 
							<nav class="navbar navbar-expand-lg bg-light">
								<div class="container-fluid">
									<a class="navbar-brand" href="#">Admin</a>
									<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
										data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
										aria-expanded="false" aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>
									<div class="collapse navbar-collapse" id="navbarSupportedContent">
										<ul class="navbar-nav me-auto mb-2 mb-lg-0">
											<li class="nav-item">
												<a class="nav-link active" aria-current="page" href="/home">Home</a>
											</li>

										</ul>
										<form class="d-flex" role="search" action="/search" method="post">
											<input class="form-control me-2" type="search" placeholder="Search"
												aria-label="Search" name="searchKey">
											<button class="btn btn-outline-success" type="submit">Search</button>
										</form>

										<ul class="navbar-nav  mb-2 mb-lg-0">
											
											<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle" href="#" role="button"
													data-bs-toggle="dropdown" aria-expanded="false">
													<i class="fa fa-user" style="font-size:36px"></i>
												</a>
												<ul class="dropdown-menu">
													<li>
														
															<a class="dropdown-item" href="/profile">Profile
															</a>
														
													</li>

													<!-- <li><a class="dropdown-item" href="#">Profile</a></li> -->
													<li><a class="dropdown-item" href="#">Orders</a></li>
													<li class=" dropdown-item">
														<c:choose>
															<c:when test="${sessionScope.user_id != null}">
																<div class="mr-2 logout ">
																	<a href="/logout" class="icon-logout">Logout </a>
																	<a href="/logout"></a> <i class="fa fa-sign-out"
																		style="font-size:25px"></i></a>
																</div>
															</c:when>
															<c:otherwise>
																<div class="mr-2 logout ">
																	<a href="/" class="icon-logout">LogIn </a>
																	<a href="/"></a><i class="fa fa-sign-out"
																		style="font-size:25px"></i></a>
																</div>
															</c:otherwise>
														</c:choose>
													</li>
												</ul>
											</li>

										</ul>









									</div>
								</div>
							</nav>

							
							
								
<div class="container w-75">
		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>
		
		<div class="d-flex align-items-center justify-content-between">
			<div class="mt-4">
				<h1 style="color:#0d6efd">Welcome, <c:out value="${user.fName}"/></h1>
				<br>
				
			</div>
			
			
		</div>
		<p>List Products</p>
		<table class="table">
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
						<td ><u><a style="color:#0d6efd"  href='<c:url value="/products/${product.id}"/>' ><c:out value="${product.name}"/></a></u></td>
						<td ><c:out value="${product.price}"/></td>
						<td ><c:out value="${product.countInStock }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
					<div class="d-flex flex-column align-items-end">
				<a class="btn btn-outline-primary" style="color:#0d6efd" href = "/product/new">Add a Product</a>
				<br>
				
			</div>
					<p>List Orders</p>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Customer Name</th>
					<th scope="col">Total</th>
					<th scope="col" >Order Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orders}" var="order">
					<tr>	
						<td ><a style="color:#0d6efd"  href='<c:url value="/order/${order.id}"/>' ><c:out value="${product.customer.fName}"/></a></td>
						<td ><c:out value="${order.totalPrice}"/></td>
						<td ><c:out value="${order.orderStatus }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
					
				
			</div>
	</div>
 	
</body>
</html>
