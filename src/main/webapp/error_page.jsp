<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page isErrorPage = "true" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry Something Went Wrong </title>


<!-- CSS -->
        <style>
    .banner-background
    {
clip-path: polygon(0% 0%, 100% 0%, 100% 84%, 85% 84%, 100% 100%, 53% 100%, 0 100%);
    }
    
   </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<div class = "container text-center">

<img src = "image/warning.png" class = "img-fluid" >
<h3 class = "display-3"> Sorry ! Something Went Wrong ...</h3>


<a href = "index.jsp" class = "btn primary-background btn-lg text-white mt-3">Home</a>


</div>



</body>
</html>