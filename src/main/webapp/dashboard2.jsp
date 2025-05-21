<%--
  Created by IntelliJ IDEA.
  User: nethmini
  Date: 5/19/25
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelEasy - Your Sri Lankan Travel Partner</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #2a5c8a;
            --secondary: #f7941d;
            --light: #f8f9fa;
            --dark: #212529;
            --white: #ffffff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--dark);
            line-height: 1.6;
        }

        /* Navigation */
        nav {
            background-color: var(--primary);
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .logo {
            color: var(--white);
            font-size: 1.5rem;
            font-weight: 600;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin-left: 2rem;
        }

        .nav-links a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            color: var(--secondary);
        }

        .btn {
            padding: 0.5rem 1.5rem;
            border-radius: 4px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-outline {
            border: 2px solid var(--white);
            color: var(--white);
        }

        .btn-outline:hover {
            background-color: var(--white);
            color: var(--primary);
        }

        /* Hero Section */
        .hero {
            height: 60vh;
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
            url('https://images.unsplash.com/photo-1562613521-9d0d98770f8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1920&q=80') no-repeat center center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: var(--white);
        }

        .hero-content h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
        }

        .btn-primary {
            background-color: var(--secondary);
            color: var(--white);
            display: inline-block;
        }

        .btn-primary:hover {
            background-color: #e0851a;
            color: var(--white);
        }

        /* Packages Section */
        .packages-section {
            padding: 5rem 10%;
            text-align: center;
        }

        .packages-section h2 {
            font-size: 2.5rem;
            margin-bottom: 2rem;
            color: var(--primary);
        }

        .packages-grid {
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
            margin-bottom: 3rem;
        }

        .package-card {
            background-color: var(--white);
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            width: 350px;
            transition: transform 0.3s ease;
        }

        .package-card:hover {
            transform: translateY(-10px);
        }

        .package-image {
            height: 200px;
            background-size: cover;
            background-position: center;
        }

        .package-info {
            padding: 1.5rem;
            text-align: left;
        }

        .package-info h3 {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            color: var(--primary);
        }

        .package-details {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .detail-item {
            display: flex;
            align-items: center;
            font-size: 0.9rem;
        }

        .detail-item i {
            color: var(--secondary);
            margin-right: 0.5rem;
        }

        .package-price {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--secondary);
            margin: 1rem 0;
        }

        /* Custom Tour CTA */
        .custom-tour {
            background-color: var(--primary);
            color: var(--white);
            padding: 3rem;
            text-align: center;
            margin-top: 2rem;
        }

        .custom-tour h3 {
            font-size: 1.8rem;
            margin-bottom: 1rem;
        }

        .custom-tour p {
            max-width: 600px;
            margin: 0 auto 2rem;
        }

        /* Footer */
        footer {
            background-color: var(--dark);
            color: var(--white);
            padding: 3rem 10%;
            text-align: center;
        }

        .footer-content {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-bottom: 2rem;
        }

        .footer-column {
            flex: 1;
            min-width: 250px;
            margin-bottom: 2rem;
        }

        .footer-column h4 {
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
            color: var(--secondary);
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 0.5rem;
        }

        .footer-links a {
            color: var(--light);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .footer-links a:hover {
            color: var(--secondary);
        }

        .social-links {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 1rem;
        }

        .social-links a {
            color: var(--white);
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            color: var(--secondary);
        }

        .copyright {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid rgba(255,255,255,0.1);
        }

        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 2.2rem;
            }

            .hero-content p {
                font-size: 1rem;
            }

            .nav-links li {
                margin-left: 1rem;
            }
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav>
    <a href="#" class="logo">TravelEasy</a>
    <ul class="nav-links">
        <li><a href="#">Home</a></li>
        <li><a href="travelpackages.jsp">Travel Packages</a></li>
        <li><a href="custompackages.jsp">Customize Tour</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="logout.jsp" class="btn btn-outline">Log Out</a></li>
    </ul>
</nav>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-content">
        <h1>Discover the Wonders of Sri Lanka</h1>
        <p>Experience breathtaking landscapes, rich culture, and unforgettable adventures</p>
    </div>
</section>

<!-- Packages Section -->
<section class="packages-section">
    <h2>Featured Travel Packages</h2>

    <div class="packages-grid">
        <!-- Package 1 -->
        <div class="package-card">
            <div class="package-image" style="background-image: url('https://images.unsplash.com/photo-1583423230902-754c3b1252f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1920&q=80');"></div>
            <div class="package-info">
                <h3>Explore Ella & Nuwara Eliya</h3>
                <div class="package-details">
                    <div class="detail-item">
                        <i class="fas fa-hashtag"></i> PKG001
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-clock"></i> 4 Days
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-tag"></i> Adventure
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-map-marker-alt"></i> Hill Country
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-chair"></i> 15 Seats
                    </div>
                </div>
                <div class="package-price">Rs. 42,000</div>
            </div>
        </div>

        <!-- Package 2 -->
        <div class="package-card">
            <div class="package-image" style="background-image: url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1920&q=80');"></div>
            <div class="package-info">
                <h3>Relax in Mirissa & Unawatuna</h3>
                <div class="package-details">
                    <div class="detail-item">
                        <i class="fas fa-hashtag"></i> PKG002
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-clock"></i> 5 Days
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-tag"></i> Honeymoon
                    </div>
                    <div class="detail-item"> <!-- Fixed typo here -->
                        <i class="fas fa-map-marker-alt"></i> South Coast
                    </div>
                    <div class="detail-item">
                        <i class="fas fa-chair"></i> 10 Seats
                    </div>
                </div>
                <div class="package-price">Rs. 48,000</div>
            </div>
        </div>
    </div>

    <a href="TravelPackages" class="btn btn-primary">View All Packages</a>

    <div class="custom-tour">
        <h3>Want Something Tailored Just For You?</h3>
        <p>Create your perfect Sri Lankan adventure with our custom tour packages</p>
        <a href="CustomPackageBuilderServlet" class="btn btn-primary">Customize Your Tour</a>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-content">
        <div class="footer-column">
            <h4>Quick Links</h4>
            <ul class="footer-links">
                <li><a href="#">Home</a></li>
                <li><a href="TravelPackages">Travel Packages</a></li>
                <li><a href="CustomPackageBuilderServlet">Custom Tours</a></li>
                <li><a href="#">About Us</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h4>Contact Us</h4>
            <ul class="footer-links">
                <li><i class="fas fa-map-marker-alt"></i> 123 Galle Road, Colombo</li>
                <li><i class="fas fa-phone"></i> +94 112 345 678</li>
                <li><i class="fas fa-envelope"></i> info@traveeasy.com</li>
            </ul>
        </div>
        <div class="footer-column">
            <h4>Follow Us</h4>
            <div class="social-links">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </div>
    <div class="copyright">
        <p>© 2023 TravelEasy. All Rights Reserved.</p>
    </div>
</footer>
</body>
</html>
