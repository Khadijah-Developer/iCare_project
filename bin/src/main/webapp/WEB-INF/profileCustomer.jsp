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
<title>Profile</title>
</head>
<body>
 	
<div class="container w-75">
		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>

        <div m-2>
            <h5>Welcome, <c:out value="${customer.fName}"/></h5>
            <a href="/home"> Home</a>
            <table class="table">
			<thead>
				<tr>
					<th scope="col">Full Name</th>
					<th scope="col">Phone No.</th>
                    <th scope="col">Email</th>
				</tr>
			</thead>
			<tbody>
					<tr>	
						<td ><c:out value="${customer.fName}"/> <c:out value="${customer.lName}"/></td>
						<td ><c:out value="${customer.phoneNo}"/></td>
						<td ><c:out value="${customer.email}"/></td>
					</tr>
			</tbody>
		</table>

        </div>
        <div>
                <table class="table">
			<thead>
				<tr>
					<th scope="col">Address</th>
				</tr>
			</thead>
			<tbody>
                        <c:forEach items="${customer.addresses}" var="address" varStatus="loop">
                            <tr>
                            <td >
                            <div>
                                    <c:out value="${address.country}"/>, <c:out value="${address.state}"/>,
                                    <c:out value="${address.city}"/>,
                                    <c:out value="${address.district}"/>,<c:out value="${address.street}"/>,
                                    <c:out value="${address.postalCode}"/>
                            </div>
                            </td>	
                            </tr>				
						</c:forEach>
			</tbody>
		</table>

        </div>
		
        			<p>List Orders</p>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Total</th>
					<th scope="col" >Order Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orders}" var="order">
					<tr>	
						<td ><a style="color:#0d6efd"  href='<c:url value="/summary/${order.id}"/>' ><c:out value="${order.id}"/></a></td>
						<td ><c:out value="${order.totalPrice}"/></td>
                        
						<td >
                      <div class="d-flex justify-content-among m-2">
                       <p> <c:out value="${order.orderStatus }"/></p>
                      
                        <%-- If the order status not equals to shipped or deliverd will allowed them to delete order --%>
                        <c:if test="${!order.orderStatus.equals('shipped') && !order.orderStatus.equals('deliverd')}">
                                    <div>
                            		<form:form  action="/order/delete/${order.id}" method="delete" modelAttribute="order">
						           <input style="margin-left:4px;" type="submit" id="submit" value="Cancel Order" class="btn btn-outline-dark">
					                </form:form>
                                    </div>
                         </c:if>
                        </div>
                        </td>
                       
					</tr>
				</c:forEach>
			</tbody>
		</table>
</div>
</body>
</html>