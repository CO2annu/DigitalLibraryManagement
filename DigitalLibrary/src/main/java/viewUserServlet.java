

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import classes.User;


public class viewUserServlet extends HttpServlet {
	 private Connection con;

	    public void init() throws ServletException {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "root");
	        } catch (Exception e) {
	            throw new ServletException(e);
	        }
	    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM USERS";
        try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                int UID = rs.getInt("UID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                String Admin = rs.getString("Admin");
                User user = new User(UID , Username, Password , Admin);
                users.add(user);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        request.setAttribute("userList", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewUser.jsp");
        dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
