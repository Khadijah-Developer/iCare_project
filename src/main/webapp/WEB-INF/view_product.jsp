<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Show a product</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet/less" type="text/css" href="styles.less" />
        <style type="text/css">
        body {
        background-color:#f7f2f7;
        }
        *{
    margin: 0;
    padding: 0;
	}
	.rate {
	    float: left;
	    height: 46px;
	    padding: 0 10px;
	}
	.rate:not(:checked) > input {
	    position:absolute;
	    top:-9999px;
	}
	.rate:not(:checked) > label {
	    float:right;
	    width:1em;
	    overflow:hidden;
	    white-space:nowrap;
	    cursor:pointer;
	    font-size:30px;
	    color:#ccc;
	}
	.rate:not(:checked) > label:before {
	    content: '★ ';
	}
	.rate > input:checked ~ label {
	    color: #ffc700;    
	}
	.rate:not(:checked) > label:hover,
	.rate:not(:checked) > label:hover ~ label {
	    color: #deb217;  
	}
	.rate > input:checked + label:hover,
	.rate > input:checked + label:hover ~ label,
	.rate > input:checked ~ label:hover,
	.rate > input:checked ~ label:hover ~ label,
	.rate > label:hover ~ input:checked ~ label {
	    color: #c59b08;
	 } 
	 
	.image-upload > input
	{
	  	display: none;
	}
	
	.image-upload img
	{
	    width: 80px;
	    cursor: pointer;
	}
	
	.thumpnail2 {
	  border: 1px solid #ddd;
	  border-radius: 4px;
	  padding: 9px;
	  width: 150px;
	}
	
	.thumpnail2:hover {
	  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
	
}
	
	.embed-responsive img{
    object-fit: contain;
}

#content-wrapper{
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
			align-items: center;
		}

		.column{
			width: 500px;
			padding: 10px;
		}

		#featured{
			max-width: 400px;
			max-height: 400px;
			object-fit: contain;
			cursor: pointer;
			

		}
		
		.container > .featured {
			width: 600px;
			height: 600px;
			
			
		}

		.thumbnail{
			object-fit: cover;
			max-width: 180px;
			max-height: 100px;
			cursor: pointer;
			opacity: 0.5;
			margin: 5px;
			border: 1px solid black;

		}

		.thumbnail:hover{
			opacity:1;
		}

		.active{
			opacity: 1;
		}

		#slide-wrapper{
			max-width: 500px;
			display: flex;
			min-height: 100px;
			align-items: center;
			justify-content: center;
		}

		#slider{

			display: flex;
			flex-wrap: nowrap;
			overflow-x: hidden;

		}

		#slider{
			
			display: flex;
			flex-wrap: nowrap;
			overflow-x: auto;


		}

		#slider::-webkit-scrollbar {
		    width: 8px;

		}

		#slider::-webkit-scrollbar-track {
		    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);

		}
		 
		#slider::-webkit-scrollbar-thumb {
		  background-color: #dede2e;
		  outline: 1px solid slategrey;
		   border-radius: 100px;

		}

		#slider::-webkit-scrollbar-thumb:hover{
		    background-color: #18b5ce;
		}

		

		.arrow{
			width: 30px;
			height: 30px;
			cursor: pointer;
			transition: .3s;
		}

		.arrow:hover{
			opacity: .5;
			width: 35px;
			height: 35px;
		}


.stars-container {
  position: relative;
  display: inline-block;
  color: transparent;
}

.stars-container:before {
  position: absolute;
  top: 0;
  left: 0;
  content: '★★★★★';
  color: lightgray;
}

.stars-container:after {
  position: absolute;
  top: 0;
  left: 0;
  content: '★★★★★';
  color: gold;
  overflow: hidden;
}

.stars-0:after { width: 0%; }
.stars-10:after { width: 10%; }
.stars-20:after { width: 20%; }
.stars-30:after { width: 30%; }
.stars-40:after { width: 40%; }
.stars-50:after { width: 50%; }
.stars-60:after { width: 60%; }
.stars-70:after { width: 70%; }
.stars-80:after { width: 80%; }
.stars-90:after { width: 90%; }
.stars-100:after { width: 100; }




/* Modified from: https://github.com/mukulkant/Star-rating-using-pure-css */
        </style>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css" rel="stylesheet">
       
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        </head>
<body>
	<div class="container ">
		
		<div class="d-flex align-items-center justify-content-between">
			<div></div>
			<c:choose>
				<c:when test="${role.equals('admin')}"><a  href="/admin">Back to Dashboard</a></c:when>
				<c:otherwise><a  href="/home">Back to Home</a></c:otherwise>
			</c:choose>
			
		

	</div>
		
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
			<hr>
			<p> <c:out value="${product.description}"/></p>
			<hr>
			<input value=1 type="number">
			<a class="btn btn-dark" href="#">Add to Cart</a>

		</div>
	</div>
		<br>
	<div class="container bg-white p-3">	
		<c:if test="${role.equals('admin')}">
			<div class="d-flex justify-content-end">
				<form action="/products/${product.id}/delete" method="post">
					<input type="hidden" name="_method" value="delete">
					<input type="submit" class="btn btn-dark" value="Delete">
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
    	
		<div class="container p-3">
			<c:forEach items="${reviews.content}" var="review">
				<p><b><c:out value="${review.custReview.fName}"/></b></p>
				<div  class="ml-2">
					<p class="m-0">Rating: <c:out value="${review.getRating()}"/></p>
					<p>Reviewed on<c:out value="${review.getCreatedAt()}"/></p>
				    <p><c:out value="${review.getComment()}"/></p>
			    </div>
			    <div class="d-flex" >
			  
			    <c:if test="${not empty review.photos[0]}">
				    <c:forEach items="${review.photosImagePath}" var="imgPath">
				    	
				    	<div class="thumpnail2 embed-responsive embed-responsive-16by9" >
						    <a target="_blank" href="${imgPath}">
								<img class=" embed-responsive-item" src="${imgPath}" alt="" >
							</a>
						</div>
						
				    </c:forEach> 
				</c:if>
			    </div>
			    <hr>
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
		  <h3 class="ml-2">Add Review</h3>
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
