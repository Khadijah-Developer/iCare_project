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
<link rel="stylesheet" type="text/css" href="style.css">
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Register & Login</title>
</head>
<body>
		<c:if test="${not empty error}">
			<div class="small"><c:out value="${error}"/></div>
		</c:if>
		<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
				<form:form method="post" modelAttribute="newUser" action="/register">
					<label for="chk" aria-hidden="true">Sign up</label>
					<form:input path="fName" placeholder="First name" />
					<form:errors path="fName" class="small"/>
					
					<form:input path="lName" placeholder="Last name" />
					<form:errors path="lName" class="small"/>
					
					<form:input path="phoneNo" placeholder="Phone No" />
					<form:errors path="phoneNo" class="small"/>
	
	                <form:input path="email" placeholder="Email" />
					<form:errors path="email" class="small"/>
					
					<form:input path="password" placeholder="Password" />
					<form:errors path="password" class="small"/>
					
					<form:input path="confirmPassword" placeholder="Confirm Password" />
					<form:errors path="confirmPassword" class="small"/>
					<button type="submit" value="Register">Sign up</button>
				</form:form>
			</div>
			
            <div class="login">
				<form:form method="post" modelAttribute="loginUser" action="/login">
					<label for="chk" aria-hidden="true">Login</label>
					<form:input path="email" placeholder="Email" />
					<form:errors path="email" class="small"/>
					
					<form:input path="password" placeholder="Password" />
					<form:errors path="password" class="small"/>
					<button type="submit" value="Login">Login</button>
				</form:form>
			</div>
	</div>
		
	
</body>
</html>