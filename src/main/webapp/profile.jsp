<%@page import="com.tech.learnify.entities.User"%>
<%@page errorPage="error_page_jsp"%>

<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
	return; // Ensure that no further code is executed after redirect
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Profile Page</title>

<!-- CSS -->
<style>
.banner-background {
	clip-path: polygon(0% 0%, 100% 0%, 100% 84%, 85% 84%, 100% 100%, 53% 100%, 0 100%);
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<!-- Nav bar starts -->
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><b><span
					class="fa fa-graduation-cap"></span> Learnify</b></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"><span class="fa fa-lightbulb-o"></span>
							Learn To Achieve Anything</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <span
							class="fa fa-newspaper-o"></span> Categories
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Programming
									Language</a></li>
							<li><a class="dropdown-item" href="#">Projects
									Implementation</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Data Structure</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#"><span
							class="fa fa-address-book"></span> Contact Us</a></li>
				</ul>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="#!"
						data-bs-toggle="modal" data-bs-target="#profile-modal"> <span
							class="fa fa-user-circle"></span> <%=user.getName()%>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutServlet">
							<span class="fa fa-sign-out"></span> Log out
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar ends -->
	<br>

	<!-- Profile modal -->
	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background text-white  text-center">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Learnify</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="container text-center">
					<%
					String profileImage = user.getGender().equalsIgnoreCase("female") ? "pics/female.png" : "pics/" + user.getProfile();
					%>
					<img src="<%=profileImage%>" class="img-fluid"
						style="border-radius: 50%; max-width: 150px;"
						alt="User Profile Image" />
					<h4 class="modal-title fs-5 mt-3" id="exampleModalLabel"><%=user.getName()%></h4>
				</div>
				<!-- Details -->
				<div id="profile-details">
					<table class="table">

						<tbody>
							<tr>
								<th scope="row">ID:</th>
								<td><%=user.getId()%></td>

							</tr>
							<tr>
								<th scope="row">Email:</th>
								<td><%=user.getEmail()%></td>

							</tr>
							<tr>
								<th scope="row">Gender:</th>
								<td><%=user.getGender()%></td>
							</tr>

							<tr>
								<th scope="row">Status:</th>
								<td><%=user.getAbout()%></td>
							</tr>

							<tr>
								<th style="width: 200px" scope="row">Registered on:</th>
								<td><%=user.getDatetime().toString()%></td>
							</tr>



						</tbody>
					</table>

					<!-- Deatils over -->
				</div>




				<!-- Profile Edit -->
				<div id="profile-edit" style="display: none">
					<h3 style="text-align: center" class="mt-2">Please Edit
						Carefully</h3>

					<form action="EditServlet" method="post">
						<table class="table">

							<tr>

								<td>ID:</td>
								<td>       <%=user.getId()%></td>


							</tr>
<!-- Email -->


							<tr>

								<td>Email</td>
								<td><input type="email" name="user_email"
									class="form-control" value="<%= user.getEmail() %>" ></td>
							</tr>

<!-- Name -->
							<tr>

								<td>Name</td>
								<td><input type="text" name="user_name"
									class="form-control" value="<%= user.getName() %>" ></td>
							</tr>
							
							<!-- Password -->
							<tr>

								<td>Password</td>
								<td><input type="password" name="user_password"
									class="form-control" value="<%= user.getPassword() %>" ></td>
							</tr>
							<!-- Gender (connot Changed )  -->
							
								<tr>

								<td>About</td>
								<td>
								 <textarea rows="5" cols="" class = "form-control" name="user-about">
								 
								      <%= user.getAbout() %>
								 </textarea>
								</td>
							</tr>
							
							
							<!-- New profile pics
							 -->
							 <tr>
							 	<td>New Profile</td>
								<td>
								    <input type= "file" name = "image" class = "form-control">
								</td>
							</tr>
							
							<!--  -->
							
							
							
							


						</table>
						
						<div class = "container" style= "text-align:center">
						
						<button type= "submit" class= "btn btn-outline-primary">Submit</button></div>

					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" aria-label="Close modal">Close</button>
					<button type="button" id="edit-profile-btn" class="btn btn-primary"
						aria-label="Edit profile">Edit</button>
				</div>

				<!-- JavaScript -->
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
					crossorigin="anonymous"></script>
				<script src="https://code.jquery.com/jquery-3.7.1.min.js"
					integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
					crossorigin="anonymous"></script>
				<script src="js/myjs.js" type="text/javascript"></script>

				<script>
					$(document).ready(function() {

						let editStatus = false;
						$('#edit-profile-btn').click(function() {

							if (editStatus == false) {

								$('#profile-details').hide();

								$('#profile-edit').show();

								editStatus = true
								$(this).text("Back")
							} else

							{
								$('#profile-details').show();

								$('#profile-edit').hide();
								editStatus = false
								$(this).text("Edit")

							}

						});
					});
				</script>