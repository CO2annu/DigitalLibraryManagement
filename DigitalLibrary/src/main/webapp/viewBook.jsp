<%@ page import="java.util.List" %>
<%@ page import="classes.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Books Available</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f3f4f6, #e0e3e7);
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
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
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
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
    <h1>Books Available</h1>
    <table>
        <thead>
            <tr>
                <th>BID</th>
                <th>BNAME</th>
                <th>GENRE</th>
                <th>PRICE</th>
            </tr>
        </thead>
        <tbody>
            <%
            @SuppressWarnings("unchecked")
            List<Book> bookList = (List<Book>) request.getAttribute("bookList");
            if (bookList != null) {
                for (Book book : bookList) {
            %>
                <tr>
                    <td><%= book.getBID() %></td>
                    <td><%= book.getBname() %></td>
                    <td><%= book.getGenre() %></td>
                    <td><%= book.getPrice() %></td>
                </tr>
            <%
                }
            }
            %>
        </tbody>
    </table>
    <a href="AddBook.jsp">Add Book</a>
</body>
</html>
