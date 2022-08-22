<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <!-- CSS only -->
   <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
        crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/counter.js"></script>
     <style type="text/css">
        body {
        /* background-color:hsl(295, 15%, 70%); */
          background-image: url(../image/pg.jpg);
          background-position:center;
            background-size: cover;
            /* text-align: center; */
            background-attachment: fixed;
            height: 80vh; 
        }
                *{
    margin: 0;
    padding: 0;
	}
.btn-search{
  background-color: #b38aa8;
    border: none;
  border-radius:50%;
  box-shadow: 1px 5px 20px -5px rgba(0,0,0,0.4);
    color: #fff;
}  
}
#ex4 {
	background: #b38aa8 !important;
}
#ex4 .p1[data-count]:after {
    position: absolute;
    right: 10%;
    top: 8%;
    content: attr(data-count);
    font-size: 40%;
    padding: 0.2em;
    border-radius: 50%;
    line-height: 1em;
    color: white;
    background: #b38aa8;
    }
    .fa-navicon:before, .fa-reorder:before, .fa-bars:before {
    content: "\f0c9";
    font-size: 36px;
    color: #a188a4;;
    }
    .navbar-nav .nav-link {
    padding-left: 14px;
}
.navbar-toggler:focus{
    box-shadow: none !important;
}
        </style>
    <title>Home</title>
    

</head>

<body>

    <section class="navbr">
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#""><img alt="" src="/image/logo.png" style="width:75px; height:75px;"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon fa fa-bars"> </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/home/1">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/home/1#best">Top Products</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            Categories
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/filter/Skin">Skin Care</a></li>
                            <li><a class="dropdown-item" href="/filter/Hair">Hair Care</a></li>
                            <li><a class="dropdown-item" href="/filter/Body">Body Care</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/home/1#contact">Contact</a>
                    </li>

                </ul>
                <%-- <c:if test="${!role.equals('admin')}"> --%>
           			<form class="d-flex" role="search" action="/search" method="post">
						<input class="form-control me-2" type="search" placeholder="Search"
								aria-label="Search" name="searchKey">
						<button class="btn btn-search" type="submit"><i class="fa fa-search"></i></button>
					</form>
                <%-- </c:if> --%>
                

                <ul class="navbar-nav  mb-2 mb-lg-0  test">
                    <c:if test="${!role.equals('admin')}">
                    <li class="nav-item d-flex">
                        <div id="ex4">
                            <a href="/cart">
                                <span style="color:#683e68 !important" class="p1 fa-stack fa-2x has-badge" data-count="${productCount}">
                                    <!--<i class="p2 fa fa-circle fa-stack-2x"></i>-->

                                    <i  class="p3 fa fa-shopping-cart fa-stack-1x xfa-inverse"
                                        data-count="4b"></i>
                                </span>
                            </a>
                        </div>
                    </li>
                    </c:if>
                    <li class="nav-item dropdown d-flex">
                        <a class="nav-link dropdown-toggle" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-user" style="font-size:36px"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <c:if test="${!role.equals('admin') && user_id != null}">
                                    <a class="dropdown-item" href="/profile">Profile
                                        <c:out value="${user.fName}" />
                                    </a>
                                </c:if>
                                  <c:if test="${role.equals('admin')}">
                                    <a class="dropdown-item" href="/admin">Profile
                                        <c:out value="${user.fName}" />
                                    </a>
                                </c:if>
                            </li>

                            <!-- <li><a class="dropdown-item" href="#">Profile</a></li> -->
                           <c:if test="${user_id != null && !role.equals('admin')}">
                            <li><a class="dropdown-item" href="/profile#order">Orders</a></li>
                            </c:if>
                            <li class=" dropdown-item">
                                <c:choose>
                                    <c:when test="${sessionScope.user_id != null}">
                                        <div class="mr-2 logout ">
                                            <a href="/logout" class="icon-logout">Logout </a>
                                            <a href="/logout"></a> <i class="fa fa-sign-out"
                                                style="font-size:25px"></i></a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="mr-2 logout ">
                                            <a href="/sign" class="icon-logout">LogIn </a>
                                            <a href="/sign"></a><i class="fa fa-sign-out"
                                                style="font-size:25px"></i></a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                    </li>

                </ul>

            </div>
        </div>
    </nav>
</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
								integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
								crossorigin="anonymous"></script>
</body>
</html>