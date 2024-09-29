package com.tech.learnify.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.learnify.dao.UserDao;
import com.tech.learnify.entities.User;
import com.tech.learnify.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */

@WebServlet("/RegisterServlet")

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			// Corrected HTML syntax

			// Fetch all form data
			String check = request.getParameter("check");
			if (check == null) {
				out.println("box not checked");
			} else {
				String name = request.getParameter("user_name");
				String email = request.getParameter("user_email");
				String password = request.getParameter("user_password");
				String gender = request.getParameter("gender");
				String about = request.getParameter("about");

				// Create user object and set all data to that object
				User user = new User(name, email, password, gender, about);

				// Create a user dao object

				UserDao dao = new UserDao(ConnectionProvider.getConnection());

				if (dao.saveUser(user)) {
					out.println("done");

				} else

				{
					out.println("error");

				}

			}

		}
	}
}