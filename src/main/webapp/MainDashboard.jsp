<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard</title>
    <style>
        :root {
            --primary: #4361ee;
            --primary-light: #4895ef;
            --success: #4cc9f0;
            --danger: #f72585;
            --warning: #f8961e;
            --purple: #7209b7;
            --pink: #f72585;
            --teal: #38b000;
            --orange: #f8961e;
            --dark: #2b2d42;
            --light: #f8f9fc;
            --card-bg: rgba(255, 255, 255, 0.9);
            --card-border: rgba(255, 255, 255, 0.2);
            --text-dark: #333;
            --text-light: #666;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            color: var(--text-dark);
            min-height: 100vh;
            overflow-x: hidden;
        }

        .dashboard-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
        }

        .header {
            text-align: center;
            margin-bottom: 3rem;
            animation: fadeIn 1s ease-in-out;
        }

        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            background: linear-gradient(to right, #4361ee, #f72585, #f8961e);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            display: inline-block;
        }

        .header p {
            font-size: 1.1rem;
            color: var(--text-light);
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            perspective: 1000px;
        }

        .card {
            background: var(--card-bg);
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border: none;
            position: relative;
            overflow: hidden;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, var(--primary), var(--pink), var(--orange));
        }

        .card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }

        .card h3 {
            color: var(--text-dark);
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
            position: relative;
            display: inline-block;
        }

        .card h3::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: linear-gradient(to right, var(--primary), var(--pink));
            border-radius: 3px;
        }

        .icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, var(--primary), var(--pink));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(0, 0, 0, 0.15);
        }

        .btn i {
            margin-right: 8px;
            font-size: 1.1rem;
        }

        .btn-primary {
            background: linear-gradient(to right, var(--primary), var(--primary-light));
        }

        .btn-success {
            background: linear-gradient(to right, var(--teal), var(--success));
        }

        .btn-danger {
            background: linear-gradient(to right, var(--pink), var(--danger));
        }

        .btn-warning {
            background: linear-gradient(to right, var(--orange), var(--warning));
        }

        .btn-purple {
            background: linear-gradient(to right, var(--purple), #9d4edd);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .floating {
            animation: float 4s ease-in-out infinite;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card-container {
                grid-template-columns: 1fr;
            }

            .header h1 {
                font-size: 2rem;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="dashboard-container">
    <div class="header">
        <h1><i class="fas fa-tachometer-alt"></i> TravelEasy Admin Dashboard</h1>
        <p>Manage your travel packages, bookings, and admin accounts with ease</p>
    </div>

    <div class="card-container">
        <!-- Package Management Section -->
        <div class="card floating" style="animation-delay: 0.1s;">
            <div class="icon"><i class="fas fa-suitcase-rolling"></i></div>
            <h3>Package Management</h3>
            <div class="btn-group">
                <a href="${pageContext.request.contextPath}/addPackageServlet?action=add" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Add Package
                </a>
                <a href="${pageContext.request.contextPath}/TravelPackages" class="btn btn-success">
                    <i class="fas fa-list"></i> View Packages
                </a>
                <a href="${pageContext.request.contextPath}/DeletePackageServlet?action=" class="btn btn-danger">
                    <i class="fas fa-trash"></i> Delete Package
                </a>
            </div>
        </div>

        <!-- Booking Management Section -->
        <div class="card floating" style="animation-delay: 0.2s;">
            <div class="icon"><i class="fas fa-calendar-check"></i></div>
            <h3>Booking Management</h3>
            <div class="btn-group">
                <a href="${pageContext.request.contextPath}/ViewBookingsServlet" class="btn btn-purple">
                    <i class="fas fa-list"></i> View All Bookings
                </a>
            </div>
        </div>

        <!-- Admin Management Section -->
        <div class="card floating" style="animation-delay: 0.3s;">
            <div class="icon"><i class="fas fa-users-cog"></i></div>
            <h3>Admin Management</h3>
            <div class="btn-group">
                <a href="${pageContext.request.contextPath}/add" class="btn btn-primary">
                    <i class="fas fa-user-plus"></i> Add Admin
                </a>
                <a href="${pageContext.request.contextPath}/admin/list" class="btn btn-success">
                    <i class="fas fa-users"></i> View Admins
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>