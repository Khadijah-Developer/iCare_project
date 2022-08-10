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
<title>Edit Order</title>
</head>
<body>
        	<div class="container w-75">

		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>
		<!-- the start of create form  -->
		<div>
            <div class="d-flex align-items-center justify-content-between">
                    <h1 class="mb-2">Add new Address</h1>
            </div>
            <form:form class="border border-3 p-4 border-dark" method="post" enctype="multipart/form-data" modelAttribute="order" action="order/edit/{id}">
	            <div class="mb-3"> 
	                <form:label path="city" class="form-label">City:</form:label>
	                <form:input  path="city" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
	                <form:errors path="city" cssClass="invalid-feedback"/>
	            </div>
	            <div class="mb-3">
	                <form:label path="country" class="form-label">Country:</form:label>
	                <form:input  path="country" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
	                <form:errors path="country" cssClass="invalid-feedback"/>
	            </div>
	             <div class="mb-3">
	                <form:label path="state" class="form-label">State:</form:label>
	                <form:input  path="state" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
	                <form:errors path="state" cssClass="invalid-feedback"/>
	            </div>
	            
	            <div class="mb-3">
	                <form:label path="district" class="form-label">District:</form:label>
	                <form:input  path="district" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
	                <form:errors path="district" cssClass="invalid-feedback"/>
	            </div>
	                        
	           <div class="mb-3"> 
	                <form:label path="street" class="form-label"> Street:</form:label>
	                <form:input  path="street" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
	                <form:errors path="street" cssClass="invalid-feedback"/>
	            </div>
				
				<div class="mb-3"> 
	                <form:label path="postalCode" class="form-label">Postal Code</form:label>
	                <form:input  path="postalCode" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
	                <form:errors path="postalCode" cssClass="invalid-feedback"/>
	            </div>
	            
	            <input type="submit" id="submit" value="Save Address" class="btn btn-outline-primary">
	       	</form:form>	  	
		</div>
			<!--  the end  of the form -->
	</div>
	
</body>
</html>