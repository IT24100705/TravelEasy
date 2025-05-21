<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.packagemanagement.TravelPackage" %>
<html>
<head>
    <title>Travel Packages</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
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
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        h1 {
            text-align: center;
            color: var(--white);
            margin-bottom: 2.5rem;
            font-size: 2.5rem;
            font-weight: 600;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .sort-button {
            text-align: center;
            margin-bottom: 2rem;
        }

        .sort-button button {
            background-color: var(--primary);
            color: var(--white);
            border: none;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            font-weight: 500;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .sort-button button:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }

        .packages-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 1.5rem;
        }

        .package-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
            padding: 1.75rem;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .package-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.2);
        }

        .package-card h2 {
            color: var(--primary);
            margin-bottom: 1rem;
            font-size: 1.5rem;
            font-weight: 600;
            border-bottom: 2px solid var(--success);
            padding-bottom: 0.5rem;
        }

        .package-details {
            margin-bottom: 1.5rem;
        }

        .package-details p {
            margin: 0.75rem 0;
            font-size: 1rem;
            color: var(--dark);
            display: flex;
        }

        .label {
            font-weight: 500;
            color: var(--secondary);
            min-width: 120px;
            display: inline-block;
        }

        .action-buttons {
            display: flex;
            gap: 0.75rem;
            margin-top: 1.25rem;
        }

        .action-buttons form {
            flex: 1;
        }

        .action-buttons button {
            width: 100%;
            padding: 0.75rem;
            font-size: 0.95rem;
            font-weight: 500;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .action-buttons button:first-child {
            background-color: var(--success);
            color: var(--white);
        }

        .action-buttons button:first-child:hover {
            background-color: #3aa8d8;
            transform: translateY(-2px);
        }

        .add-to-cart {
            background-color: var(--warning);
            color: var(--white);
        }

        .add-to-cart:hover {
            background-color: #e68a19;
            transform: translateY(-2px);
        }

        .no-packages {
            text-align: center;
            font-size: 1.25rem;
            color: var(--light);
            background-color: rgba(0, 0, 0, 0.6);
            padding: 2rem;
            border-radius: 12px;
            margin-top: 2rem;
            backdrop-filter: blur(5px);
        }

        @media (max-width: 768px) {
            .container {
                padding: 1.5rem;
            }

            h1 {
                font-size: 2rem;
            }

            .packages-container {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Discover Your Dream Vacation</h1>

    <div class="sort-button">
        <form action="TravelPackages" method="get">
            <input type="hidden" name="sort" value="price">
            <button type="submit">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" style="margin-right: 8px;">
                    <path d="M3.5 2.5a.5.5 0 0 0-1 0v8.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L3.5 11.293V2.5zm3.5 1a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM7.5 6a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zm0 3a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3zm0 3a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/>
                </svg>
                Sort by Price
            </button>
        </form>
    </div>

    <div class="packages-container">
        <%
            List<TravelPackage> packages = (List<TravelPackage>) request.getAttribute("packages");
            if (packages != null && !packages.isEmpty()) {
                for (TravelPackage pkg : packages) {
        %>
        <div class="package-card">
            <h2><%= pkg.getTitle() %></h2>
            <div class="package-details">
                <p><span class="label">Package ID:</span> <%= pkg.getPackageId() %></p>
                <p><span class="label">Destination:</span> <%= pkg.getDestination() %></p>
                <p><span class="label">Duration:</span> <%= pkg.getDuration() %> days</p>
                <p><span class="label">Price:</span> Rs. <%= pkg.getPrice() %></p>
                <p><span class="label">Category:</span> <%= pkg.getCategory().getName() %></p>
                <p><span class="label">Availability:</span> <%= pkg.getAvailableSeats() %> seats</p>
            </div>

            <div class="action-buttons">
                <!-- Book Now button -->
                <form action="BookPackageServlet" method="post">
                    <input type="hidden" name="packageId" value="<%= pkg.getPackageId() %>">
                    <input type="hidden" name="packageType" value="default">
                    <% System.out.println("Package ID: " + pkg.getPackageId()); %>
                    <button type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M6 1v3H1V1h5zM1 0a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1H1zm14 12v3h-5v-3h5zm-5-1a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-5zM6 8v7H1V8h5zM1 7a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V8a1 1 0 0 0-1-1H1zm14-6v7h-5V1h5zm-5-1a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1h-5z"/>
                        </svg>
                        Book Now
                    </button>
                </form>

                <!-- Add to Cart button -->
                <form action="/addToCart" method="post">
                    <input type="hidden" name="packageId" value="<%= pkg.getPackageId() %>">
                    <input type="hidden" name="packageType" value="default">
                    <button type="submit" class="add-to-cart">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </svg>
                        Add to Cart
                    </button>
                </form>
            </div>
        </div>
        <%
            }
        } else {
        %>
    </div>
    <div class="no-packages">
        <p>No travel packages available at the moment. Please check back later!</p>
    </div>
    <%
        }
    %>
</div>
</body>
</html>