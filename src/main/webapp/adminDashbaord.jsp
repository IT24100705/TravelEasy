<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard - TravelEasy</title>
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
            background: url('https://theaseanmagazine.asean.org/files/media/2024/03/issue36-42-1.jpg') no-repeat;
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

        .dashboard-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            text-align: center;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .dashboard-container h2 {
            color: #fff;
            margin-bottom: 20px;
            font-weight: 600;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
        }

        .dashboard-container p {
            color: #fff;
            font-size: 1em;
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

            .dashboard-container {
                margin-top: 60px;
            }
        }
    </style>
</head>
<body>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("dashboard.jsp?message=Access+denied.+Admin+only.");
        return;
    }
%>
<header>
    <h2 class="Name">TravelEasy</h2>
    <nav class="navigation">
        <a href="<%= request.getContextPath() %>/">Home</a>
        <a href="dashboard.jsp">User Dashboard</a>
        <a href="login.jsp">Logout</a>
    </nav>
</header>

<div class="dashboard-container">
    <h2>Admin Dashboard</h2>
    <p>Welcome, <%= session.getAttribute("email") %>! This is the admin dashboard.</p>
    <p>Admin features (e.g., manage users, view all travel packages) can be added here.</p>
</div>
</body>
</html>