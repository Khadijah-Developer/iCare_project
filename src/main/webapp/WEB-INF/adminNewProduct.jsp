
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
<body class=" bg-light">
 	<%-- include other jsp file to include the admin navbar --%>
 <jsp:include page="adminNavbar.jsp" /> 
		<div class="container w-75 ">

		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>
		
		<!-- the start of create form  -->
		
		        <div>
            <div class="d-flex align-items-center justify-content-between">
                    <h1 class="mb-2">Create a New Product</h1>
            </div>
            <form:form class="border border-3 p-4 bg-white border-dark" method="post" enctype="multipart/form-data" modelAttribute="product" action="/product">
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
                <form:select cssClass="form-control" cssErrorClass="form-control is-invalid"  path="category" >
                	<form:option value="Hair care">Hair care</form:option>
                	<form:option value="Skin care">Skin care</form:option>
                	<form:option value="Body care">Body care</form:option>
                </form:select>
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
            
            <div id="parentElement" class="mb-3">
			    
                <form:label path="ProductImg" class="form-label">Product Images:</form:label>
                <form:input  path="ProductImg" type="file" cssClass="form-control mb-2" cssErrorClass="form-control is-invalid"  accept="image/png, image/jpeg"/>
                <form:errors path="ProductImg" cssClass="invalid-feedback"/>
            </div>
            <!--  added extra img upload fields when user click button add -->
            <button type="button" id="rowAdder"  class="btn btn-dark" ><span class="fa fa-plus"></span></button>
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<script type="text/javascript">
		        $("#rowAdder").click(function () {
		            newRowAdd =  	
		            '<form:input  path="ProductImg" type="file" cssClass="form-control mb-2" cssErrorClass="form-control is-invalid"  accept="image/png, image/jpeg"/>' +
		            '<form:errors path="ProductImg" cssClass="invalid-feedback"/>' ;
		            $('#parentElement').append(newRowAdd);
		        });
		    </script>
                
                
            <input type="submit" value="Submit" class="btn btn-dark">
            <a class="btn btn-dark"  href ="/admin">Cancel</a>
        </form:form>
        </div>
		<!--  the end  of the form -->
		
		
		
				<br>
				<br>
				
			</div>
		</div>
	
	
</body>

</html>