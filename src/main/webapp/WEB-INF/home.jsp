<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<!-- c:out ; c:forEach etc. -->
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<!-- Formatting (dates) -->
			<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<!-- form:form -->
				<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
				<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
					<!-- for rendering errors on PUT routes -->
					<%@ page isErrorPage="true" %>
						<!DOCTYPE html>
						<html>

						<head>
							<meta charset="UTF-8">
							<!-- CSS only -->
							<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
								rel="stylesheet"
								integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
								crossorigin="anonymous">
							<link rel="stylesheet"
								href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

							<link rel="stylesheet" type="text/css" href="/style.css">
							<title>Home</title>

						</head>

						<body>

							<nav class="navbar navbar-expand-lg bg-light">
								<div class="container-fluid">
									<a class="navbar-brand" href="#">LOGO</a>
									<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
										data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
										aria-expanded="false" aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>
									<div class="collapse navbar-collapse" id="navbarSupportedContent">
										<ul class="navbar-nav me-auto mb-2 mb-lg-0">
											<li class="nav-item">
												<a class="nav-link active" aria-current="page" href="#">Home</a>
											</li>

											<li class="nav-item">
												<a class="nav-link" href="#">Top Products</a>
											</li>

											<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle" href="#" role="button"
													data-bs-toggle="dropdown" aria-expanded="false">
													Categories
												</a>
												<ul class="dropdown-menu">
													<li><a class="dropdown-item" href="#">Body Care</a></li>
													<li><a class="dropdown-item" href="#">Hair Care</a></li>
													<li><a class="dropdown-item" href="#">Lip Care</a></li>
													<li>
														<hr class="dropdown-divider">
													</li>
													<li><a class="dropdown-item" href="#">All Products</a></li>
												</ul>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="#">Contact</a>
											</li>

										</ul>
										<form class="d-flex" role="search" action="/search" method="post">
											<input class="form-control me-2" type="search" placeholder="Search"
												aria-label="Search" name="searchKey">
											<button class="btn btn-outline-success" type="submit">Search</button>
										</form>

										<ul class="navbar-nav  mb-2 mb-lg-0">
											<c:if test="${!role.equals('admin')}">
											<li class="nav-item">
												<div id="ex4">
													<a href="/cart">
														<span class="p1 fa-stack fa-2x has-badge" data-count="${productCount}">
															<!--<i class="p2 fa fa-circle fa-stack-2x"></i>-->
	
															<i class="p3 fa fa-shopping-cart fa-stack-1x xfa-inverse"
																data-count="4b"></i>
														</span>
													</a>
												</div>
											</li>
											</c:if>
											<li class="nav-item dropdown">
												<a class="nav-link dropdown-toggle" href="#" role="button"
													data-bs-toggle="dropdown" aria-expanded="false">
													<i class="fa fa-user" style="font-size:36px"></i>
												</a>
												<ul class="dropdown-menu">
													<li>
														<c:if test="${sessionScope.user_id != null}">
															<a class="dropdown-item" href="/profile">Profile
																<c:out value="${user.fName}" />
															</a>
														</c:if>
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

							<div class="carousel-card">
								<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
									<div class="carousel-indicators">
										<button type="button" data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="0" class="active" aria-current="true"
											aria-label="Slide 1"></button>
										<button type="button" data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="1" aria-label="Slide 2"></button>
										<button type="button" data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="2" aria-label="Slide 3"></button>
									</div>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="/image/carsole1.jpg" class="d-block w-100" alt="...">
										</div>
										<div class="carousel-item">
											<img src="/image/carsole2.jpg" class="d-block w-100" alt="...">
										</div>
										<div class="carousel-item">
											<img src="/image/carsole3.jpg" class="d-block w-100" alt="...">
										</div>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
							</div>

							<div class="container w-75 mt-5">
								<c:if test="${not empty success}">
									<div class="alert alert-success mt-4">
										<c:out value="${success}" />
									</div>
								</c:if>
								<c:if test="${not empty error}">
									<div class="alert alert-danger mt-4">
										<c:out value="${error}" />
									</div>
								</c:if>

								<!-- <form class="form-inline w-50 " action="/search" method="post">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" name="searchKey"/>
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  </form> -->

								<div class="d-flex align-items-center justify-content-between">
									<div class="mt-4">
										<h1 style="color:#0d6efd">Welcome
											<c:out value="${user.fName}" />
										</h1>
										<br>
										
									</div>
					
								</div>

		
								<p>List Products</p>
								
	<c:choose>
    <c:when test="${products.size() == 0}">
        <h3>no products to display !! </h3>
        <br />
    </c:when>    
    <c:otherwise>
	    <table class="table">
					<thead>
						<tr>
							<th scope="col">Product Name</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>
							<th scope="col">Availability</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="product">
							<tr>
								<td><u><a style="color: #0d6efd"
										href='<c:url value="/products/${product.id}/1"/>'> <c:out
												value="${product.name}" />
									</a></u></td>
								<td><c:out value="${product.price}" /></td>
								
								<c:choose>
								<c:when test="${product.countInStock == 0}">
								<td><a class="btn btn-outline-primary disabled"
									style="color: #0d6efd" href="/addCart/${product.id}">Add to
										Cart</a></td>

								<td><p style="color: red">out of stock</p></td>
										

										</c:when>
										<c:when test="${product.countInStock <= 3}">
										
										 <td><a class="btn btn-outline-primary"
									style="color: #0d6efd" href="/addCart/${product.id}">Add to
										Cart</a></td>
											<td><p style="color: orange">about to end</p></td>

										</c:when>
										<c:otherwise>
										<td><a class="btn btn-outline-primary "
									style="color: #0d6efd" href="/addCart/${product.id}">Add to
										Cart</a></td>
										
											<td><p style="color: green">available</p></td>
										</c:otherwise>
									</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
								<br>
								
							</div>
				</c:otherwise>
</c:choose>			
							

							<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
								integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
								crossorigin="anonymous"></script>
						</body>

						</html>
