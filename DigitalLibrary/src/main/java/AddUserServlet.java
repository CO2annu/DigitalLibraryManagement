

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class AddUserServlet extends HttpServlet {
	Connection con;
	public void init(ServletConfig config)
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root" , "root");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String radio = request.getParameter("q1");
		boolean admin = false;
		if(radio.equals("admin")) {
            admin=true;
        }
        try {
        Statement stmt = con.createStatement();
         stmt.executeUpdate("USE LIBRARY");
         stmt.executeUpdate("INSERT INTO USERS(USERNAME,PASSWORD,ADMIN) VALUES ('"+username+"','"+password+"',"+admin+")");
         request.setAttribute("Message", "User Added Successfully");
         
        }
         
        catch (SQLException e1) {            
            out.println("Exception caught");
        }   
        RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
        rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void destroy()
	{
		try {
			con.close();
		}
		catch(Exception e) {
			
		}
	}

}
