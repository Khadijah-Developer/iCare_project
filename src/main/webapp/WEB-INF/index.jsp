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
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="container w-75">
		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>
		<h1 class="mb-2 m-3" style="color:#0d6efd">iCare</h1>
		<br>
		<div class="d-flex justify-content-between">
			
			<div class="w-100 m-3">
				<h3>Register</h3>
			
				<form:form class="border border-2 p-4 border-dark" method="post" modelAttribute="newUser" action="/register">
					<div class="mb-3"> 
						<form:label path="fName" class="form-label">First Name:</form:label>
						<form:input  path="fName" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
						<form:errors path="fName" cssClass="invalid-feedback"/>
					</div>
					<div class="mb-3"> 
						<form:label path="lName" class="form-label">Last Name:</form:label>
						<form:input  path="lName" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
						<form:errors path="lName" cssClass="invalid-feedback"/>
					</div>
					<div class="mb-3"> 
						<form:label path="phoneNo" class="form-label">Phone No:</form:label>
						<form:input  path="phoneNo"  cssClass="form-control" cssErrorClass="form-control is-invalid"  />
						<form:errors path="phoneNo" cssClass="invalid-feedback"/>
					</div>
					
					<div class="mb-3">
						<form:label path="email" class="form-label">email:</form:label>
						<form:input path="email" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
						<form:errors path="email" cssClass="invalid-feedback"/>
					</div>					
					<div class="mb-3">
						<form:label path="password" class="form-label">Password: </form:label>
						<form:input  path="password" type="password" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
						<form:errors  path="password" cssClass="invalid-feedback"/>
					</div>
					<div class="mb-3">
						<form:label path="confirmPassword" class="form-label">Confirm Password: </form:label>
						<form:input  path="confirmPassword" type="password" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
						<form:errors  path="confirmPassword" cssClass="invalid-feedback"/>
					</div>
					<input style="background-color:#0dcaf0; border-color: #0dcaf0;" type="submit" value="Register" class="btn btn-dark ">
				</form:form>
			</div>
			<div class="w-100 ml-3 m-3">
				
					<h3>Login</h3>
				
				<form:form class="border border-2 p-4 border-dark" method="post" modelAttribute="loginUser" action="/login">
					<div class="mb-3"> 
						<form:label path="email" class="form-label">email:</form:label>
						<form:input  path="email" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
						<form:errors path="email" cssClass="invalid-feedback"/>
					</div>
					<div class="mb-3">
						<form:label path="password" class="form-label">Password: </form:label>
						<form:input  path="password" type="password" cssClass="form-control" cssErrorClass="form-control is-invalid"  />
						<form:errors  path="password" cssClass="invalid-feedback"/>
					</div>
					<input style="background-color:#0dcaf0; border-color: #0dcaf0;" type="submit" value="Login" class="btn btn-dark">
				</form:form>
			</div>
		
		</div>
		
	</div>
    
	
</body>
</html>