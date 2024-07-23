<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 300px;
            text-align: center;
        }
        .container h1 {
            margin-bottom: 20px;
            color: #333;
        }
        .container input[type="text"],
        .container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        .container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .container a {
            color: #4CAF50;
            text-decoration: none;
            display: block;
            margin-top: 10px;
        }
        .container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login</h1>
        <form name="f1" action="/DigitalLibrary/LoginServlet" method="post" onsubmit="return validate()">
            <input type="text" name="username" placeholder="Username"/>
            <input type="password" name="password" placeholder="Password"/>
            <input type="submit" value="Login"/>
        </form>
        <a href="register.jsp">New User? Register here</a>
    </div>
    <script>
        function validate() {
            var x1 = document.f1.username.value;
            if (x1 == "" || x1 == null) {
                alert("Username should not be empty");
                return false;
            }
            var x2 = document.f1.password.value;
            if (x2 == "" || x2 == null) {
                alert("Password should not be empty");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
