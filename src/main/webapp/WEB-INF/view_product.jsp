<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Show a product</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<body>
	<div class="container w-75 ">
		
		<div class="d-flex align-items-center justify-content-between">
			<h3 style="color:#603F8B" ><c:out value="${product.name}"/></h3> 
			<a style="color:#603F8B" href="/admin">Back to Dashboard</a>
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
				<form action='/products/<c:out value="${product.id}"/>/delete' method="post">
											<input type="hidden" name="_method" value="delete">
											<input type="submit" class="btn btn-dark" value="Delete">
										</form>
			<a href='/products/<c:out value="${product.id}"/>/edit'  class="btn btn-dark">Edit</a>
			</div>
			</c:if>
		
    </div>
	
</body>
</html>