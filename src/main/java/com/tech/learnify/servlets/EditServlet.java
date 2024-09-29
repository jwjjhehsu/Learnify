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

import com.tech.learnify.dao.UserDao;
import com.tech.learnify.entities.Message;
import com.tech.learnify.entities.User;
import com.tech.learnify.helper.ConnectionProvider;
import com.tech.learnify.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("deprecation")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Fetch all data from the edit user
            String userEmail = request.getParameter("user_email");
            String userName = request.getParameter("user_name");
            String userPassword = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");

            Part part = request.getPart("image"); // to get the image
            String imageName = part.getSubmittedFileName(); // to get the image name

            // Get the user from the session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            if (user != null) {
                user.setEmail(userEmail);
                user.setName(userName);
                user.setPassword(userPassword);
                user.setAbout(userAbout);
                String oldFile = user.getProfile();
                
                user.setProfile(imageName);

                // Update the data in the database also
                UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                boolean isUpdated = userDao.updateUser(user);

                if (isUpdated) {
                    String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                    
                    // Delete old file
                    String pathOldFile = request.getRealPath("/") + "pics" + File.separator + oldFile;
                    if(oldFile.equals( "default.png"))
                    {
                    Helper.deleteFile(pathOldFile);
                    }

                    // Attempt to save the new file
                    boolean isFileSaved = Helper.saveFile(part.getInputStream(), path);
                    if (isFileSaved) {
                        Message msg = new Message("Profile details updated successfully", "success", "alert-success");
                        session.setAttribute("msg", msg);
                    } else {
                        Message msg = new Message("Something went wrong while saving the file.", "error", "alert-danger");
                        session.setAttribute("msg", msg);
                    }
                } else {
                    Message msg = new Message("Unable to update to the database.", "error", "alert-danger");
                    session.setAttribute("msg", msg);
                }
                response.sendRedirect("profile.jsp");
            } else {
                out.println("<h3>User not found in session.</h3>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optionally handle GET requests if needed
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported.");
    }
}