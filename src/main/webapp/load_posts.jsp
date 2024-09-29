<%@page import="com.tech.learnify.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.learnify.helper.ConnectionProvider"%>
<%@page import="com.tech.learnify.dao.PostDao"%>

<style>
    .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between; /* Aligns items evenly with reduced gaps */
        margin: 0 -10px; /* Reduces outer margin */
    }

    .col-md-4 { /* Changed from col-md-6 to col-md-4 */
        padding: 10px; /* Adjusts padding around each column */
    }

    .card {
        border: none; /* Removes default border for a cleaner look */
        border-radius: 8px; /* Adds rounded corners */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Adds subtle shadow for depth */
        transition: transform 0.2s; /* Smooth scaling effect on hover */
    }

    .card:hover {
        transform: scale(1.05); /* Slightly enlarges card on hover */
    }

    .card-img-top {
        border-top-left-radius: 8px; /* Matches card border radius */
        border-top-right-radius: 8px; /* Matches card border radius */
    }

    .card-title {
        font-size: 1.25rem; /* Increases title font size for emphasis */
        font-weight: bold; /* Makes title bold */
    }

    .card-text {
        font-size: 0.9rem; /* Adjusts content font size for readability */
        color: #555; /* Sets a softer text color */
    }

    .code-snippet {
        background-color: #f8f9fa; /* Light background for code snippets */
        border-left: 4px solid #007bff; /* Blue left border for emphasis */
        padding: 10px;
        overflow-x: auto; /* Allows horizontal scrolling for long code lines */
        white-space: pre-wrap; /* Wraps long lines to fit the container */
    }
</style>

<div class="row">
<%

Thread.sleep(1000);
    // Create an instance of PostDao with the database connection
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts= null;
    if(cid == 0)
    {
    // Retrieve all posts
   posts = postDao.getAllPosts();
    }else
    {
    	posts = postDao.getPostByCatId(cid);
    }
    
    
    if(posts.size() == 0)
    {
    	out.println("<h4 class='text-center' style='font-size: 1.2em; color: #555;'>No Posts in This Category</h4>");
    	return;
    }

    // Iterate through each post and display it
    for (Post post : posts) {
%>
        <div class="col-md-4 mt-2"> <!-- Changed from col-md-6 to col-md-4 -->
            <div class="card" style="width: 18rem;">
                <img src="blog_pics/<%= post.getpPic() %>" class="card-img-top" alt="<%= post.getpTitle() %>">
                
                <div class="card-body">
                    <h5 class="card-title"><%= post.getpTitle() %></h5>
                    <p class="card-text"><%= post.getpContent() %></p>
                    
                    <pre class="code-snippet"><%= post.getpCode() %></pre>
                </div>
            </div>
        </div>
<%
    }
%>
</div>