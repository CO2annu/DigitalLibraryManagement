

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class AddBookServlet extends HttpServlet {
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
		String bname = request.getParameter("bname");
        String genre = request.getParameter("genre");
        int price = Integer.parseInt(request.getParameter("price"));  
        try {
        Statement stmt = con.createStatement();
         stmt.executeUpdate("USE LIBRARY");
         stmt.executeUpdate("INSERT INTO BOOKS(BNAME,GENRE,PRICE) VALUES ('"+bname+"','"+genre+"',"+price+")");
         request.setAttribute("bookmessage", "Book Added Successfully");       
        }
         
        catch (SQLException e1) {
            
        	out.println("e1");
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
