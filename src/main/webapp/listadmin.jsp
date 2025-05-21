<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, entities.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TravelEasy - Admin Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-light: #e0e7ff;
            --primary-hover: #3a56d4;
            --danger-color: #ef233c;
            --danger-light: #ffe0e3;
            --danger-hover: #d90429;
            --success-color: #2ecc71;
            --success-light: #e0f7ed;
            --text-color: #2b2d42;
            --text-light: #8d99ae;
            --light-gray: #f8f9fa;
            --border-color: #e9ecef;
            --card-bg: #ffffff;
            --shadow-sm: 0 1px 3px rgba(0,0,0,0.12);
            --shadow-md: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -1px rgba(0,0,0,0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0,0,0,0.1), 0 4px 6px -2px rgba(0,0,0,0.05);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background-color: #f5f7fa;
            color: var(--text-color);
            line-height: 1.6;
            background-image: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 2.5rem;
            background: var(--card-bg);
            border-radius: 16px;
            box-shadow: var(--shadow-lg);
            border: 1px solid rgba(255,255,255,0.3);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }

        h1 {
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            font-weight: 600;
            font-size: 2.25rem;
            text-align: center;
            position: relative;
            display: inline-block;
            width: 100%;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--primary-color);
            border-radius: 2px;
        }

        .message {
            padding: 1rem 1.5rem;
            margin: 1.5rem 0;
            border-radius: 8px;
            font-weight: 500;
            display: flex;
            align-items: center;
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .success {
            background-color: var(--success-light);
            color: var(--success-color);
            border-left: 4px solid var(--success-color);
        }

        .success i {
            margin-right: 10px;
        }

        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.75rem 1.5rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 0.95rem;
            transition: var(--transition);
            text-decoration: none;
            font-weight: 500;
            letter-spacing: 0.5px;
            box-shadow: var(--shadow-sm);
        }

        .btn i {
            margin-right: 8px;
        }

        .btn:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .btn:active {
            transform: translateY(0);
        }

        .btn-danger {
            background-color: var(--danger-color);
        }

        .btn-danger:hover {
            background-color: var(--danger-hover);
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
        }

        .table-responsive {
            overflow-x: auto;
            margin-top: 1.5rem;
            border-radius: 12px;
            box-shadow: var(--shadow-sm);
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 1rem;
            border-radius: 12px;
            overflow: hidden;
        }

        th {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem 1.5rem;
            text-align: left;
            font-weight: 500;
            position: sticky;
            top: 0;
        }

        th:first-child {
            border-top-left-radius: 12px;
        }

        th:last-child {
            border-top-right-radius: 12px;
        }

        td {
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid var(--border-color);
            vertical-align: middle;
            transition: var(--transition);
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:nth-child(even) {
            background-color: rgba(248, 249, 250, 0.5);
        }

        tr:hover td {
            background-color: var(--primary-light);
            transform: scale(1.01);
        }

        .actions {
            display: flex;
            gap: 0.75rem;
        }

        .no-data {
            text-align: center;
            color: var(--text-light);
            padding: 2rem;
            font-style: italic;
        }

        .travel-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .travel-header h2 {
            color: var(--primary-color);
            font-size: 1.75rem;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .travel-logo {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
            display: inline-block;
        }

        .admin-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary-light);
            color: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 12px;
        }

        .admin-name {
            display: flex;
            align-items: center;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1.5rem;
                margin: 1rem;
            }

            th, td {
                padding: 0.75rem 1rem;
            }

            .actions {
                flex-direction: column;
                gap: 0.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="travel-header">
        <div class="travel-logo">
            <i class="fas fa-plane"></i>
        </div>
        <h2>TravelEasy</h2>
        <h1>Admin Management</h1>
    </div>

    <%-- Success Message --%>
    <% String success = request.getParameter("success");
        if (success != null) { %>
    <div class="message success">
        <i class="fas fa-check-circle"></i>
        <% if ("added".equals(success)) { %>
        Admin added successfully!
        <% } else if ("deleted".equals(success)) { %>
        Admin deleted successfully!
        <% } %>
    </div>
    <% } %>

    <div class="action-bar">
        <a href="${pageContext.request.contextPath}/add" class="btn">
            <i class="fas fa-plus"></i> Add New Admin
        </a>
    </div>

    <div class="table-responsive">
        <table>
            <thead>
            <tr>
                <th>Admin</th>
                <th>Contact</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% List<User> admins = (List<User>) request.getAttribute("admins");
                if (admins != null && !admins.isEmpty()) {
                    for (User admin : admins) { %>
            <tr>
                <td>
                    <div class="admin-name">
                        <div class="admin-avatar">
                            <%= admin.getName().substring(0, 1).toUpperCase() %>
                        </div>
                        <div>
                            <div style="font-weight: 500;"><%= admin.getName() %></div>
                            <div style="font-size: 0.85rem; color: var(--text-light);">
                                <%= admin.getRole().substring(0, 1).toUpperCase() + admin.getRole().substring(1) %>
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <div style="margin-bottom: 4px;"><i class="fas fa-envelope" style="margin-right: 8px; color: var(--primary-color);"></i><%= admin.getEmail() %></div>
                    <div><i class="fas fa-phone" style="margin-right: 8px; color: var(--primary-color);"></i><%= admin.getTelephone() %></div>
                </td>
                <td class="actions">
                    <form action="${pageContext.request.contextPath}/admin/delete" method="post" style="display: inline;">
                        <input type="hidden" name="email" value="<%= admin.getEmail() %>">
                        <button type="submit" class="btn btn-danger btn-sm">
                            <i class="fas fa-trash-alt"></i> Remove
                        </button>
                    </form>
                </td>
            </tr>
            <% }
            } else { %>
            <tr>
                <td colspan="3" class="no-data">
                    <i class="fas fa-user-slash" style="font-size: 1.5rem; margin-bottom: 0.5rem;"></i>
                    <div>No admin accounts found</div>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>