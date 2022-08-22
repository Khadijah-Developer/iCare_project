<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
							<link rel="stylesheet" type="text/css" href="/product.css">
							<link rel="stylesheet" type="text/css" href="/style.css">
							<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" 
        integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
							
<title>Home</title>
</head>
<body>


		<%-- include other jsp file to include the navbar --%>
 <jsp:include page="navbar.jsp" /> 
 	
<div class="container mt-3 p-4">
		
		
	<div id="content-wrapper" class="bg-white rounded p-4">
		<div class="column">
			<div class="container d-flex justify-content-center " >
			<img id="featured" class="featured" src="${product.photosImagePath[0]}">
			</div>

			<div id="slide-wrapper">
				<img id="slideLeft" class="arrow" src="/image/arrow-left.png">

				<div id="slider">
					<c:forEach items="${product.photosImagePath}" var="path">

				
					<img class="thumbnail" src="${path}">

					</c:forEach>
			
				</div>

				<img id="slideRight" class="arrow" src="/image/arrow-right.png">
			</div>
		</div>

		<div class="column">
			<h3  ><c:out value="${product.name}"/></h3> 
			<br>
			<p><b>Brand:</b> <c:out value="${product.brand}"/></p>
			<p><b>Category:</b> <c:out value="${product.category}"/></p>
			<h4><c:out value="${product.price}"/> SAR</h4>
			<h6>Average Rating: <fmt:formatNumber type="number" maxFractionDigits="1" value="${product.avgRating}"/>/5</h6>
			<c:forEach begin="1" end="${product.avgRating}" var="index">
						<i  class="fas fa-star text-warning"></i>
					</c:forEach>
					<c:set var="rouund" value="${fn:substringBefore(product.avgRating, '.')}"/>
					<c:if test="${rouund != product.avgRating}"><i class='fa-solid fa-star-half-stroke text-warning'></i></c:if>
					
					<c:forEach begin="1" end="${5-product.avgRating}" var="index">
						<i class="far fa-star text-warning"></i>
					</c:forEach>
			<hr>
			<p> <c:out value="${product.description}"/></p>
			<hr>
			
			<c:if test="${!role.equals('admin') && product.countInStock !=0 }" >
				<a class="btn btn-dark" href="/addCart/${product.id}">Add to Cart</a>
			</c:if>

		</div>
	</div>
		<br>
	<div class="container bg-white p-3">	
		<c:if test="${role.equals('admin')}">
			<div class="d-flex justify-content-end">
				<form action="/products/${product.id}/delete" method="post">
					<input type="hidden" name="_method" value="delete">
					<input type="submit" class="btn btn-dark mr-2" value="Delete">
				</form>
				<a href='/products/${product.id}/edit'  class="btn btn-dark">Edit</a>
			</div>
		</c:if>
		
		<h4>Customer Reviews</h4>
		<hr>
		<div class="d-flex justify-content-center">
		<nav aria-label="Page navigation example" >
			<ul class="pagination">
			    <li class="page-item">
			      <a style="color:#683e68" class="page-link" href="/products/${product.id}/1" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
				<c:forEach begin="1" end="${totalPages}" var="index">
					<li class="page-item"><a  style="color:#683e68" class="page-link" href="/products/${product.id}/${index}">${index}</a></li>
		    	</c:forEach>
			    
			    <li class="page-item">
			      <a  style="color:#683e68" class="page-link" href="/products/${product.id}/${totalPages}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        <span class="sr-only">Next</span>
			      </a>
			    </li>
			  </ul>
		</nav>
    	</div>
    	
		<div class="container p-3">
			<c:forEach items="${reviews.content}" var="review">
			<div class="review-bottom">
				<p><b><c:out value="${review.custReview.fName}"/></b></p>
				<div  class="ml-2">
					<p class="m-0">Rating: 
					<c:forEach begin="1" end="${review.getRating()}" var="index">
						<i  class="fas fa-star text-warning"></i>
					</c:forEach>
					<c:forEach begin="1" end="${5-review.getRating()}" var="index">
						<i class="far fa-star text-warning"></i>
					</c:forEach>
					<p>Reviewed on<c:out value="${review.getCreatedAt()}"/></p>
				    <p><c:out value="${review.getComment()}"/></p>
			    </div>
			    <div class="d-flex" >
			  
			    <c:if test="${not empty review.photos[0]}">
				    <c:forEach items="${review.photosImagePath}" var="imgPath">
				    	
				    	<div style="width: 150px;" class="thumpnail2 embed-responsive embed-responsive-16by9" >
						    <a target="_blank" href="${imgPath}">
								<img class=" embed-responsive-item" src="${imgPath}" alt="" >
							</a>
						</div>
						
				    </c:forEach> 
				</c:if>
			    </div>
			    
			    </div>
			     </c:forEach>
		</div>
		<div class="d-flex justify-content-center">
		<nav aria-label="Page navigation example" >
			<ul class="pagination">
			    <li class="page-item">
			      <a style="color:#683e68" class="page-link" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
				<c:forEach begin="1" end="${totalPages}" var="index">
					<li class="page-item"><a  style="color:#683e68" class="page-link" href="/products/${product.id}/${index}">${index}</a></li>
		    	</c:forEach>
			    <li class="page-item">
			      <a  style="color:#683e68" class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        <span class="sr-only">Next</span>
			      </a>
			    </li>
			  </ul>
		</nav>
    	</div>
			    
		  <c:if test="${role.equals('customer')}">
		  <h3 class="ml-2" id="rating">Add Review</h3>
			<form:form action="/${product.getId()}/addReview" method="post" enctype="multipart/form-data"  modelAttribute="review">
				<div class="rate">
				    <input type="radio" id="star5" name="rate" value="5" />
				    <label for="star5" title="text">5 stars</label>
				    <input type="radio" id="star4" name="rate" value="4" />
				    <label for="star4" title="text">4 stars</label>
				    <input type="radio" id="star3" name="rate" value="3" />
				    <label for="star3" title="text">3 stars</label>
				    <input type="radio" id="star2" name="rate" value="2" />
				    <label for="star2" title="text">2 stars</label>
				    <input type="radio" id="star1" name="rate" value="1" />
				    <label for="star1" title="text">1 star</label>
				</div>
				<br>
				<div class="mb-3">
			    	<label for="comment" class="form-label"></label>
			    	<form:textarea path="comment" cssClass="form-control" cssErrorClass="form-control is-invalid" rows = "5" cols = "30" />
			    	<form:errors path="comment" cssClass="invalid-feedback"/>
			    	<div class="image-upload ">
			    		
					    <label  style="color:#683e68" for="file-input" class="btn ">
					        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-camera-fill" viewBox="0 0 16 16">
								 <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
								 <path d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
							</svg>
					    </label>
					     
					     
   						<input  id="file-input" name="imgs" type="file"  accept="image/png, image/jpeg" multiple/>
   						 
						    
   					
					</div>
			    </div>
			  
			  	<input  style="background-color:#683e68" type="submit" class="btn text-white" value="Add"/>
			</form:form>
			
		</c:if>
    </div>
</div>
<script type="text/javascript">
			let thumbnails = document.getElementsByClassName('thumbnail')
			let activeImages = document.getElementsByClassName('active')
			for (var i=0; i < thumbnails.length; i++){
				thumbnails[i].addEventListener('mouseover', function(){

					if (activeImages.length > 0){
						activeImages[0].classList.remove('active')
					}
				
					this.classList.add('active')
					document.getElementById('featured').src = this.src
				})


			}

			const buttonRight = document.getElementById('slideRight');
			const buttonLeft = document.getElementById('slideLeft');


			buttonRight.addEventListener('click', function(){
				document.getElementById('slider').scrollLeft += 180;
		    })



		    buttonLeft.addEventListener('click', function(){
		      document.getElementById('slider').scrollLeft -= 180;
		    })

	</script>
</body>
</html>
