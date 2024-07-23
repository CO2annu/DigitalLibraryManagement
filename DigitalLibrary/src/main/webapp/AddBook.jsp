<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Books</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f5f5f5, #e0eafc);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            text-align: center;
            border: 1px solid #e0e0e0;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 2.5em;
            font-weight: 600;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
            align-items: center;
        }
        label {
            font-size: 1.1em;
            color: #555;
            margin-bottom: 5px;
            text-align: left;
            width: 100%;
            max-width: 300px;
        }
        input[type="text"], input[type="number"] {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 1em;
            width: 100%;
            max-width: 300px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background: #007bff;
            color: #ffffff;
            border: none;
            padding: 15px 20px;
            border-radius: 10px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
            width: 100%;
            max-width: 300px;
            box-sizing: border-box;
        }
        input[type="submit"]:hover {
            background: #0056b3;
            transform: translateY(-3px);
        }
        .alert {
            color: #d9534f;
            font-size: 1em;
            margin-top: 10px;
            text-align: left;
            width: 100%;
            max-width: 300px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Book Details</h1>
        <form action="/DigitalLibrary/AddBookServlet" name="f1" method="post" onSubmit="return validate()">
            <label for="bname">Book Name</label>
            <input type="text" id="bname" name="bname" placeholder="Enter book name">
            <label for="genre">Genre</label>
            <input type="text" id="genre" name="genre" placeholder="Enter genre">
            <label for="price">Price</label>
            <input type="number" id="price" name="price" min="0" placeholder="Enter price">
            <input type="submit" value="Submit">
            <div id="error-message" class="alert"></div>
        </form>
        <script>
            function validate() {
                var bname = document.f1.bname.value;
                var genre = document.f1.genre.value;
                var price = document.f1.price.value;
                var errorMessage = "";

                if (bname === "" || bname === null) {
                    errorMessage += "Book name should not be empty.<br>";
                }
                if (genre === "" || genre === null) {
                    errorMessage += "Genre should not be empty.<br>";
                }
                if (price === "" || price < 0) {
                    errorMessage += "Price should be a valid positive number.<br>";
                }

                if (errorMessage !== "") {
                    document.getElementById("error-message").innerHTML = errorMessage;
                    document.getElementById("error-message").style.display = "block";
                    return false;
                }
                return true;
            }
        </script>
    </div>
</body>
</html>
