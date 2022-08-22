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


		<%-- include other jsp file to include the navbar --%>
 <jsp:include page="navbar.jsp" /> 
 	
<div class="container w-75 bg-light mt-3 p-4">
		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>
		
		<div class="d-flex align-items-center justify-content-between">
			
			
		</div>
		<p>Your Purchases</p>
		
	<c:choose>
    <c:when test="${cart.size() == 0}">
        <h3>Empty Cart </h3>
        <br />
    </c:when>    
    <c:otherwise>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Product Name</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartMap}" var="product">
					<tr>	
						<td ><u class="font-weight-bold"><a style="color:hsl(296, 13%, 48%);"  href='<c:url value="/products/${product.key.id}/1"/>' ><c:out value="${product.key.name}"/></a></u></td>
						<td ><fmt:formatNumber type="number" maxFractionDigits="2" value="${product.key.price*product.value}"/> SAR</td>
						
						<td>
							<div style=" font-size:20px">
								<a class="mr-3" style="color:hsl(294, 12%, 51%);" href = "/removeCart/${product.key.id}">-</a>
								<c:out value="${product.value}"/>
								<a class="ml-3" style="color:hsl(294, 12%, 51%);" href = "/cart/addCart/${product.key.id}">+</a>
							</div>
						</td>
						<td><a class="btn-white" style="color:hsl(294, 12%, 51%);" href = "/removeCart/${product.key.id}/all">
						<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
							<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
						  	<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
						</svg>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p>total Price : <fmt:formatNumber type="number" maxFractionDigits="2" value="${totalPrice}"/> SAR</p>
		<c:if test="${totalPrice > 0 }">
				<a style="background-color:hsl(295, 15%, 67%); border:none" class="btn btn-outline-dark text-white" style="color:#0d6efd" href = "/cart/checkout">Checkout</a>
		</c:if>
		<br>
				
	</div>
 	</c:otherwise>
</c:choose>
</body>
</html>
