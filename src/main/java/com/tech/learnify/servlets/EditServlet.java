package com.tech.learnify.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.tech.learnify.entities.User; // Assuming User is your entity class
import com.tech.learnify.helper.ConnectionProvider;

@WebServlet("/EditServlet")
@MultipartConfig // Required for file upload
@MultipartConfig
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public EditServlet() {
        // Default constructor
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch form data
        String userEmail = request.getParameter("user_email");
        String userName = request.getParameter("user_name");
        String userPassword = request.getParameter("user_password");
        String userAbout = request.getParameter("user_about");
        Part part = request.getPart("image");
        String imageName = part.getSubmittedFileName();

        // Get the user from the session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");
        
        // Update the user object with the new details
        if (user != null) {
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            user.setProfile(imageName);
            
            // Optionally, save the updated user to the database (implement this based on your setup)
            // UserDAO.updateUser(user);
            UserDao userDao=new UserDao(ConnectionProvider.getConnection());
            
            boolean ans=userDao.updateUser(user);
            if(ans)
            {
            	out.println("updated to db");
            }else
            {
            	out.println("not updated..");
            }
            
        }

        // Respond to the client
        response.setContentType("text/html");
        response.getWriter().println("Profile updated successfully!");
    }
}
