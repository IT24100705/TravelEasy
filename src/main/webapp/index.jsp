<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title> Tourism Package Customization Platform</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css">
</head>
<body>
<header>
    <h2 class="Name">TravelEasy</h2>
    <nav class ="navigation">
        <a href="#">Home</a>
        <a href="#">About</a>
        <a href="#">Services</a>
        <a href="#">Contacts</a>
        <button class="btnlogin-popup"><a href="<%= request.getContextPath()%>/login">Login</a></button>
    </nav>
</header>
<%
    String message = request.getParameter("message");
    if (message != null) {
%>
<p style="color: green;"><%= message %></p>
<%
    }
%>


<script src="script.js"></script>
</body>
</html>
