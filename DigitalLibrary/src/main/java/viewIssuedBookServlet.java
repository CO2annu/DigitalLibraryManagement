

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import classes.Issued;


public class viewIssuedBookServlet extends HttpServlet {
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
		List<Issued> Issues = new ArrayList<>();
        String sql = "SELECT * FROM ISSUED";
        try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                int IID = rs.getInt("IID");
                int UID = rs.getInt("UID");
                int BID = rs.getInt("BID");
                String Issued_date = rs.getString("Issued_date");
                String Return_date = rs.getString("Return_date");
                int period = rs.getInt("period");
                int fine = rs.getInt("fine");
                Issued Issue = new Issued(IID , UID , BID , Issued_date , Return_date , period , fine);
                Issues.add(Issue);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        request.setAttribute("issueList", Issues);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewIssuedBook.jsp");
        dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
