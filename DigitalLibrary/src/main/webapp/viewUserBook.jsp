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
            background: linear-gradient(135deg, #f0f4f8, #d9e2ec);
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
            text-transform: uppercase;
            font-size: 0.9em;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #e2e2e2;
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
</body>
</html>
