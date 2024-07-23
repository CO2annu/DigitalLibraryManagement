<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add User</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f0f4f8, #d9e2ec);
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
            max-width: 400px;
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
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1em;
        }
        input[type="radio"] {
            margin: 0 10px;
        }
        label {
            margin: 0 10px;
            font-size: 1em;
            color: #333;
        }
        input[type="submit"] {
            background: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 1em;
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
        <h1>Enter User Details</h1>
        <form name="f1" action="/DigitalLibrary/AddUserServlet" method="post" onsubmit="return validate()">
            <input type="text" name="username" placeholder="Username"/>
            <input type="password" name="password" placeholder="Password"/>
            <div>
                <label><input type="radio" name="q1" value="admin"/> Admin</label>
                <label><input type="radio" name="q1" value="user"/> User</label>
            </div>
            <input type="submit" value="Add"/>
        </form>
        <div id="error-message" class="error"></div>
    </div>
    <script>
        function validate() {
            var username = document.f1.username.value.trim();
            var password = document.f1.password.value.trim();
            var userType = document.querySelector('input[name="q1"]:checked');

            var errorMessage = '';

            if (!username) {
                errorMessage += 'Username should not be empty.<br>';
            }
            if (!password) {
                errorMessage += 'Password should not be empty.<br>';
            }
            if (!userType) {
                errorMessage += 'Select type of user.<br>';
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
