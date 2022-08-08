
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
crossorigin="anonymous">
<meta charset="UTF-8">
<title>New Product </title>
</head>
<body>
		<div class="container w-75">

		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>
		
		<div class="d-flex align-items-center justify-content-between">
			<div class="mt-4">
				<h1 style="color:#0d6efd">Welcome, <c:out value="${user.fName}"/></h1>
				<br>
				
			</div>
			<div class="d-flex flex-column align-items-end">
				<a  class="btn btn-outline-primary" style="color:#0d6efd" href = "/logout">Logout</a>
				<br>
				
			</div>
			
		</div>
		<!-- the start of create form  -->
		
		        <div>
            <div class="d-flex align-items-center justify-content-between">
                    <h1 class="mb-2">Create a New Product</h1>
            </div>
            <form:form class="border border-3 p-4 border-dark" method="post" enctype="multipart/form-data" modelAttribute="product" action="/product/new">
            <div class="mb-3"> 
                <form:label path="name" class="form-label">Product Name:</form:label>
                <form:input  path="name" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
                <form:errors path="name" cssClass="invalid-feedback"/>
            </div>
            <div class="mb-3">
                <form:label path="description" class="form-label">Product Description:</form:label>
                <form:input  path="description" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
                <form:errors path="description" cssClass="invalid-feedback"/>
            </div>
            
            <div class="mb-3"> 
                <form:label path="category" class="form-label">Category:</form:label>
                <form:input  path="category" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
                <form:errors path="category" cssClass="invalid-feedback"/>
            </div>
            
           <div class="mb-3"> 
                <form:label path="brand" class="form-label">Brand:</form:label>
                <form:input  path="brand" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
                <form:errors path="brand" cssClass="invalid-feedback"/>
            </div>
            
           <div class="mb-3"> 
                <form:label path="price" class="form-label">Product price:</form:label>
                <form:input  path="price" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
                <form:errors path="price" cssClass="invalid-feedback"/>
            </div>
			
			<div class="mb-3"> 
                <form:label path="countInStock" class="form-label">Product count In Stock:</form:label>
                <form:input  path="countInStock" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
                <form:errors path="countInStock" cssClass="invalid-feedback"/>
            </div>
            
            <div class="mb-3"> 
                <form:label path="ProductImg" class="form-label">Product Image:</form:label>
                <form:input  path="ProductImg" type="file" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
                <form:errors path="ProductImg" cssClass="invalid-feedback"/>
            </div>
            
            <input type="submit" value="Submit" class="btn btn-outline-primary">
        </form:form>
        </div>
		<!--  the end  of the form -->
		
		
		
				<br>
					<div class="d-flex flex-column align-items-start">
				<a class="btn btn-outline-primary" style="color:#0d6efd" href = "/admin">Cancel</a>
				<br>
				
			</div>
		</div>
</body>
</html>