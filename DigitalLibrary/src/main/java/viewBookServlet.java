

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import classes.Book;

import java.sql.*;
import java.util.*;


public class viewBookServlet extends HttpServlet {
    private Connection con;

    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "root");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM BOOKS";
        try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                int BID = rs.getInt("BID");
                String Bname = rs.getString("BNAME");
                String genre = rs.getString("GENRE");
                int price = rs.getInt("PRICE");
                Book book = new Book(BID, Bname, genre, price);
                books.add(book);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        request.setAttribute("bookList", books);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewBook.jsp");
        dispatcher.forward(request, response);
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
