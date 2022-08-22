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
					<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
					
						<!DOCTYPE html>
						<html>

						<head>
							<meta charset="UTF-8">
							<!-- CSS only -->
							<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
							<link rel="stylesheet"
								href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
							<link rel="stylesheet" type="text/css" href="/style.css">
							<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
							integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
							<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
							<script type="text/javascript" src="/counter.js"></script>
							<title>Home</title>
							<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" 
        integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />

		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<style>
		@media (max-width: 640px){
       footer {
       height: 40vh !important; 
     
          }
        footer .social-media {
       height: 40vh !important;
       }
		}
	
	</style>					
	</head>

						<body>
<%-- include other jsp file to include the navbar --%>
 <jsp:include page="navbar.jsp" /> 



<div style=" background: rgb(247, 243, 243);">						
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
												<img src="/image/banner1.png" class="d-block w-100" alt="...">
											</div>
											<div class="carousel-item">
												<img src="/image/banner2.png" class="d-block w-100" alt="...">
											</div>
											<div class="carousel-item">
												<img src="/image/banner4.png" class="d-block w-100" alt="...">
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

<c:if test="${bestSeller != null}">
	<div class="one mt-5" id="best">
		<h1>Best Seller</h1> 
	</div>
	
	<section class="all-products d-flex justify-content-around  container">

		<c:forEach items="${bestSeller}" var="product">
			<div class="row ">
				<div class="col-sm-12 col-md-4" >
					<a href='<c:url value="/products/${product.id}/1"/>'>
						<div class="container-cards mt-2 bg-white">
							<img style="object-fit:contain" src="${product.photosImagePath[0]}" alt="">
							<div class="content">
								<div class="box">
									<!-- <span class="class1">Product Name</span>  -->
									
									<c:choose>
									<c:when test="${product.countInStock == 0 }">
										<span class="class1"><c:out value="${product.name}" /> </span> <span class="badge badge-danger">Out of stock</span>
									</c:when>
									<c:when test="${product.countInStock <= 3}">
										<span class="class1"><c:out value="${product.name}" /> </span> <span class="badge badge-warning">little in stock</span>
									</c:when>
									
									<c:otherwise>
										<span class="class1"><h4><c:out value="${product.name}" /></h4></span>
									</c:otherwise>
									</c:choose>
									 <span class="class3"><c:out value="${product.price}" /> SAR</span>
		
									
								</div>
							<div class="box">
							<!-- 		<span class="class1">Rat</span> -->
		
		
									<c:forEach begin="1" end="${product.avgRating}" var="index">
								<i  class="fas fa-star text-warning"></i>
							</c:forEach>
							<c:set var="rouund" value="${fn:substringBefore(product.avgRating, '.')}"/>
							<c:if test="${rouund != product.avgRating}"><i class='fa-solid fa-star-half-stroke text-warning'></i></c:if>
							
							<c:forEach begin="1" end="${5-product.avgRating}" var="index">
								<i class="far fa-star text-warning"></i>
							</c:forEach>
		
		
								</div>
								<br>
								<div class="box">
									<span class="class1"></span> <span class="class1"><c:out
											value="${product.brand}" /> Brand</span>
								</div>
		
									<br>
								<c:choose>
									<c:when test="${product.countInStock > 0}">
										<a class="btn button-cart" href="/addCart/${product.id}">Add
											to Cart </a>
									</c:when>
									<c:otherwise>
										<a
											style="pointer-events: none; opacity: 0.4; background-color: rgb(148, 145, 145)"
											class="btn button-cart" href="/addCart/${product.id}">out
											of stock </a>
		
									</c:otherwise>
								</c:choose>
		
		
							</div>
						</div>
					</a>
				</div>

			</div>

		</c:forEach>

	</section>
</c:if>





							<div class="one" id="all">
								<h1>All Products</h1>
							</div>
							  
	
	<section class="all-products  d-flex justify-content-around  container">

		<c:forEach items="${products.content}" var="product">
			<div class="row">
				<div class="col-sm-9 col-md-3">
					<a href='<c:url value="/products/${product.id}/1"/>'>
						<div class="container-cards mt-2 bg-white">
							<img style="object-fit:contain" src="${product.photosImagePath[0]}" alt="">
							<div class="content">
								<div class="box">
									<!-- <span class="class1">Product Name</span>  -->
									
									<c:choose>
									<c:when test="${product.countInStock == 0 }">
										<span class="class1"><c:out value="${product.name}" /> </span> <span class="badge badge-danger">Out of stock</span>
									</c:when>
									<c:when test="${product.countInStock <= 3}">
										<span class="class1"><c:out value="${product.name}" /> </span> <span class="badge badge-warning">little in stock</span>
									</c:when>
									
									<c:otherwise>
										<span class="class1"><h4><c:out value="${product.name}" /></h4></span>
									</c:otherwise>
									</c:choose>
									 <span class="class3"><c:out value="${product.price}" /> SAR</span>
		
									
								</div>
							<div class="box">
							<!-- 		<span class="class1">Rat</span> -->
		
		
									<c:forEach begin="1" end="${product.avgRating}" var="index">
								<i  class="fas fa-star text-warning"></i>
							</c:forEach>
							<c:set var="rouund" value="${fn:substringBefore(product.avgRating, '.')}"/>
							<c:if test="${rouund != product.avgRating}"><i class='fa-solid fa-star-half-stroke text-warning'></i></c:if>
							
							<c:forEach begin="1" end="${5-product.avgRating}" var="index">
								<i class="far fa-star text-warning"></i>
							</c:forEach>
		
		
								</div>
								<br>
								<div class="box">
									<span class="class1"></span> <span class="class1"><c:out
											value="${product.brand}" /> Brand</span>
								</div>
		
									<br>
								<c:choose>
									<c:when test="${product.countInStock > 0}">
										<a class="btn button-cart" href="/addCart/${product.id}">Add
											to Cart </a>
									</c:when>
									<c:otherwise>
										<a
											style="pointer-events: none; opacity: 0.4; background-color: rgb(148, 145, 145)"
											class="btn button-cart" href="/addCart/${product.id}">out
											of stock </a>
		
									</c:otherwise>
								</c:choose>
		
		
							</div>
						</div>
					</a>
				</div>
			</div>

		</c:forEach>

	</section>
							<div class="d-flex justify-content-center">
							<nav aria-label="Page navigation example" >
								<ul class="pagination">
								    <li class="page-item">
								      <a style="color:#683e68" class="page-link" href="/home/1" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								        <span class="sr-only">Previous</span>
								      </a>
								    </li>
									<c:forEach begin="1" end="${totalPages}" var="index">
										<li class="page-item"><a  style="color:#683e68" class="page-link" href="/home/${index}">${index}</a></li>
							    	</c:forEach>
								    
								    <li class="page-item">
								      <a  style="color:#683e68" class="page-link" href="/home/${totalPages}" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								        <span class="sr-only">Next</span>
								      </a>
								    </li>
								  </ul>
							</nav>
							</div>
</div>
<%-- end the back ground color --%>
							
	<section class="statistics">
		<div class="container">
			<div class="row">
				<br />
				<div class="col text-center">
					<h2>iCare Store</h2>
					<p>we have a greate achivment to show</p>
				</div>

			</div>
			<div class="row text-center">
				<div class="col">
					<div class="counter">
<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-person-heart fa-2x" viewBox="0 0 16 16">
  <path d="M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z"/>
						<h2 class="timer count-title count-number" data-to="${customersNo}"
							data-speed="1000"></h2>
						<p class="count-text ">Our Customers</p>
					</div>
				</div>
				<div class="col">
					<div class="counter">
						<i class="fa-brands fa-product-hunt fa-2x"></i>
						<h2 class="timer count-title count-number" data-to="${productsNo}"
							data-speed="1000"></h2>
						<p class="count-text ">Our Products</p>
					</div>
				</div>
				<div class="col">
					<div class="counter">
<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-people-fill fa-2x" viewBox="0 0 16 16">
  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  <path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/>
  <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
</svg>						<h2 class="timer count-title count-number" data-to="20"
							data-speed="1000"></h2>
						<p class="count-text ">Our Partners</p>
					</div>
				</div>
				<div class="col">
					<div class="counter">
<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-shop fa-2x" viewBox="0 0 16 16">
  <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z"/>
</svg>						<h2 class="timer count-title count-number" data-to="3"
							data-speed="1000"></h2>
						<p class="count-text ">Our Branches</p>
					</div>
				</div>
			</div>
		</div>
	</section>


				     			<footer id="contact">
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
											<a href="mailto:icare@hotmail.com" class="email">Bashayer, Norah, Mariam, Shahad and Khadijah. <i style="color:#eee" class="fa fa-envelope"></i> Copyright© 2022  icare@hotmail.com  <i style="color:#eee"  class="fa fa-phone"></i>  +1 650 385 2247</a>
										</div>
									</div>
								</footer>

					

							
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>						
</body>

</html>
