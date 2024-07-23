

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.*;
import java.util.concurrent.TimeUnit;


public class ReturnBookServlet extends HttpServlet {
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
		String iid = request.getParameter("IID");
        String return_date = request.getParameter("returnDate");
        try {
            Statement stmt = con.createStatement();
             stmt.executeUpdate("USE LIBRARY");
             
             String date1=null;
             String date2=return_date; 
             
          
             ResultSet rs = stmt.executeQuery("SELECT ISSUED_DATE FROM ISSUED WHERE IID="+iid);
             while (rs.next()) {
                 date1 = rs.getString(1);
                  
               }
              int days = 0;
             try {
            	 java.util.Date date_1= new SimpleDateFormat("dd-MM-yyyy").parse(date1);
            	 java.util.Date date_2= new SimpleDateFormat("dd-MM-yyyy").parse(date2);
                
                    long diff = date_2.getTime() - date_1.getTime();
                   
                    days=(int)(TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS));
                     
                     
                } catch (ParseException e1) {
                    
                    e1.printStackTrace();
                }
              
             
          
             stmt.executeUpdate("UPDATE ISSUED SET RETURN_DATE='"+return_date+"' WHERE IID="+iid);
              

             Statement stmt1 = con.createStatement();
             stmt1.executeUpdate("USE LIBRARY");                
            ResultSet rs1 = stmt1.executeQuery("SELECT PERIOD FROM ISSUED WHERE IID="+iid); 
            String diff=null; 
            while (rs1.next()) {
                 diff = rs1.getString(1);
                  
               }
            int diff_int = Integer.parseInt(diff);
            if(days>diff_int) { 
                int fine = (days-diff_int)*10; 
                stmt1.executeUpdate("UPDATE ISSUED SET FINE="+fine+" WHERE IID="+iid);  
                String fine_str = ("Fine: Rs. "+fine);
                
                 
            }

             request.setAttribute("returnmessage", "Book returned");
            }
                     
             
            catch (SQLException e1) {
                
                 out.println(e1);
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
