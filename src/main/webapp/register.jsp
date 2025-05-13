<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register - TravelEasy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('https://cdn.pixabay.com/photo/2022/10/07/08/59/sky-7504583_1280.jpg') no-repeat;
            background-size: cover;
            background-position: center;
            padding-top: 80px;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 15px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 99;
            background: rgba(22, 41, 56, 0.9);
        }

        .Name {
            font-size: 2em;
            color: #fff;
            user-select: none;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
        }

        .navigation a {
            position: relative;
            font-size: 1.1em;
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            margin-left: 40px;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
        }

        .navigation a::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -6px;
            width: 100%;
            height: 3px;
            background: #fff;
            border-radius: 5px;
            transform-origin: right;
            transform: scaleX(0);
            transition: transform .5s;
        }

        .navigation a:hover::after {
            transform-origin: left;
            transform: scaleX(1);
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .container h2 {
            color: #fff;
            margin-bottom: 20px;
            font-weight: 600;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
        }

        .container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            font-size: 1em;
        }

        .container input::placeholder {
            color: #ddd;
        }

        .container button {
            width: 100%;
            padding: 10px;
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        .container button:hover {
            background: #0056b3;
        }

        .message {
            color: #ff3333;
            margin-bottom: 10px;
        }

        .container p {
            color: #fff;
            margin-top: 10px;
        }

        .container a {
            color: #007bff;
            text-decoration: none;
        }

        .container a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            header {
                flex-direction: column;
                padding: 10px 20px;
                align-items: flex-start;
            }

            .navigation {
                display: flex;
                flex-direction: column;
                margin-top: 10px;
            }

            .navigation a {
                margin: 10px 0 0 0;
            }

            .container {
                margin-top: 60px;
            }
        }
    </style>
</head>
<body>
<header>
    <h2 class="Name">TravelEasy</h2>
    <nav class="navigation">
        <a href="<%= request.getContextPath() %>/">Home</a>
        <a href="<%= request.getContextPath() %>/login.jsp">Login</a>
    </nav>
</header>

<div class="container">
    <h2>Register</h2>
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
    <div class="message"><%= message %></div>
    <%
        }
    %>
    <form action="register" method="post">
        <input type="text" name="name" placeholder="Name" required>
        <input type="tel" name="telephone" placeholder="Telephone Number" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="<%= request.getContextPath() %>/login.jsp">Login</a></p>
</div>
</body>
</html>