<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0eafc, #cfdef3);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 900px;
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 2em;
            font-weight: 600;
        }
        .nav-links {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .nav-links li {
            margin: 10px 0;
        }
        .nav-links a {
            display: block;
            padding: 15px;
            margin: 0 auto;
            background: #007bff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1.1em;
            transition: background 0.3s ease, transform 0.3s ease;
        }
        .nav-links a:hover {
            background: #0056b3;
            transform: translateY(-2px);
        }
        .message {
            margin: 20px 0;
            padding: 15px;
            border-radius: 8px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            font-size: 1.1em;
        }
        .message.error {
            background-color: #f8d7da;
            color: #721c24;
            border-color: #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %></h1>
        <ul class="nav-links">
            <li><a href="AddUser.jsp">Add User</a></li>
            <li><a href="AddBook.jsp">Add Book</a></li>
            <li><a href="IssueBook.jsp">Issue Book</a></li>
            <li><a href="ReturnBook.jsp">Return Book</a></li>
            <li><a href="viewBookServlet">View Books</a></li>
            <li><a href="viewUserServlet">View Users</a></li>
            <li><a href="viewIssuedBookServlet">View Issued Books</a></li>
            <li><a href="logoutServlet">Logout</a></li>
        </ul>

        <% 
            String errorMessage = (String) request.getAttribute("Message");
            if (errorMessage != null) {
        %>
            <div class="message"><%= errorMessage %></div>
        <% 
            }
        %>

        <% 
            String bookmessage = (String) request.getAttribute("bookmessage");
            if (bookmessage != null) {
        %>
            <div class="message"><%= bookmessage %></div>
        <% 
            }
        %>

        <% 
            String IssueMessage = (String) request.getAttribute("IssueMessage");
            if (IssueMessage != null) {
        %>
            <div class="message"><%= IssueMessage %></div>
        <% 
            }
        %>

        <% 
            String returnmessage = (String) request.getAttribute("returnmessage");
            if (returnmessage != null) {
        %>
            <div class="message"><%= returnmessage %></div>
        <% 
            }
        %>
    </div>
</body>
</html>
