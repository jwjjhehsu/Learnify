<%@ page import="com.tech.learnify.entities.User" %>
<%@ page import="com.tech.learnify.entities.Post" %>
<%@ page import="com.tech.learnify.dao.PostDao" %>
<%@ page import="com.tech.learnify.helper.ConnectionProvider" %>
<%@ page errorPage="error_page.jsp" %>
<% 
User user = (User) session.getAttribute("currentUser");
if (user == null) {
    response.sendRedirect("login_page.jsp");
    return; 
}
%>

<% 
int postId = 0;
try {
    postId = Integer.parseInt(request.getParameter("post_id"));
} catch (NumberFormatException e) {
    response.sendRedirect("error_page.jsp");
    return;
}

PostDao postDao = new PostDao(ConnectionProvider.getConnection());
Post p = postDao.getPostByPostId(postId);
if (p == null) {
    response.sendRedirect("error_page.jsp");
    return;
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= p.getpTitle() %> || LearnifyApp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background {
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%);
        }
        .post-title {
            font-weight: 100;
            font-size: 30px;
        }
        .post-content {
            font-weight: 100;
            font-size: 25px;
        }
        .post-user-information {
            font-size: 20px;
        }
        .row-user {
            border: 1px solid #e2e2e2;
            padding-top: 15px;
        }
    </style>
</head>
<body>
    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"><b><span class="fa fa-graduation-cap"></span> Learnify</b></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="profile.jsp"><span class="fa fa-lightbulb-o"></span> Learn To Achieve Anything</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"><span class="fa fa-newspaper-o"></span> Categories</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Programming Language</a></li>
                            <li><a class="dropdown-item" href="#">Projects Implementation</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Data Structure</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-id-card"></span> Add Post</a></li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName() %></a></li>
                    <li class="nav-item"><a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Log out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main content -->
    <div class="container">
        <div class="row my-4">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="post-title"><%= p.getpTitle() %></h4>
                    </div>
                    <div class="card-body">
                        <div class="row my-3 row-user">
                            <div class="col-md-8">
                                <p class="post-user-information"><a href="#!">Adarsha </a> has posted: </p>
                            </div>
                        </div>
                        <p class="post-content"><%= p.getpContent() %></p>
                        <br>
                        <div class="post-code">
                            <pre><%= p.getpCode() %></pre>
                        </div>
                    </div>
                    <div class="card-footer bg-primary">
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumb-o-up"></i> <span>10</span></a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i> <span>20</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Profile modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="profile-modal-label" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h1 class="modal-title fs-5" id="profile-modal-label">Learnify</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="container text-center">
                    <%
                    String profileImage = user.getGender().equalsIgnoreCase("female") ? "pics/female.png" : "pics/" + user.getProfile();
                    %>
                    <img src="<%= profileImage %>" class="img-fluid" style="border-radius: 50%; max-width: 150px;" alt="User Profile Image" />
                    <h4 class="mt-3"><%= user.getName() %></h4>
                </div>
                <div id="profile-details">
                    <table class="table">
                        <tbody>
                            <tr><th scope="row">ID:</th><td><%= user.getId() %></td></tr>
                            <!-- Add more profile details as needed -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    <script>
        $(document).ready(function() {
            let editStatus = false;
            $('#edit-profile-btn').click(function() {
                $('#profile-details').toggle();
                editStatus = !editStatus;
                $(this).text(editStatus ? "Back" : "Edit");
            });
        });
    </script>
</body>
</html>
