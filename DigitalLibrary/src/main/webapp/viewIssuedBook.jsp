<%@ page import="java.util.List" %>
<%@ page import="classes.Issued" %>
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
    <h1>Issued Books</h1>
    <table>
        <thead>
            <tr>
                <th>IID</th>
                <th>UID</th>
                <th>BID</th>
                <th>Issued Date</th>
                <th>Return Date</th>
                <th>Period (days)</th>
                <th>Fine</th>
            </tr>
        </thead>
        <tbody>
            <%
            @SuppressWarnings("unchecked")
            List<Issued> issuedList = (List<Issued>) request.getAttribute("issueList");
            if (issuedList != null) {
                for (Issued issue : issuedList) {
            %>
                <tr>
                    <td><%= issue.getIID() %></td>
                    <td><%= issue.getUID() %></td>
                    <td><%= issue.getBID() %></td>
                    <td><%= issue.getIssued_date() %></td>
                    <td><%= issue.getReturn_date() %></td>
                    <td><%= issue.getPeriod() %></td>
                    <td><%= issue.getFine() %></td>
                </tr>
            <%
                }
            }
            %>
        </tbody>
    </table>
    <a href="IssueBook.jsp">Issue Book</a>
</body>
</html>
