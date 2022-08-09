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
<title>Register & Login</title>
<!-- css and js in static folder -->
	
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	
  	<link rel="stylesheet" type="text/css" href="/css/login.css">
  	
</head>
<body>
<div class="overlay">
		<div class="box"> 
		<c:if test="${not empty error}">
			<div><c:out value="${error}"/></div>
		</c:if>
		 	<div class="row login-tab">
      <div class="col login link" id="login-link">
        <h4 id="login-heading"> Login</h4>
      </div>
      <div class="col signup link" id="signup-link">
        <h4 id="signup-heading"> Sign Up </h4>
      </div>
    </div>
    <div id="login-box">
				<form:form method="post" modelAttribute="loginUser"  id="login-form" action="/login">
					<div class="form-group">
					<form:input path="email" type="email" name="email" class="form-control" cssErrorClass="form-control is-invalid"/>
					<form:label path="email">Email</form:label>
					<div class="invalid-feedback small" id="email-error"></div>
					</div>
					<div class="form-group">
					<form:input path="password" id="login-pass" type="password" name="password" class="form-control" cssErrorClass="form-control is-invalid"/>
					<i toggle="#login-pass" class="fa fa-eye toggle-password" id="toggle-login-pass"></i>
					<form:label path="password">Password</form:label>
					<div class="invalid-feedback small" id="password-error"></div>
					</div>
					<button type="submit" class="btn_style btn-block">Login</button>
				</form:form>
			</div>
			<div id="signup-box">
				<form:form method="post" modelAttribute="newUser" id="signup-form" action="/register">
					<div class="form-group">
					<form:input path="fName" class="form-control" cssErrorClass="form-control is-invalid" />
				    <form:label path="fName">First Name</form:label>
					<form:errors path="fName" cssClass="invalid-feedback"/>
					<div class="invalid-feedback small" id="fName-error"></div>
					</div>
					<div class="form-group">
					<form:input path="lName" class="form-control" cssErrorClass="form-control is-invalid"/>
					<form:label path="lName">Last Name</form:label>
					<div class="invalid-feedback small" id="lName-error"></div>
					
					</div>
					<div class="form-group">
					<form:input path="phoneNo" class="form-control" cssErrorClass="form-control is-invalid"/>
					<form:label path="phoneNo">Phone No</form:label>
					<div class="invalid-feedback small" id="phoneNo-error"></div>
	                </div>
	                <div class="form-group">
	                <form:input path="email" class="form-control" cssErrorClass="form-control is-invalid"/>
					<form:label path="email">Email</form:label>
					<div class="invalid-feedback small" id="email-error"></div>
					</div>
					<div class="form-group">
					<form:input path="password" id="login-pass" type="password" name="password" class="form-control" cssErrorClass="form-control is-invalid"/>
					<i toggle="#login-pass" class="fa fa-eye toggle-password" id="toggle-login-pass"></i>
					<form:label path="password">Password</form:label>
					<div class="invalid-feedback small" id="password-error"></div>
					</div>
					<div class="form-group">
					<form:input path="confirmPassword" id="confirm-pass" name="confirm-password" class="form-control" cssErrorClass="form-control is-invalid"/>
					<i toggle="#confirm-pass" class="fa fa-eye toggle-password" id="toggle-confirm-pass"></i>
					<form:label path="confirmPassword">Confirm Password</form:label>
					<div class="invalid-feedback small" id="confirmPassword-error"></div>
					</div>
					<button type="submit" class="btn_style btn-block">Sign up</button>
				</form:form>
			</div>
			
	</div>	
	</div>
	<script type="text/javascript" src="/js/login.js"></script>
</body>
</html>