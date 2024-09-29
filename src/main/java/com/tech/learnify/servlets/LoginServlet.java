package com.tech.learnify.servlets;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import com.tech.learnify.dao.UserDao;
import com.tech.learnify.entities.Message;
import com.tech.learnify.entities.User;
import com.tech.learnify.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Fetch username and password from request
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");

        // Validate input
        if (userEmail == null || userPassword == null || userEmail.isEmpty() || userPassword.isEmpty()) {
            out.println("<html><body><h3>Error: Email and Password must not be empty.</h3></body></html>");
            return;
        }

        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        User user = dao.getUserByEmailAndPassword(userEmail, userPassword);

        if (user == null) {
            // Login failed
           Message msg = new Message("Invalid Details ! Try again .. ", "error","alert-danger");
           HttpSession s = request.getSession();
           s.setAttribute("msg", msg);
           
           
           response.sendRedirect("login_page.jsp");
           
        } else {
            // Login success
        	
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            response.sendRedirect("profile.jsp");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
