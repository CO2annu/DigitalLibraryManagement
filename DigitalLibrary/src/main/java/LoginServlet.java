


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class LoginServlet extends HttpServlet {
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
		try
        {
        Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
          stmt.executeUpdate("USE LIBRARY"); 
          String st = ("SELECT * FROM USERS WHERE USERNAME='"+username+"' AND PASSWORD='"+password+"'"); 
          ResultSet rs = stmt.executeQuery(st);
          if(rs.next()==false) { 
              out.print("No user");  
          }
          else {
            rs.beforeFirst();  
            while(rs.next())
            {
            	HttpSession session = request.getSession();
                session.setAttribute("username", username);
              String admin = rs.getString("ADMIN"); 
              String UID = rs.getString("UID"); 
              if(admin.equals("1")) { 
                   response.sendRedirect("Admin.jsp");
              }
              else{
                  response.sendRedirect("User.jsp"); 
              }
          }
          }
        }
        catch (Exception ex) {
             ex.printStackTrace();
    }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
