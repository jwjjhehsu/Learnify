<%@page import="com.tech.learnify.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import ="java.sql.*"  %>
    
    
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>

<h1>
hello </h1>


Connection con = ConnectionProvider.getConnecti


<!-- navbar -->
<%@include file = "normal_navbar.jsp" %>


<!-- Banner -->
<div class="container-fluid p-0 m-0">
    <div class="jumbotron jumbotron-fluid text-center primary-background text-white p-5" style="background-color: #d0e7ff; color: #333;">
        <div class="container">
            <h3 class="display-3">Welcome to Learnify</h3>
            <p >Programming languages usually contain abstractions for defining and manipulating data structures or controlling the flow of execution. The practical necessity that a programming language supports adequate abstractions is expressed by the abstraction principle.</p>
            <p >Thousands of programming languages—often classified as imperative, functional, logic, or object-oriented—have been developed for a wide variety of uses. Many aspects of programming language design involve tradeoffs—for example, exception handling simplifies error handling, but at a performance cost. </p>
<button class="btn btn-lg btn-primary"><span class = "	fas fa-external-link-alt"></span>Start! It's free</button>
<button class="btn btn-lg btn-secondary">Login</button>



        </div>
    </div>
</div>







</div>








<!-- Javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src = "js/myjs.js" type = "text/javascript"></script>
<script>
</script>
</body>

</html>