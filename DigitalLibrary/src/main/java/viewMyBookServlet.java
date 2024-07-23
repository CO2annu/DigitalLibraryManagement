

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import classes.userBook;

import java.sql.*;
import java.util.*;


public class viewMyBookServlet extends HttpServlet {
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
    	HttpSession session = request.getSession();
    	String username = (String) session.getAttribute("username"); 
        int UID = 0;

        String uidQuery = "SELECT UID FROM users WHERE username = '" + username + "'";

        try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(uidQuery)) {
            if (rs.next()) {
                UID = rs.getInt("UID");
            } else {
                response.getWriter().println("User not found.");
                return;
            }
        } catch (Exception e) {
            throw new ServletException("Error fetching UID.", e);
        }
         List<userBook> issuedBooks = new ArrayList<>();
         String sql = "SELECT issued.*, books.bname, books.genre, books.price "
                    + "FROM issued "
                    + "JOIN books ON issued.bid = books.bid "
                    + "WHERE issued.uid = " + UID;

         try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
             while (rs.next()) {
                 int IID = rs.getInt("IID");
                 int UID_int = rs.getInt("UID");
                 int BID = rs.getInt("BID");
                 String issuedDate = rs.getString("ISSUED_DATE");
                 String returnDate = rs.getString("RETURN_DATE");
                 String bookName = rs.getString("BNAME");
                 String genre = rs.getString("GENRE");
                 int price = rs.getInt("PRICE");
                 userBook issuedBook = new userBook(IID, UID_int, BID, issuedDate, returnDate, bookName, genre, price);
                 issuedBooks.add(issuedBook);
             }
         } catch (Exception e) {
             throw new ServletException("Database error.", e);
         }

         request.setAttribute("issuedBooks", issuedBooks);
         request.getRequestDispatcher("viewMyBook.jsp").forward(request, response);
    }

    public void destroy() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

