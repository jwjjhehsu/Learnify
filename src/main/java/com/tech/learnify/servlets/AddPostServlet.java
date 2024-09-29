package com.tech.learnify.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.learnify.dao.PostDao;
import com.tech.learnify.entities.Post;
import com.tech.learnify.entities.User;
import com.tech.learnify.helper.ConnectionProvider;
import com.tech.learnify.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Retrieve parameters from the request
            String cidParam = request.getParameter("cid");
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pic");

            // Check for null or empty parameters
            if (cidParam == null || pTitle == null || pContent == null || pCode == null || part == null) {
                out.println("Error: Missing required fields.");
                return; // Exit early if any parameter is missing
            }

            int cid;
            try {
                cid = Integer.parseInt(cidParam);
            } catch (NumberFormatException e) {
                out.println("Error: Category ID must be a number.");
                return; // Exit early if cid is not a valid number
            }

            // Get current user from session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            if (user == null) {
                out.println("Error: User not logged in.");
                return; // Exit early if user is not logged in
            }

            // Create a new Post object
            Post post = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());

            // Save the post using PostDao
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            if (dao.savePost(post)) {
                @SuppressWarnings("deprecation")
				String path = request.getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(), path);
                out.println("done");
            } else {
                out.println("");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}