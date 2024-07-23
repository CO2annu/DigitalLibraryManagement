<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0eafc, #cfdef3);
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #ffffff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 1.8em;
            font-weight: 600;
        }
        input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 1.1em;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        .error {
            color: #ff0000;
            font-size: 0.9em;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Register</h1>
        <form name="f1" action="/DigitalLibrary/registerServlet" method="post" onSubmit="return validate()">
            <input type="text" name="username" placeholder="Username"/>
            <input type="text" name="password" placeholder="Password"/>
            <input type="submit" value="Register"/>
        </form>
    </div>
    <script>
        function validate() {
            var username = document.f1.username.value;
            var password = document.f1.password.value;

            if (username.trim() === "") {
                alert("Username should not be empty");
                return false;
            }
            if (password.trim() === "") {
                alert("Password should not be empty");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
