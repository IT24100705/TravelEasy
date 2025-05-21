<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="customPackage.CustomPackage" %>
<%
    List<CustomPackage> customPackages = (List<CustomPackage>) request.getAttribute("customPackages");
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Custom Packages</title>
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
            color: var(--dark);
            line-height: 1.6;
            min-height: 100vh;
            padding: 2rem 0;
        }
        .container {
            max-width: 1100px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.97);
            border-radius: 15px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.15);
            padding: 40px;
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.25);
        }
        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .page-title {
            font-size: 28px;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 10px;
        }
        .page-subtitle {
            color: var(--gray);
            font-size: 16px;
        }
        .packages-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
        }
        .package-card {
            background: rgba(248, 249, 250, 0.8);
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary);
        }
        .package-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }
        .package-title {
            font-size: 22px;
            font-weight: 600;
            color: var(--primary-dark);
        }
        .package-id {
            font-size: 14px;
            color: var(--gray);
            background: rgba(0,0,0,0.05);
            padding: 5px 10px;
            border-radius: 50px;
        }
        .package-details {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }
        .detail-item {
            margin-bottom: 15px;
        }
        .detail-label {
            font-size: 14px;
            color: var(--gray);
            margin-bottom: 5px;
            font-weight: 500;
        }
        .detail-value {
            font-size: 16px;
            font-weight: 500;
            color: var(--dark);
        }
        .price-value {
            color: var(--success);
            font-weight: bold;
            font-size: 18px;
        }
        .activities-section {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px dashed rgba(0,0,0,0.1);
        }
        .section-title {
            font-size: 16px;
            font-weight: 600;
            color: var(--secondary);
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        .section-title i {
            margin-right: 10px;
        }
        .activities-list {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .activity-tag {
            background: rgba(67, 97, 238, 0.1);
            color: var(--primary-dark);
            padding: 8px 15px;
            border-radius: 50px;
            font-size: 14px;
            font-weight: 500;
        }
        .card-actions {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px dashed rgba(0,0,0,0.1);
        }
        .action-btn {
            padding: 10px 20px;
            border-radius: 50px;
            font-weight: 500;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            display: flex;
            align-items: center;
        }
        .action-btn i {
            margin-right: 8px;
        }
        .btn-book {
            background-color: var(--success);
            color: var(--white);
        }
        .btn-book:hover {
            background-color: #3ab7d8;
            transform: translateY(-2px);
            box-shadow: 0 3px 10px rgba(76, 201, 240, 0.3);
        }
        .btn-delete {
            background-color: var(--danger);
            color: var(--white);
        }
        .btn-delete:hover {
            background-color: #e5177a;
            transform: translateY(-2px);
            box-shadow: 0 3px 10px rgba(247, 37, 133, 0.3);
        }
        .no-packages {
            text-align: center;
            padding: 40px;
            background: rgba(248, 249, 250, 0.8);
            border-radius: 10px;
        }
        .no-packages i {
            font-size: 50px;
            color: var(--gray);
            margin-bottom: 20px;
        }
        .no-packages p {
            font-size: 16px;
            color: var(--gray);
        }
        .create-new-btn {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 25px;
            background-color: var(--primary);
            color: var(--white);
            border-radius: 50px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .create-new-btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.4);
        }
        @media (max-width: 768px) {
            .container {
                padding: 25px;
            }
            .package-details {
                grid-template-columns: 1fr;
            }
            .card-actions {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1 class="page-title"><i class="fas fa-suitcase"></i> My Custom Packages</h1>
        <p class="page-subtitle">All your personally crafted travel experiences in one place</p>
    </div>

    <div class="packages-grid">
        <% if (customPackages != null && !customPackages.isEmpty()) { %>
        <% for (CustomPackage cp : customPackages) { %>
        <div class="package-card">
            <div class="card-header">
                <h2 class="package-title"><%= cp.getTitle() %></h2>
                <span class="package-id">ID: <%= cp.getPackageId() %></span>
            </div>

            <div class="package-details">
                <div class="detail-item">
                    <div class="detail-label">Destination</div>
                    <div class="detail-value"><%= cp.getDestination() %></div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Duration</div>
                    <div class="detail-value"><%= cp.getDuration() %> days</div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Category</div>
                    <div class="detail-value"><%= cp.getCategory().getName() %></div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Available Seats</div>
                    <div class="detail-value"><%= cp.getAvailableSeats() %></div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Total Price</div>
                    <div class="detail-value price-value">Rs.<%= cp.getPrice() %></div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Hotel Class</div>
                    <div class="detail-value"><%= cp.getSelectedHotelClass() %></div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Vehicle Type</div>
                    <div class="detail-value"><%= cp.getSelectedVehicleType() %></div>
                </div>
                <div class="detail-item">
                    <div class="detail-label">Driver Status</div>
                    <div class="detail-value"><%= cp.getDriverStatus() %></div>
                </div>
            </div>

            <div class="activities-section">
                <h3 class="section-title"><i class="fas fa-hiking"></i> Included Activities</h3>
                <div class="activities-list">
                    <% for (String activity : cp.getSelectedActivities()) { %>
                    <span class="activity-tag"><%= activity %></span>
                    <% } %>
                </div>
            </div>

            <div class="card-actions">
                <form action="BookPackageServlet" method="post" style="display: inline;">
                    <input type="hidden" name="packageId" value="<%= cp.getPackageId() %>">
                    <input type="hidden" name="packageType" value="custom">
                    <button type="submit" class="action-btn btn-book">
                        <i class="fas fa-calendar-check"></i> Book Now
                    </button>
                </form>
                <form action="DeleteCustomPackageServlet" method="post" style="display: inline;">
                    <input type="hidden" name="packageId" value="<%= cp.getPackageId() %>">
                    <button type="submit" class="action-btn btn-delete" onclick="return confirm('Are you sure you want to delete this package?');">
                        <i class="fas fa-trash-alt"></i> Delete
                    </button>
                </form>
            </div>
        </div>
        <% } %>
        <% } else { %>
        <div class="no-packages">
            <i class="far fa-folder-open"></i>
            <p>You haven't created any custom packages yet.</p>
            <a href="CustomPackageBuilderServlet" class="create-new-btn">
                <i class="fas fa-plus"></i> Create New Package
            </a>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>