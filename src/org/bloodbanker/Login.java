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

import org.bloodbanker.dto.User;
import org.bloodbanker.helper.UserDetails;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection conn;
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		conn = (Connection)config.getServletContext().getAttribute("conn");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Boolean loggedIn = (Boolean) request.getSession().getAttribute("LoggedIn");
		String userId = request.getParameter("unm");
		String password = request.getParameter("pwd");
		String reqPgSI = request.getParameter("SignIn");
		String reqPageSO = request.getParameter("SignOut");
		String sessLoc = (String)request.getSession().getAttribute("srchLoc");
		String sessBldGrp = (String)request.getSession().getAttribute("bloodgroup");
		System.out.println(reqPgSI);
		
		if(loggedIn.booleanValue() && userId==null || password==null){
			loggedIn=false;
			request.getSession().setAttribute("LoggedIn", loggedIn);
			
			if("Search".equals(reqPgSI) || "Search".equals(reqPageSO)){
				request.getRequestDispatcher("Search.jsp?srchLoc="+sessLoc+"&bloodgroup="+sessBldGrp).forward(request, response);
			}else{
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			
			return;
		}
		
		User user = UserDetails.getUserDetails(conn,userId,password);
		if(user!=null){
			request.getSession().setAttribute("User", user);
			loggedIn=true;
			request.getSession().setAttribute("LoggedIn", loggedIn);	
			
			if("Search".equals(reqPgSI)){
				request.getRequestDispatcher("Search.jsp?srchLoc="+sessLoc+"&bloodgroup="+sessBldGrp).forward(request, response);
			}else{
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			
			return;
		}
		else{
			
			if("Search".equals(reqPgSI)){
				request.getRequestDispatcher("Search.jsp?srchLoc="+sessLoc+"&bloodgroup="+sessBldGrp+"&q=LoginFailed").forward(request, response);
				return;
			}
			request.getRequestDispatcher("index.jsp?q=LoginFailed").forward(request, response);
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Boolean loggedIn = (Boolean) request.getSession().getAttribute("LoggedIn");
		if(loggedIn instanceof Boolean && loggedIn.booleanValue())
			request.getRequestDispatcher("index.jsp").forward(request, response);
		else
			request.getRequestDispatcher("index.jsp?q=LoginFailed").forward(request, response);
	}

}
