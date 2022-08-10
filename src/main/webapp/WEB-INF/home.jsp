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
							<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
							integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
							<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
							<script type="text/javascript" src="/counter.js"></script>
							<title>Home</title>
						
						</head>

						<body>
							<section class="navbr">
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
														<li><a class="dropdown-item" href="/filter" name="">Body Care</a></li>
														<li><a class="dropdown-item" href="/filter" name="">Hair Care</a></li>
														<li><a class="dropdown-item" href="/filter" name="Care">Care</a></li>
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
	

							</section>

							<section class="carousel-card-ads">
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
							</section>

							<div class="one">
								<h1>All Products</h1>
							</div>
							  
							<section class="all-products d-flex justify-content-around container">
						
								<c:forEach items="${products}" var="product">
								<a href='<c:url value="/products/${product.id}/1"/>'> 
								<div class="container-cards mt-2">
									<img src="${product.photosImagePath[0]}" alt="">
									<div class="content">
										<div class="box">
											<span class="class1">Product Name</span>
											<span class="class2"><c:out value="${product.name}" /></span>
											<span class="class3"><c:out value="${product.price}"/></span>
										</div>
										<div class="box">
											<span class="class1">Brand</span>
											<span class="class2"><c:out value="${product.brand}" /></span>
										</div>
										<div class="box">
											<span class="class1">Review</span>
											<span class="class2">
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star checked"></span>
												<span class="fa fa-star"></span>
												<span class="fa fa-star"></span>
											</span>
										</div>
										<a class="btn button-cart" 
										href="/addCart/${product.id}" >Add to Cart</a>
									</div>
								</div>
									 </a> 
						     	</c:forEach>
								 

								<!-- <div class="container-cards mt-2">
									<img src="/image/skin1.jpg" alt="">
									<div class="content">
										<div class="box">
											<span class="class1">Brand Name</span>
											<span class="class2">Men's Designer T-Shirt</span>
											<span class="class3">$55.99</span>
										</div>
										<div class="box">
											<span class="class1">Sizes</span>
											<span class="class2">
												<li>XS</li>
												<li>S</li>
												<li>M</li>
												<li>XL</li>
												<li>XXL</li>
											</span>
										</div>
										<div class="box">
											<span class="class1">Colors</span>
											<span class="class2">
												<li></li>
												<li></li>
												<li></li>
												<li></li>
												<li></li>
											</span>
										</div>
										<a href="#">Add To Cart</a>
									</div>
								</div> -->

							</section>
							<div>
								<nav aria-label="Page navigation example">
									<ul class="pagination">
									  <li class="page-item">
										<a class="page-link" href="#" aria-label="Previous">
										  <span aria-hidden="true">&laquo;</span>
										</a>
									  </li>
									  <li class="page-item"><a class="page-link" href="#">1</a></li>
									  <li class="page-item"><a class="page-link" href="#">2</a></li>
									  <li class="page-item"><a class="page-link" href="#">3</a></li>
									  <li class="page-item">
										<a class="page-link" href="#" aria-label="Next">
										  <span aria-hidden="true">&raquo;</span>
										</a>
									  </li>
									</ul>
								  </nav>
							</div>

							<section class="statistics">
								<div class="container">
									<div class="row">
									  <br/>
									  <div class="col text-center">
										<h2>iCare website</h2>
										<p>we have a greate achivment to show</p>
									  </div>
								  
									</div>
									<div class="row text-center">
									  <div class="col">
										<div class="counter">
											<i class="fa fa-bug fa-2x"></i>
										  <h2 class="timer count-title count-number" data-to="100" data-speed="1500"></h2>
										  <p class="count-text ">Our Customer</p>
										</div>
									  </div> 
									  <div class="col">
										<div class="counter">
										  <i class="fa fa-coffee fa-2x"></i>
										  <h2 class="timer count-title count-number" data-to="1700" data-speed="1500"></h2>
										  <p class="count-text ">Happy Clients</p>
										</div>
									  </div>
									  <div class="col">
										<div class="counter">
										  <i class="fa fa-lightbulb-o fa-2x"></i>
										  <h2 class="timer count-title count-number" data-to="11900" data-speed="1500"></h2>
										  <p class="count-text ">Project Complete</p>
										</div>
									  </div>
									  <div class="col">
										<div class="counter">
										  <i class="fa fa-coffee fa-2x"></i>
										  <h2 class="timer count-title count-number" data-to="157" data-speed="1500"></h2>
										  <p class="count-text ">Coffee With Clients</p>
										</div>
									  </div>
									</div>
								  </div>
							</section>

				     			<footer>
									<div class= "social-media">
										<div class="down-footer">
										
											<ul class="list-inline">

											<li class="list-inline-item active ">
												<a href="#" class="active"><i class="fa fa-facebook"></i></a>
											</li>

											<li class="list-inline-item">
												<a href="#"><i class="fa fa-twitter"></i></a>
											</li>
													
											<li class="list-inline-item">
												<a href="mailto:icare@hotmail.com" ><i class="fa fa-envelope" ></i></a>
											</li>
											<li class="list-inline-item">
												<a href="#"><i class="fa fa-phone"></i></a>
											</li>
											</ul>
											<hr>
											<a href="mailto:icare@hotmail.com" class="email">Corporate Headquarters 2105 S. Bascom Ave <i style="color:#eee" class="fa fa-envelope"></i> Copyright© 2022  icare@hotmail.com  <i style="color:#eee"  class="fa fa-phone"></i>  +1 650 385 2247</a>
										</div>
									</div>
								</footer>



<!-- 
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
</c:choose>			 -->
							 

							<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
								integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
								crossorigin="anonymous"></script>

							
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>						
</body>

</html>
