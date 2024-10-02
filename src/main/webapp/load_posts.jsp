<%@page import="com.tech.learnify.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.learnify.helper.ConnectionProvider"%>
<%@page import="com.tech.learnify.dao.PostDao"%>

<style>
    body {
        font-family: Arial, sans-serif; /* Sets a clean font for the page */
        background-color: #f4f4f4; /* Light background color for contrast */
        margin: 0; /* Removes default margin */
        padding: 20px; /* Adds padding around the content */
    }

    .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between; /* Aligns items evenly with reduced gaps */
        margin: 0 -10px; /* Reduces outer margin */
    }

    .col-md-4 {
        padding: 10px; /* Adjusts padding around each column */
        box-sizing: border-box; /* Ensures padding is included in width calculation */
    }

    .card {
        border: none; /* Removes default border for a cleaner look */
        border-radius: 8px; /* Adds rounded corners */
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* Adds subtle shadow for depth */
        transition: transform 0.2s, box-shadow 0.2s; /* Smooth scaling effect on hover */
        background-color: white; /* Sets card background to white for contrast */
    }

    .card:hover {
        transform: translateY(-5px); /* Slightly lifts card on hover */
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2); /* Enhances shadow on hover */
    }

    .card-img-top {
        border-top-left-radius: 8px; /* Matches card border radius */
        border-top-right-radius: 8px; /* Matches card border radius */
        height: auto; /* Ensures image maintains aspect ratio */
    }

    .card-title {
        font-size: 1.5rem; /* Increases title font size for emphasis */
        font-weight: bold; /* Makes title bold */
        margin-bottom: 10px; /* Adds space below title */
    }

    .card-text {
        font-size: 1rem; /* Adjusts content font size for readability */
        color: #555; /* Sets a softer text color */
        margin-bottom: 15px; /* Adds space below text content */
    }

    .code-snippet {
        background-color: #f8f9fa; /* Light background for code snippets */
        border-left: 4px solid #007bff; /* Blue left border for emphasis */
        padding: 10px;
        overflow-x: auto; /* Allows horizontal scrolling for long code lines */
        white-space: pre-wrap; /* Wraps long lines to fit the container */
    }

    .no-posts {
        text-align: center;
        font-size: 1.5em;
        color: #555;
        margin-top: 20px;
    }
</style>

<div class="row">
<%
    Thread.sleep(1000);
    // Create an instance of PostDao with the database connection
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = (cid == 0) ? postDao.getAllPosts() : postDao.getPostByCatId(cid);

    if (posts.isEmpty()) {
        out.println("<h4 class='no-posts'>No Posts in This Category</h4>");
    } else {
        // Iterate through each post and display it
        for (Post post : posts) {
%>
            <div class="col-md-4 mt-2"> <!-- Column for each post -->
                <div class="card" style="width: 100%;"> <!-- Full width within column -->
                    <img src="learnify_pics/<%= post.getpPic() %>" class="card-img-top" alt="<%= post.getpTitle() %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= post.getpTitle() %></h5>
                        <p class="card-text"><%= post.getpContent() %></p>
                    </div>
                    <div class="card-footer text-center">
                        <a href="show_blog_page.jsp?post_id=<%= post.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
                        <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumb-o-up"></i> <span>10</span></a>
                        <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span></a>
                    </div>
                </div>
            </div>
<%
        }
    }
%>
</div>
