<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Return Book</title>
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
            box-sizing: border-box;
        }
        input[type="submit"] {
            background: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        input[type="submit"]:hover {
            background: #0056b3;
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
        <h1>Return Book</h1>
        <form name="f1" action="/DigitalLibrary/ReturnBookServlet" method="post" onsubmit="return validate()">
            <input type="number" name="IID" placeholder="Issue ID" />
            <input type="date" name="returnDate" placeholder="Date(DD-MM-YYYY)"/>
            <input type="submit" value="Submit" />
        </form>
        <div id="error-message" class="error"></div>
    </div>
    <script>
        function validate() {
            var IID = document.f1.IID.value.trim();
            var returnDate = document.f1.returnDate.value;

            var errorMessage = '';

            if (!IID) {
                errorMessage += 'Enter a valid Issue ID.<br>';
            }
            if (!returnDate) {
                errorMessage += 'Enter a valid Return Date.<br>';
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
