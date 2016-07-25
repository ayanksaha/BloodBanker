package org.bloodbanker;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bloodbanker.helper.DBConfig;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
			
			Connection conn = DBConfig.getDBConnection();
			config.getServletContext().setAttribute("conn", conn);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getSession().setAttribute("LoggedIn", false);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

}
