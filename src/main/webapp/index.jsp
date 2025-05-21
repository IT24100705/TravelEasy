<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Tourism Package Customization Platform</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css">
    <style>
        .message {
            margin: 20px auto;
            padding: 15px 20px;
            width: 90%;
            max-width: 600px;
            border-radius: 8px;
            font-size: 16px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .message.success {
            background-color: #e6f9ec;
            color: #2d7a38;
            border: 1px solid #b5e2c3;
        }
    </style>
</head>
<body>
<%
    String message = request.getParameter("message");
    if (message != null) {
%>
<div class="message success"><%= message %></div>
<%
    }
%>

<header>
    <h2 class="Name">TravelEasy</h2>
    <nav class="navigation">
        <a href="#">Home</a>
        <a href="#">About</a>
        <a href="#">Services</a>
        <a href="#">Contacts</a>
        <button class="btnlogin-popup"><a href="<%= request.getContextPath() %>/login">Login</a></button>
    </nav>
</header>

<script src="script.js"></script>
</body>
</html>
