<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Issue Book</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f3f4f6, #e0e3e7);
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
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 2em;
            font-weight: 600;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input[type="number"], input[type="date"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1em;
            box-sizing: border-box; /* Ensures padding and border are included in the width */
        }
        input[type="submit"] {
            background: #28a745;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        input[type="submit"]:hover {
            background: #218838;
        }
        .error {
            color: #e74c3c;
            font-size: 0.9em;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Enter Book Issue Details</h1>
        <form name="f1" action="/DigitalLibrary/IssueBookServlet" method="post" onsubmit="return validate()">
            <input type="number" name="BID" placeholder="Book ID" />
            <input type="number" name="UID" placeholder="User ID" />
            <input type="number" name="period" placeholder="Period (days)" />
            <input type="date" name="issueDate" placeholder="Date(DD-MM-YYYY)" />
            <input type="submit" value="Submit" />
        </form>
        <div id="error-message" class="error"></div>
    </div>
    <script>
        function validate() {
            var BID = document.f1.BID.value.trim();
            var UID = document.f1.UID.value.trim();
            var period = document.f1.period.value.trim();
            var issueDate = document.f1.issueDate.value;

            var errorMessage = '';

            if (!BID) {
                errorMessage += 'Book ID should not be empty.<br>';
            }
            if (!UID) {
                errorMessage += 'User ID should not be empty.<br>';
            }
            if (!period) {
                errorMessage += 'Enter the number of days.<br>';
            }
            if (!issueDate) {
                errorMessage += 'Enter the issue date.<br>';
            }

            if (errorMessage) {
                document.getElementById('error-message').innerHTML = errorMessage;
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
