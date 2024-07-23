<%@ page import="java.util.List" %>
<%@ page import="classes.userBook" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Issued Books</title>
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
        .no-data {
            text-align: center;
            font-style: italic;
            color: #888;
        }
    </style>
</head>
<body>
    <h1>Issued Books</h1>
    <table>
        <thead>
            <tr>
                <th>IID</th>
                <th>UID</th>
                <th>BID</th>
                <th>Issued Date</th>
                <th>Return Date</th>
                <th>Book Name</th>
                <th>Genre</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<userBook> issuedBooks = (List<userBook>) request.getAttribute("issuedBooks");
                if (issuedBooks != null && !issuedBooks.isEmpty()) {
                    for (userBook issuedBook : issuedBooks) {
            %>
                        <tr>
                            <td><%= issuedBook.getIID() %></td>
                            <td><%= issuedBook.getUID() %></td>
                            <td><%= issuedBook.getBID() %></td>
                            <td><%= issuedBook.getIssuedDate() %></td>
                            <td><%= issuedBook.getReturnDate() %></td>
                            <td><%= issuedBook.getBookName() %></td>
                            <td><%= issuedBook.getGenre() %></td>
                            <td><%= issuedBook.getPrice() %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="8" class="no-data">No issued books found for the given user.</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
