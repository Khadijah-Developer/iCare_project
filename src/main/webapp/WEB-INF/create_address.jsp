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


<title>Checkout</title>
</head>
<body>
		<%-- include other jsp file to include the navbar --%>
 <jsp:include page="navbar.jsp" /> 

		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4"><c:out value="${error}"/></div>
		</c:if>
		<!-- the start of create form  -->
	
			<!--  the end  of the form -->
	
	
	<div class="container py-5">
  <div class="row d-flex justify-content-center align-items-center">
    <div class="col">
      <div class="card my-4 shadow-3">
        <div class="row g-0">
         
          <div class="col-xl-6">
            <div class="card-body p-md-5 text-black">
              <h3 class="mb-4 text-uppercase">Delivery Info</h3>
             <form:form  method="post" enctype="multipart/form-data" modelAttribute="address" action="/user/address">
              
              <div class="row">
                <div class="col-md-6 mb-4">
                  <div class="form-outline">
                    <form:input  path="city"  type="text" id="form3Example1m" class="form-control form-control-lg" />
                    <form:label  path="city"  class="form-label" for="form3Example1m">City</form:label>
                    <form:errors   path="city"   cssClass="invalid-feedback"/>
                  </div>
                </div>
                <div class="col-md-6 mb-4">
                  <div class="form-outline">
                    <form:input path="country" type="text" id="form3Example1n" class="form-control form-control-lg" />
                    <form:label  path="country" class="form-label" for="form3Example1n">Country</form:label>
                    <form:errors   path="country"   cssClass="invalid-feedback"/>
                  </div>
                </div>
              </div>

              <div class="form-outline mb-4">
                <form:input path="street" type="text" id="form3Example8" class="form-control form-control-lg" />
                <form:label path="street" class="form-label" for="form3Example8">Street</form:label>
                 <form:errors  path="street"  cssClass="invalid-feedback"/>
              </div>



              <div class="row">
                <div class="col-md-6 mb-4">

                 <form:input path="state" type="text" id="form3Example8" class="form-control form-control-lg" />
                <form:label path="state" class="form-label" for="form3Example8">state</form:label>
                 <form:errors  path="state"  cssClass="invalid-feedback"/>

                </div>
                <div class="col-md-6 mb-4">

                     <form:input path="postalCode"  type="text" id="form3Example8" class="form-control form-control-lg" />
                <form:label path="postalCode"  class="form-label" for="form3Example8">postal code</form:label>
                 <form:errors  path="postalCode"  cssClass="invalid-feedback"/>


                </div>
              </div>

              <div class="form-outline mb-4">
                   <form:input path="district"  type="text" id="form3Example8" class="form-control form-control-lg" />
                <form:label path="district"  class="form-label" for="form3Example8">district</form:label>
                 <form:errors  path="district"  cssClass="invalid-feedback"/>
              </div>

              

              <div class="d-flex justify-content-end pt-3">
                <button type="submit" class="btn text-light ms-2"
                  style="background-color:hsl(295, 15%, 67%) ">Add Address</button>
              </div>
           </form:form>	

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
	
</body>
</html>
