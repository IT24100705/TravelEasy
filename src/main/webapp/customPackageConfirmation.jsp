<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="customPackage.CustomPackage" %>
<%
    CustomPackage cp = (CustomPackage) request.getAttribute("customPackage");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Package Confirmation</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --primary-dark: #3a56d4;
            --secondary: #3f37c9;
            --success: #4cc9f0;
            --warning: #f8961e;
            --danger: #f72585;
            --light: #f8f9fa;
            --dark: #212529;
            --gray: #6c757d;
            --white: #ffffff;
        }
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
            url('https://theaseanmagazine.asean.org/files/media/2024/03/issue36-42-1.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .confirmation-container {
            width: 100%;
            max-width: 900px;
            background: rgba(255, 255, 255, 0.97);
            border-radius: 15px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.15);
            padding: 40px;
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.25);
            animation: fadeInUp 0.6s ease-out;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .success-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .success-icon {
            font-size: 60px;
            color: var(--success);
            margin-bottom: 15px;
        }
        .success-title {
            font-size: 28px;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 10px;
        }
        .success-subtitle {
            color: var(--gray);
            font-size: 16px;
        }
        .package-summary {
            background: rgba(248, 249, 250, 0.8);
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 30px;
            border: 1px solid rgba(0,0,0,0.05);
        }
        .summary-title {
            font-size: 22px;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid rgba(67, 97, 238, 0.1);
        }
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
        .summary-item {
            margin-bottom: 15px;
        }
        .summary-label {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 5px;
            font-weight: 500;
        }
        .summary-value {
            font-size: 16px;
            font-weight: 500;
            color: var(--dark);
        }
        .price-value {
            color: var(--success);
            font-weight: bold;
            font-size: 20px;
        }
        .activities-list {
            margin: 10px 0 0 20px;
        }
        .activities-list li {
            list-style-type: disc;
            margin-bottom: 5px;
        }
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }
        .action-btn {
            padding: 12px 25px;
            border-radius: 50px;
            font-weight: 500;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }
        .action-btn i {
            margin-right: 8px;
        }
        .btn-primary {
            background-color: var(--primary);
            color: var(--white);
        }
        .btn-primary:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.4);
        }
        .btn-secondary {
            background-color: var(--success);
            color: var(--white);
        }
        .btn-secondary:hover {
            background-color: #3ab7d8;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 201, 240, 0.4);
        }
        .no-package {
            text-align: center;
            padding: 30px;
            color: var(--danger);
            background: rgba(247, 37, 133, 0.1);
            border-radius: 8px;
            font-weight: 500;
        }
        @media (max-width: 768px) {
            .confirmation-container {
                padding: 25px;
            }
            .summary-grid {
                grid-template-columns: 1fr;
            }
            .action-buttons {
                flex-direction: column;
                gap: 15px;
            }
            .action-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="confirmation-container">
    <div class="success-header">
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <h1 class="success-title">Package Created Successfully!</h1>
        <p class="success-subtitle">Your custom travel package has been saved and is ready for booking</p>
    </div>

    <% if (cp != null) { %>
    <div class="package-summary">
        <h2 class="summary-title"><%= cp.getTitle() %></h2>
        <div class="summary-grid">
            <div class="summary-item">
                <div class="summary-label">Package ID</div>
                <div class="summary-value"><%= cp.getPackageId() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Destination</div>
                <div class="summary-value"><%= cp.getDestination() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Duration</div>
                <div class="summary-value"><%= cp.getDuration() %> days</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Category</div>
                <div class="summary-value"><%= cp.getCategory().getName() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Available Seats</div>
                <div class="summary-value"><%= cp.getAvailableSeats() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Total Price</div>
                <div class="summary-value price-value">Rs.<%= cp.getPrice() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Hotel Class</div>
                <div class="summary-value"><%= cp.getSelectedHotelClass() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Vehicle Type</div>
                <div class="summary-value"><%= cp.getSelectedVehicleType() %></div>
            </div>
            <div class="summary-item">
                <div class="summary-label">Driver Status</div>
                <div class="summary-value"><%= cp.getDriverStatus() %></div>
            </div>
            <div class="summary-item full-width">
                <div class="summary-label">Activities</div>
                <ul class="activities-list">
                    <% for (String activity : cp.getSelectedActivities()) { %>
                    <li><%= activity %></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>

    <div class="action-buttons">
        <form action="BookPackageServlet" method="post" style="display: inline;">
            <input type="hidden" name="packageId" value="<%= cp.getPackageId() %>">
            <input type="hidden" name="packageType" value="custom">
        </form>
        <a href="ViewCustomPackagesServlet" class="action-btn btn-primary">
            <i class="fas fa-list-ul"></i> View All Packages
        </a>
    </div>
    <% } else { %>
    <div class="no-package">
        <p>No custom package information found.</p>
    </div>
    <% } %>
</div>
</body>
</html>