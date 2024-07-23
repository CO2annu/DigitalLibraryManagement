<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
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
            max-width: 600px;
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 2.5em;
            font-weight: 600;
        }
        a {
            display: block;
            padding: 15px;
            margin: 10px auto;
            background: #007bff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1.2em;
            transition: background 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            background: #0056b3;
            transform: translateY(-2px);
        }
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
            h1 {
                font-size: 2em;
            }
            a {
                font-size: 1em;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %></h1>
        <a href="viewUserBookServlet">View Books</a>
        <a href="viewMyBookServlet">My Books</a>
        <a href="logoutServlet">Logout</a>
    </div>
</body>
</html>
