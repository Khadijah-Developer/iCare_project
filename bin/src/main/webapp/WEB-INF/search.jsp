<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" 
crossorigin="anonymous">
<title>search:<c:out value="${searchKey}"/></title>
</head>
<body>

<c:choose>
    <c:when test="${result.size() == 0}">
        <h3>no results for your search! </h3>
        <br />
    </c:when>    
    <c:otherwise>
       
  
<table class="table">
			<thead>
				<tr>
					<th scope="col">Product Name</th>
					<th scope="col">Price</th>
					<th scope="col" >Quantity</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${result}" var="product">
					<tr>	
						<td ><a href="/product/${product.id}" ><c:out value="${product.name}"/></a></td>
						<td ><c:out value="${product.price}"/></td>
						<td ><c:out value="${product.countInStock }"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		  </c:otherwise>
</c:choose>
</body>
</html>