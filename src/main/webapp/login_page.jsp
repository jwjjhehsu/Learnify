<%@page import="com.tech.learnify.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<!-- CSS -->
<style>
.banner-background {
	clip-path: polygon(19% 0, 81% 0, 100% 30%, 100% 92%, 70% 89%, 25% 100%, 0 84%, 0%
		30%);
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

	<main>

		<!-- Navbar -->
		<%@ include file="normal_navbar.jsp"%>

		<main class="d-flex align-items-center primary-background"
			style="height: 70vh">
			<div class="container">
				<div class="row">
					<div class="col-md-4 offset-md-4">
						<div class="card">
							<div
								class="card-header primary-background text-white text-center">
								<span class="fa fa-user-plus fa-2x"></span> <br>
								<p>
									<b>Login Here</b>
								</p>
							</div>
							<%
							// Retrieve the message from the session
							Message m = (Message) session.getAttribute("msg");
							if (m != null) {
							%>
							<div class="alert <%=m.getCssClass()%>" role="alert">
								<%=m.getContent()%>
							</div>
							<%
							// Remove the message from the session after displaying it
							session.removeAttribute("msg");
							}
							%>

							<div class="card-body">
								<form action="LoginServlet" method="post">
									<!-- Ensure this matches your servlet mapping -->
									<div class="form-group">
										<label for="exampleInputEmail1">Email address</label> <input
											name="email" required type="email" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp">
										<div id="emailHelp" class="form-text">We'll never share
											your email with anyone else.</div>
									</div>
									<div class="mb-3">
										<label for="exampleInputPassword1" class="form-label">Password</label>
										<input name="password" required type="password"
											class="form-control" id="exampleInputPassword1">
									</div>
									<div class="container text-center">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>

		<!-- JavaScript -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"
			integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
			crossorigin="anonymous"></script>
		<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>
