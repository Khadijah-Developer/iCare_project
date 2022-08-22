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
 	<%-- include other jsp file to include the navbar --%>
 <jsp:include page="navbar.jsp" /> 
<div class="container w-75 p-5 mt-4"  style="background-color: #f8f9fa;">
		<c:if test="${not empty success}">
			<div class="alert alert-success mt-4"><c:out value="${success}"/></div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>

        <div m-2>
            <h5> <span style="color:#8c708e">Welcome,</span> <c:out value="${customer.fName}"/></h5>
            <table class="table mt-4">
			<thead>
				<tr style="color:#8c708e">
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
		<br>
        <div>
                <table class="table">
			<thead>
				<tr style="color:#8c708e">
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
									<a style="background-color:hsl(295, 15%, 67%); border:none" class="btn btn-outline-dark text-white ml-4"  href="/user/address/${address.id}/edit">Edit</a>
                            </div>
                            </td>	
                            </tr>				
						</c:forEach>
			</tbody>
		</table>
	<br> <br>
        </div>
		
        			<h5 style="color:#8c708e" id="order">My Orders</h5>
		<table class="table">
			<thead>
				<tr style="color:#8c708e">
					<th scope="col">Order Id</th>
					<th scope="col">Total</th>
					<th scope="col" >Order Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orders}" var="order">
					<tr>	
						<td class="border-bottom" ><a    href='<c:url value="/summary/${order.id}"/>' ><c:out value="${order.id}"/></a></td>
						<td ><fmt:formatNumber type="number" maxFractionDigits="2" value="${order.totalPrice}"/> SAR </td>
                        
						<td >
                      <div class="d-flex justify-content-among m-2">
                       <p> <c:out value="${order.orderStatus }"/></p>
                      
                        <%-- If the order status not equals to shipped or deliverd will allowed them to delete order --%>
                        <c:if test="${!order.orderStatus.equals('shipped') && !order.orderStatus.equals('deliverd')}">
                                    <div>
                            		<form:form  action="/order/delete/${order.id}" method="delete" modelAttribute="order">
						           <input type="submit" id="submit" value="Cancel Order" style="background-color:hsl(295, 15%, 67%); border:none" class="btn btn-outline-dark text-white ml-4"  >
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