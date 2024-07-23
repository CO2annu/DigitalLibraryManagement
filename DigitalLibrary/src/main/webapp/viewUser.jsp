<%@ page import="java.util.List" %>
<%@ page import="classes.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Users</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e2e2e2, #ffffff);
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            background: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #ffffff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #e2e2e2;
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            margin: 20px auto;
            background: #007bff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 1.1em;
            transition: background 0.3s ease, transform 0.3s ease;
            text-align: center;
        }
        a:hover {
            background: #0056b3;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <h1>Users</h1>
    <table>
        <thead>
            <tr>
                <th>UID</th>
                <th>USERNAME</th>
                <th>PASSWORD</th>
                <th>ADMIN</th>
            </tr>
        </thead>
        <tbody>
            <%
            @SuppressWarnings("unchecked")
            List<User> userList = (List<User>) request.getAttribute("userList");
            if (userList != null) {
                for (User user : userList) {
            %>
                <tr>
                    <td><%= user.getUID() %></td>
                    <td><%= user.getUsername() %></td>
                    <td><%= user.getPassword() %></td>
                    <td><%= user.getAdmin() %></td>
                </tr>
            <%
                }
            }
            %>
        </tbody>
    </table>
    <a href="AddUser.jsp">Add User</a>
</body>
</html>
