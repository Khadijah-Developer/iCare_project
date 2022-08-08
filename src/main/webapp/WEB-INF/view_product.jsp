<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Show a product</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <style type="text/css">
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

/* Modified from: https://github.com/mukulkant/Star-rating-using-pure-css */
        </style>
        </head>
<body>
	<div class="container w-75 ">
		
		<div class="d-flex align-items-center justify-content-between">
			<h3  ><c:out value="${product.name}"/></h3> 
			<a  href="/admin">Back to Dashboard</a>
		</div>
		<br>
		<br>
		
		<br>
		<p>Product Brand: <c:out value="${product.brand}"/></p>
		<p>Product Category: <c:out value="${product.category}"/></p>
		<p>Product Price: <c:out value="${product.price}"/></p>
		<p>Product Average rating: <c:out value="${product.avgRating}"/></p>
		<hr>
		<p>Description: <c:out value="${product.description}"/></p>
		<hr>
		<!-- <img alt="" src="${pageContext.request.contextPath}/resources/images/${product.id}_photo.png"> -->
		<c:forEach items="${product.photosImagePath}" var="path">
			<img  alt="" src="${path}"/>
		</c:forEach>
		
			<c:if test="${role.equals('admin')}">
		    
			<div class="d-flex justify-content-end">
				<form action="/products/${product.id}/delete" method="post">
											<input type="hidden" name="_method" value="delete">
											<input type="submit" class="btn btn-dark" value="Delete">
										</form>
			<a href='/products/${product.id}/edit'  class="btn btn-dark">Edit</a>
			</div>
			</c:if>
			
			<c:if test="${role.equals('customer')}">
			
			<c:forEach items="${product.reviews}" var="review">
			<p>customer's name <c:out value="${review.getCustReview().getfName()}"/></p>
			 <p>Rating <c:out value="${review.getRating()}"/></p>
			    <p><c:out value="${review.getComment()}"/></p>
			     <p><c:out value="${review.getCreatedAt()}"/></p>
			    
		   </c:forEach>
			  <form:form action="/addReview/${product.getId()}" method="post" modelAttribute="review">
		  
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
  <div class="mb-3">
		    <label for="comment" class="form-label">Add Review</label>
		    <form:textarea path="comment" cssClass="form-control" cssErrorClass="form-control is-invalid" rows = "5" cols = "30" />
		    <form:errors path="comment" cssClass="invalid-feedback"/>
		  </div>
		  
		  <button type="submit" class="btn btn-primary">Add</button>
		</form:form>
			
			</c:if>
		
    </div>
	
</body>
</html>
