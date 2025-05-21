<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Travel Package</title>
    <style>
        :root {
            --primary: #4361ee;
            --primary-light: #4895ef;
            --success: #4cc9f0;
            --danger: #f72585;
            --dark: #2b2d42;
            --card-bg: rgba(255, 255, 255, 0.15);
            --card-border: rgba(255, 255, 255, 0.2);
            --text-light: rgba(255, 255, 255, 0.9);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
            url('https://theaseanmagazine.asean.org/files/media/2024/03/issue36-42-1.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .dashboard-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            backdrop-filter: blur(10px);
        }

        .card {
            background: var(--card-bg);
            border-radius: 15px;
            padding: 2.5rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            border: 1px solid var(--card-border);
            backdrop-filter: blur(10px);
        }

        h1 {
            text-align: center;
            margin-bottom: 2rem;
            background: linear-gradient(to right, var(--primary), var(--success));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            font-size: 2.2rem;
        }

        .icon {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--primary-light);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text-light);
            font-weight: 500;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 0.8rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            color: white;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.3);
        }

        .btn {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            color: white;
            font-weight: 600;
            text-align: center;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-top: 1rem;
            background: linear-gradient(to right, var(--primary), var(--primary-light));
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(0, 0, 0, 0.3);
        }

        .message {
            text-align: center;
            margin-bottom: 1.5rem;
            padding: 0.8rem;
            border-radius: 8px;
        }

        .error {
            background-color: rgba(247, 37, 133, 0.2);
            color: #ff6b9d;
            border-left: 4px solid var(--danger);
        }

        .success {
            background-color: rgba(76, 201, 240, 0.2);
            color: #4cc9f0;
            border-left: 4px solid var(--success);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 2rem;
            color: var(--text-light);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: var(--primary-light);
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .dashboard-container {
                padding: 1.5rem;
                margin: 1rem;
            }

            .card {
                padding: 1.5rem;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="dashboard-container">
    <div class="card">
        <div class="icon">
            <i class="fas fa-plus-circle"></i>
        </div>
        <h1>Add New Package</h1>

        <% if (request.getAttribute("error") != null) { %>
        <div class="message error">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <% if (request.getParameter("success") != null) { %>
        <div class="message success">
            Package added successfully!
        </div>
        <% } %>

        <form action="addPackageServlet" method="post">
            <div class="form-group">
                <label for="id">Package ID:</label>
                <input type="text" name="id" id="id" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>" required>
            </div>

            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" name="title" id="title" value="<%= request.getParameter("title") != null ? request.getParameter("title") : "" %>" required>
            </div>

            <div class="form-group">
                <label for="duration">Duration (days):</label>
                <input type="number" name="duration" id="duration" min="1" value="<%= request.getParameter("duration") != null ? request.getParameter("duration") : "" %>" required>
            </div>

            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" name="price" id="price" step="0.01" min="0" value="<%= request.getParameter("price") != null ? request.getParameter("price") : "" %>" required>
            </div>

            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" name="category" id="category" value="<%= request.getParameter("category") != null ? request.getParameter("category") : "" %>" required>
            </div>

            <div class="form-group">
                <label for="destination">Destination:</label>
                <input type="text" name="destination" id="destination" value="<%= request.getParameter("destination") != null ? request.getParameter("destination") : "" %>" required>
            </div>

            <div class="form-group">
                <label for="availableSeats">Available Seats:</label>
                <input type="number" name="availableSeats" id="availableSeats" min="0" value="<%= request.getParameter("availableSeats") != null ? request.getParameter("availableSeats") : "" %>" required>
            </div>

            <button type="submit" class="btn">
                <i class="fas fa-save"></i> Add Package
            </button>
        </form>



        <a href="MainDashboard.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>
</div>
</body>
</html>